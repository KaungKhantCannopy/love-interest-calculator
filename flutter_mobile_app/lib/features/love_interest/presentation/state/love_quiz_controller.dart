import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/love_question.dart';
import '../../domain/usecases/calculate_love_result.dart';
import 'love_quiz_state.dart';

class LoveQuizController extends StateNotifier<LoveQuizState> {
  LoveQuizController({
    required List<LoveQuestion> questions,
    required CalculateLoveResult calculateResult,
  }) : _questions = questions,
       _calculateResult = calculateResult,
       super(const LoveQuizState());

  final List<LoveQuestion> _questions;
  final CalculateLoveResult _calculateResult;

  bool isAnswered(String questionId) => state.answers.containsKey(questionId);

  void answerQuestion({required String questionId, required int score}) {
    final updated = Map<String, int>.from(state.answers)..[questionId] = score;
    state = state.copyWith(answers: updated, clearAnalysis: true);
  }

  void previousStep() {
    if (state.currentIndex == 0) return;
    state = state.copyWith(currentIndex: state.currentIndex - 1);
  }

  void nextStep() {
    final currentQuestion = _questions[state.currentIndex];
    final currentAnswered = state.answers.containsKey(currentQuestion.id);
    if (!currentAnswered) return;

    if (state.currentIndex < _questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
      return;
    }

    final analysis = _calculateResult(state.answers);
    state = state.copyWith(analysis: analysis);
  }

  void restart() {
    state = const LoveQuizState();
  }
}
