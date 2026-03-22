import '../../domain/entities/love_result.dart';

class LoveQuizState {
  const LoveQuizState({
    this.currentIndex = 0,
    this.answers = const {},
    this.analysis,
  });

  final int currentIndex;
  final Map<String, int> answers;
  final LoveAnalysis? analysis;

  bool get hasResult => analysis != null;

  LoveQuizState copyWith({
    int? currentIndex,
    Map<String, int>? answers,
    LoveAnalysis? analysis,
    bool clearAnalysis = false,
  }) {
    return LoveQuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      analysis: clearAnalysis ? null : (analysis ?? this.analysis),
    );
  }
}
