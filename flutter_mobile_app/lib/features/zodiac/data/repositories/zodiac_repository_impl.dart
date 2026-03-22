import '../../domain/entities/zodiac_compatibility.dart';
import '../../domain/entities/zodiac_sign.dart';
import '../../domain/repositories/zodiac_repository.dart';

class ZodiacRepositoryImpl implements ZodiacRepository {
  static const List<ZodiacSign> _signs = [
    ZodiacSign(
      id: 'aries',
      name: 'Aries',
      symbol: '♈',
      emoji: '🐏',
      dateRange: 'March 21 - April 19',
      startMonth: 3,
      startDay: 21,
      endMonth: 4,
      endDay: 19,
      element: 'Fire',
      modality: 'Cardinal',
      rulingPlanet: 'Mars',
      accentHex: 0xFFFF6B6B,
      behaviors: [
        'Bold and quick to take initiative.',
        'Prefers action over long overthinking.',
        'Shows affection through direct encouragement.',
      ],
      habits: [
        'Starts things fast when inspired.',
        'Thrives with movement and challenge.',
        'Learns through trial and action.',
      ],
      cosmicTip: 'Aries shines with exciting goals and healthy momentum.',
    ),
    ZodiacSign(
      id: 'taurus',
      name: 'Taurus',
      symbol: '♉',
      emoji: '🐂',
      dateRange: 'April 20 - May 20',
      startMonth: 4,
      startDay: 20,
      endMonth: 5,
      endDay: 20,
      element: 'Earth',
      modality: 'Fixed',
      rulingPlanet: 'Venus',
      accentHex: 0xFF6BCB77,
      behaviors: [
        'Steady, grounded, and comfort-seeking.',
        'Builds trust slowly and deeply.',
        'Expresses love with consistency.',
      ],
      habits: [
        'Loves stable routines and cozy spaces.',
        'Patient with long-term plans.',
        'Finds joy in quality over speed.',
      ],
      cosmicTip: 'Taurus thrives with peace, beauty, and reliability.',
    ),
    ZodiacSign(
      id: 'gemini',
      name: 'Gemini',
      symbol: '♊',
      emoji: '🦋',
      dateRange: 'May 21 - June 20',
      startMonth: 5,
      startDay: 21,
      endMonth: 6,
      endDay: 20,
      element: 'Air',
      modality: 'Mutable',
      rulingPlanet: 'Mercury',
      accentHex: 0xFF4DABF7,
      behaviors: [
        'Curious and socially agile.',
        'Loves conversation and novelty.',
        'Connects through ideas and humor.',
      ],
      habits: [
        'Switches between interests often.',
        'Recharges via learning and social time.',
        'Thinks quickly and speaks quickly.',
      ],
      cosmicTip: 'Gemini feels alive when life stays mentally fresh.',
    ),
    ZodiacSign(
      id: 'cancer',
      name: 'Cancer',
      symbol: '♋',
      emoji: '🦀',
      dateRange: 'June 21 - July 22',
      startMonth: 6,
      startDay: 21,
      endMonth: 7,
      endDay: 22,
      element: 'Water',
      modality: 'Cardinal',
      rulingPlanet: 'Moon',
      accentHex: 0xFF74C0FC,
      behaviors: [
        'Protective, intuitive, and caring.',
        'Reads emotional tone quickly.',
        'Values trust and emotional safety.',
      ],
      habits: [
        'Creates cozy routines around home.',
        'Keeps meaningful memories close.',
        'Needs emotional security to open up.',
      ],
      cosmicTip: 'Cancer grows when boundaries and care stay balanced.',
    ),
    ZodiacSign(
      id: 'leo',
      name: 'Leo',
      symbol: '♌',
      emoji: '🦁',
      dateRange: 'July 23 - August 22',
      startMonth: 7,
      startDay: 23,
      endMonth: 8,
      endDay: 22,
      element: 'Fire',
      modality: 'Fixed',
      rulingPlanet: 'Sun',
      accentHex: 0xFFFFA94D,
      behaviors: [
        'Warm, expressive, and generous.',
        'Leads with heart and confidence.',
        'Enjoys celebrating loved ones.',
      ],
      habits: [
        'Adds flair to daily life.',
        'Thrives when effort is appreciated.',
        'Protective toward close people.',
      ],
      cosmicTip: 'Leo glows where creativity and authenticity are welcomed.',
    ),
    ZodiacSign(
      id: 'virgo',
      name: 'Virgo',
      symbol: '♍',
      emoji: '🌾',
      dateRange: 'August 23 - September 22',
      startMonth: 8,
      startDay: 23,
      endMonth: 9,
      endDay: 22,
      element: 'Earth',
      modality: 'Mutable',
      rulingPlanet: 'Mercury',
      accentHex: 0xFF66C2A5,
      behaviors: [
        'Analytical and service-minded.',
        'Notices details others miss.',
        'Shows care through practical support.',
      ],
      habits: [
        'Builds helpful systems and routines.',
        'Researches before decisions.',
        'Relaxes in organized spaces.',
      ],
      cosmicTip: 'Virgo thrives when intention meets healthy flexibility.',
    ),
    ZodiacSign(
      id: 'libra',
      name: 'Libra',
      symbol: '♎',
      emoji: '⚖️',
      dateRange: 'September 23 - October 22',
      startMonth: 9,
      startDay: 23,
      endMonth: 10,
      endDay: 22,
      element: 'Air',
      modality: 'Cardinal',
      rulingPlanet: 'Venus',
      accentHex: 0xFFF783AC,
      behaviors: [
        'Diplomatic and relationship-focused.',
        'Seeks fairness and emotional balance.',
        'Communicates with warmth and tact.',
      ],
      habits: [
        'Considers multiple perspectives.',
        'Values harmony in shared spaces.',
        'Enjoys beauty, style, and connection.',
      ],
      cosmicTip: 'Libra blossoms in partnerships with mutual respect.',
    ),
    ZodiacSign(
      id: 'scorpio',
      name: 'Scorpio',
      symbol: '♏',
      emoji: '🦂',
      dateRange: 'October 23 - November 21',
      startMonth: 10,
      startDay: 23,
      endMonth: 11,
      endDay: 21,
      element: 'Water',
      modality: 'Fixed',
      rulingPlanet: 'Pluto (traditional: Mars)',
      accentHex: 0xFF845EF7,
      behaviors: [
        'Intense, private, and perceptive.',
        'Loyal once trust is earned.',
        'Emotionally deep and strategic.',
      ],
      habits: [
        'Keeps personal life selective.',
        'Reads between the lines naturally.',
        'Works in powerful focused bursts.',
      ],
      cosmicTip: 'Scorpio transforms through honesty and emotional depth.',
    ),
    ZodiacSign(
      id: 'sagittarius',
      name: 'Sagittarius',
      symbol: '♐',
      emoji: '🏹',
      dateRange: 'November 22 - December 21',
      startMonth: 11,
      startDay: 22,
      endMonth: 12,
      endDay: 21,
      element: 'Fire',
      modality: 'Mutable',
      rulingPlanet: 'Jupiter',
      accentHex: 0xFFFF8787,
      behaviors: [
        'Optimistic and freedom-loving.',
        'Big-picture thinker with humor.',
        'Values truth and adventure.',
      ],
      habits: [
        'Explores new places and ideas often.',
        'Prefers flexible structures.',
        'Recharges through movement.',
      ],
      cosmicTip: 'Sagittarius thrives when curiosity leads the way.',
    ),
    ZodiacSign(
      id: 'capricorn',
      name: 'Capricorn',
      symbol: '♑',
      emoji: '🐐',
      dateRange: 'December 22 - January 19',
      startMonth: 12,
      startDay: 22,
      endMonth: 1,
      endDay: 19,
      element: 'Earth',
      modality: 'Cardinal',
      rulingPlanet: 'Saturn',
      accentHex: 0xFF868E96,
      behaviors: [
        'Disciplined, realistic, and loyal.',
        'Builds long-term stability.',
        'Shows love through reliability.',
      ],
      habits: [
        'Tracks goals consistently.',
        'Values productive routines.',
        'Balances ambition with strategy.',
      ],
      cosmicTip: 'Capricorn thrives when ambition includes healthy rest.',
    ),
    ZodiacSign(
      id: 'aquarius',
      name: 'Aquarius',
      symbol: '♒',
      emoji: '🌊',
      dateRange: 'January 20 - February 18',
      startMonth: 1,
      startDay: 20,
      endMonth: 2,
      endDay: 18,
      element: 'Air',
      modality: 'Fixed',
      rulingPlanet: 'Uranus (traditional: Saturn)',
      accentHex: 0xFF3BC9DB,
      behaviors: [
        'Independent and future-oriented.',
        'Values authenticity and ideas.',
        'Friendly with a unique viewpoint.',
      ],
      habits: [
        'Experiments with new systems.',
        'Mixes social energy with solo time.',
        'Cares about bigger causes.',
      ],
      cosmicTip: 'Aquarius thrives where originality has room to breathe.',
    ),
    ZodiacSign(
      id: 'pisces',
      name: 'Pisces',
      symbol: '♓',
      emoji: '🐟',
      dateRange: 'February 19 - March 20',
      startMonth: 2,
      startDay: 19,
      endMonth: 3,
      endDay: 20,
      element: 'Water',
      modality: 'Mutable',
      rulingPlanet: 'Neptune (traditional: Jupiter)',
      accentHex: 0xFF748FFC,
      behaviors: [
        'Compassionate and imaginative.',
        'Feels emotional nuance deeply.',
        'Connects through intuition and empathy.',
      ],
      habits: [
        'Uses creative outlets to process feelings.',
        'Needs quiet recovery time.',
        'Dreams big and needs grounding rituals.',
      ],
      cosmicTip: 'Pisces blooms when intuition and boundaries work together.',
    ),
  ];

