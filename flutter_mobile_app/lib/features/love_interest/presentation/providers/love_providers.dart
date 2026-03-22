import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/love_repository_impl.dart';
import '../../domain/entities/love_question.dart';
import '../../domain/repositories/love_repository.dart';
import '../../domain/usecases/calculate_love_result.dart';
import '../state/love_quiz_controller.dart';
import '../state/love_quiz_state.dart';

final loveRepositoryProvider = Provider<LoveRepository>((ref) {
  return LoveRepositoryImpl();
});

final loveQuestionsProvider = Provider<List<LoveQuestion>>((ref) {
  return ref.watch(loveRepositoryProvider).getQuestions();
});

final calculateLoveResultProvider = Provider<CalculateLoveResult>((ref) {
  return CalculateLoveResult(ref.watch(loveRepositoryProvider));
});

final loveQuizControllerProvider =
    StateNotifierProvider.autoDispose<LoveQuizController, LoveQuizState>((ref) {
      final questions = ref.watch(loveQuestionsProvider);
      final calculateResult = ref.watch(calculateLoveResultProvider);

      return LoveQuizController(
        questions: questions,
        calculateResult: calculateResult,
      );
    });
