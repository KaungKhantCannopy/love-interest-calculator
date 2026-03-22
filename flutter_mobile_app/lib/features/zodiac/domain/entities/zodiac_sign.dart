class ZodiacSign {
  const ZodiacSign({
    required this.id,
    required this.name,
    required this.symbol,
    required this.emoji,
    required this.dateRange,
    required this.startMonth,
    required this.startDay,
    required this.endMonth,
    required this.endDay,
    required this.element,
    required this.modality,
    required this.rulingPlanet,
    required this.accentHex,
    required this.behaviors,
    required this.habits,
    required this.cosmicTip,
  });

  final String id;
  final String name;
  final String symbol;
  final String emoji;
  final String dateRange;
  final int startMonth;
  final int startDay;
  final int endMonth;
  final int endDay;
  final String element;
  final String modality;
  final String rulingPlanet;
  final int accentHex;
  final List<String> behaviors;
  final List<String> habits;
  final String cosmicTip;
}