  static const Map<String, int> _elementScores = {
    'Air|Air': 79,
    'Air|Earth': 60,
    'Air|Fire': 88,
    'Air|Water': 58,
    'Earth|Earth': 82,
    'Earth|Fire': 61,
    'Earth|Water': 87,
    'Fire|Fire': 81,
    'Fire|Water': 56,
    'Water|Water': 83,
  };

  static const Map<String, Map<String, String>> _elementInsights = {
    'Air|Air': {
      'chemistry': 'Conversation and humor flow naturally between you two.',
      'challenge':
          'Emotional depth can be delayed when both stay in their heads.',
      'tip': 'Schedule intentional emotional check-ins.',
    },
    'Air|Earth': {
      'chemistry': 'Fresh ideas meet practical grounding.',
      'challenge': 'Speed and pacing preferences may clash.',
      'tip': 'Blend brainstorming with realistic timelines.',
    },
    'Air|Fire': {
      'chemistry': 'Playful, energized, and adventurous dynamic.',
      'challenge': 'Can move fast and skip repair conversations.',
      'tip': 'Pause after conflict before jumping ahead.',
    },
    'Air|Water': {
      'chemistry': 'Perspective and empathy can complement beautifully.',
      'challenge': 'Different communication style can misalign.',
      'tip': 'Use clear language and active listening.',
    },
    'Earth|Earth': {
      'chemistry': 'Stable, dependable, and long-term oriented.',
      'challenge': 'May become overly routine over time.',
      'tip': 'Inject small novelty into your schedule.',
    },
    'Earth|Fire': {
      'chemistry': 'One inspires, one stabilizes.',
      'challenge': 'Spontaneity and structure can compete.',
      'tip': 'Plan for both flexible and structured time.',
    },
    'Earth|Water': {
      'chemistry': 'Nurturing, secure, and emotionally supportive.',
      'challenge': 'Difficult topics may be avoided too long.',
      'tip': 'Name concerns early before they stack up.',
    },
    'Fire|Fire': {
      'chemistry': 'Passionate and highly motivating connection.',
      'challenge': 'Strong personalities may escalate quickly.',
      'tip': 'Build fast repair habits after conflict.',
    },
    'Fire|Water': {
      'chemistry': 'Magnetic contrast and emotional intensity.',
      'challenge': 'Mismatch in conflict intensity and pacing.',
      'tip': 'Respect cool-down space and reconnect gently.',
    },
    'Water|Water': {
      'chemistry': 'Deep intuitive bond and emotional understanding.',
      'challenge': 'Moods can amplify each other.',
      'tip': 'Balance closeness with individual recharge time.',
    },
  };

