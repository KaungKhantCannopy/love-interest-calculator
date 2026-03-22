import 'zodiac_sign.dart';

class ZodiacCompatibility {
  const ZodiacCompatibility({
    required this.score,
    required this.label,
    required this.emoji,
    required this.description,
    required this.elementSummary,
    required this.modalitySummary,
    required this.chemistry,
    required this.challenge,
    required this.habitTip,
    required this.modalityInsight,
    required this.isSameSign,
    required this.isOppositePair,
  });

  final int score;
  final String label;
  final String emoji;
  final String description;
  final String elementSummary;
  final String modalitySummary;
  final String chemistry;
  final String challenge;
  final String habitTip;
  final String modalityInsight;
  final bool isSameSign;
  final bool isOppositePair;
}

class ZodiacPairResult {
  const ZodiacPairResult({
    required this.firstDate,
    required this.secondDate,
    required this.firstSign,
    required this.secondSign,
    required this.compatibility,
  });

  final DateTime firstDate;
  final DateTime secondDate;
  final ZodiacSign firstSign;
  final ZodiacSign secondSign;
  final ZodiacCompatibility compatibility;
}
