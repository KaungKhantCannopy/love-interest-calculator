class LoveOption {
  const LoveOption({required this.label, required this.score});

  final String label;
  final int score;
}

class LoveQuestion {
  const LoveQuestion({
    required this.id,
    required this.prompt,
    required this.options,
  });

  final String id;
  final String prompt;
  final List<LoveOption> options;
}