  static const Map<String, int> _modalityBonus = {
    'Cardinal|Cardinal': 1,
    'Cardinal|Fixed': 3,
    'Cardinal|Mutable': 5,
    'Fixed|Fixed': -3,
    'Fixed|Mutable': 4,
    'Mutable|Mutable': 2,
  };

  static const Map<String, String> _modalityInsight = {
    'Cardinal|Cardinal':
        'Both initiate quickly, so clear role-sharing prevents power clashes.',
    'Cardinal|Fixed':
        'One starts momentum while the other sustains it with consistency.',
    'Cardinal|Mutable':
        'Strong starter plus adaptive partner creates a flexible growth rhythm.',
    'Fixed|Fixed':
        'Loyal and strong-willed pair. Compromise keeps growth moving.',
    'Fixed|Mutable':
        'Steady structure plus flexibility can make this match resilient.',
    'Mutable|Mutable':
        'Flow comes naturally, but consistency rituals help long-term stability.',
  };

  static const Set<String> _oppositePairs = {
    'aries|libra',
    'taurus|scorpio',
    'gemini|sagittarius',
    'cancer|capricorn',
    'leo|aquarius',
    'pisces|virgo',
  };

  @override
  ZodiacPairResult resolveCompatibility({
    required DateTime firstDob,
    required DateTime secondDob,
  }) {
    final firstSign = _resolveSign(firstDob);
    final secondSign = _resolveSign(secondDob);

    return ZodiacPairResult(
      firstDate: firstDob,
      secondDate: secondDob,
      firstSign: firstSign,
      secondSign: secondSign,
      compatibility: _buildCompatibility(firstSign, secondSign),
    );
  }

