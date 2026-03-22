class LoveLevel {
  const LoveLevel({
    required this.label,
    required this.emoji,
    required this.description,
  });

  final String label;
  final String emoji;
  final String description;
}

class NextMove {
  const NextMove({
    required this.title,
    required this.advice,
    required this.actions,
  });

  final String title;
  final String advice;
  final List<String> actions;
}

class LoveAnalysis {
  const LoveAnalysis({
    required this.score,
    required this.level,
    required this.confidence,
    required this.redFlags,
    required this.nextMove,
  });

  final int score;
  final LoveLevel level;
  final String confidence;
  final List<String> redFlags;
  final NextMove nextMove;
}