  ZodiacSign _resolveSign(DateTime dob) {
    final month = dob.month;
    final day = dob.day;

    return _signs.firstWhere((sign) {
      return _inRange(
        month: month,
        day: day,
        startMonth: sign.startMonth,
        startDay: sign.startDay,
        endMonth: sign.endMonth,
        endDay: sign.endDay,
      );
    });
  }

  bool _inRange({
    required int month,
    required int day,
    required int startMonth,
    required int startDay,
    required int endMonth,
    required int endDay,
  }) {
    final value = month * 100 + day;
    final startValue = startMonth * 100 + startDay;
    final endValue = endMonth * 100 + endDay;

    if (startValue <= endValue) {
      return value >= startValue && value <= endValue;
    }

    return value >= startValue || value <= endValue;
  }

  ZodiacCompatibility _buildCompatibility(ZodiacSign first, ZodiacSign second) {
    final elementKey = _pairKey(first.element, second.element);
    final modalityKey = _pairKey(first.modality, second.modality);
    final signKey = _pairKey(first.id, second.id);

    final base = _elementScores[elementKey] ?? 65;
    final modality = _modalityBonus[modalityKey] ?? 0;
    final sameSignBonus = first.id == second.id ? 6 : 0;
    final oppositeBonus = _oppositePairs.contains(signKey) ? 3 : 0;

    final score = _clamp(
      base + modality + sameSignBonus + oppositeBonus,
      35,
      98,
    );
    final level = _resolveLevel(score);

    final insights =
        _elementInsights[elementKey] ??
        {
          'chemistry':
              'This pair can work beautifully with intention and communication.',
          'challenge': 'Different rhythms need conscious alignment over time.',
          'tip': 'Create shared habits that protect both hearts.',
        };

    return ZodiacCompatibility(
      score: score,
      label: level.$1,
      emoji: level.$2,
      description: level.$3,
      elementSummary: '${first.element} + ${second.element}',
      modalitySummary: '${first.modality} + ${second.modality}',
      chemistry: insights['chemistry']!,
      challenge: insights['challenge']!,
      habitTip: insights['tip']!,
      modalityInsight:
          _modalityInsight[modalityKey] ??
          'Use clear communication and shared routines for stability.',
      isSameSign: first.id == second.id,
      isOppositePair: _oppositePairs.contains(signKey),
    );
  }

  (String, String, String) _resolveLevel(int score) {
    if (score >= 86) {
      return (
        'Cosmic Sync',
        '💞',
        'Very high natural alignment. Keep it intentional and this can feel effortless.',
      );
    }

    if (score >= 74) {
      return (
        'Strong Spark',
        '✨',
        'Great chemistry with strong potential through healthy communication.',
      );
    }

    if (score >= 62) {
      return (
        'Balanced & Growing',
        '🌱',
        'Different styles can complement each other with mutual effort.',
      );
    }

    return (
      'Opposites in Orbit',
      '🪐',
      'Needs extra emotional skill, but growth can still be meaningful.',
    );
  }

  int _clamp(int value, int min, int max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  String _pairKey(String first, String second) {
    final sorted = [first.toLowerCase(), second.toLowerCase()]..sort();
    return '${sorted[0][0].toUpperCase()}${sorted[0].substring(1)}|'
        '${sorted[1][0].toUpperCase()}${sorted[1].substring(1)}';
  }
}
