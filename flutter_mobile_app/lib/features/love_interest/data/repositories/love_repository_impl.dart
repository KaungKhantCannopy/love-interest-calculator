import '../../domain/entities/love_question.dart';
import '../../domain/entities/love_result.dart';
import '../../domain/repositories/love_repository.dart';

class LoveRepositoryImpl implements LoveRepository {
  static const List<LoveQuestion> _questions = [
    LoveQuestion(
      id: 'communicationConsistency',
      prompt: 'How consistent is their communication with you?',
      options: [
        LoveOption(
          label: 'Very consistent, they check in naturally',
          score: 10,
        ),
        LoveOption(label: 'Mostly consistent with occasional delays', score: 7),
        LoveOption(label: 'On-and-off and hard to predict', score: 4),
        LoveOption(label: 'Rarely communicates unless prompted', score: 1),
      ],
    ),
    LoveQuestion(
      id: 'initiationBalance',
      prompt: 'Who usually initiates conversations or plans?',
      options: [
        LoveOption(
          label: 'They initiate often or it feels balanced',
          score: 10,
        ),
        LoveOption(label: 'Slightly more me, but they still show up', score: 7),
        LoveOption(label: 'Mostly me initiating everything', score: 4),
        LoveOption(label: 'Almost never them', score: 1),
      ],
    ),
    LoveQuestion(
      id: 'respectBoundaries',
      prompt: 'How do they respond to your boundaries?',
      options: [
        LoveOption(label: 'They respect and appreciate them', score: 10),
        LoveOption(label: 'Usually respectful with minor slips', score: 7),
        LoveOption(label: 'Sometimes dismissive', score: 3),
        LoveOption(label: 'Frequently ignores or pushes boundaries', score: 0),
      ],
    ),
    LoveQuestion(
      id: 'followsThrough',
      prompt: 'Do they follow through on what they promise?',
      options: [
        LoveOption(label: 'Yes, they are dependable', score: 10),
        LoveOption(label: 'Often yes, occasional misses', score: 7),
        LoveOption(label: 'Inconsistent follow-through', score: 4),
        LoveOption(label: 'Promises rarely match actions', score: 1),
      ],
    ),
    LoveQuestion(
      id: 'emotionalAvailability',
      prompt: 'How emotionally available do they seem?',
      options: [
        LoveOption(label: 'Open, honest, and emotionally present', score: 10),
        LoveOption(label: 'Somewhat open but still cautious', score: 7),
        LoveOption(label: 'Distant most of the time', score: 3),
        LoveOption(label: 'Avoids emotional depth completely', score: 0),
      ],
    ),
    LoveQuestion(
      id: 'qualityTimeIntent',
      prompt: 'Do they make intentional effort to spend quality time?',
      options: [
        LoveOption(label: 'Yes, they make thoughtful plans', score: 10),
        LoveOption(label: 'Usually yes when schedules align', score: 7),
        LoveOption(label: 'Only casual / last-minute effort', score: 4),
        LoveOption(label: 'Very little effort from them', score: 1),
      ],
    ),
    LoveQuestion(
      id: 'socialContext',
      prompt: 'How do they act around friends/social situations?',
      options: [
        LoveOption(label: 'Proud and warm around others', score: 10),
        LoveOption(label: 'Comfortable, mostly positive', score: 7),
        LoveOption(label: 'Sometimes distant in public', score: 4),
        LoveOption(label: 'Acts very different or hides connection', score: 1),
      ],
    ),
    LoveQuestion(
      id: 'conflictStyle',
      prompt: 'How do they handle disagreements?',
      options: [
        LoveOption(label: 'Calm, respectful, and solution-focused', score: 10),
        LoveOption(label: 'Tries, but can get defensive at times', score: 6),
        LoveOption(label: 'Avoids conflict without resolving', score: 3),
        LoveOption(label: 'Dismissive, harsh, or manipulative', score: 0),
      ],
    ),
    LoveQuestion(
      id: 'mixedSignals',
      prompt: 'How mixed are their signals overall?',
      options: [
        LoveOption(label: 'Clear and consistent', score: 10),
        LoveOption(
          label: 'Mostly clear with small confusion moments',
          score: 7,
        ),
        LoveOption(label: 'Frequently mixed', score: 3),
        LoveOption(label: 'Constantly confusing and contradictory', score: 0),
      ],
    ),
    LoveQuestion(
      id: 'futureMention',
      prompt: 'Do they include you in near-future plans?',
      options: [
        LoveOption(label: 'Yes, naturally and often', score: 10),
        LoveOption(label: 'Sometimes and with interest', score: 7),
        LoveOption(label: 'Rarely mentioned', score: 3),
        LoveOption(label: 'Never part of future plans', score: 0),
      ],
    ),
  ];

  @override
  List<LoveQuestion> getQuestions() => _questions;

  @override
  LoveAnalysis analyzeAnswers(Map<String, int> answers) {
    final answeredScores = answers.values;
    final total = answeredScores.isEmpty
        ? 0
        : answeredScores.reduce((value, element) => value + element);
    final maxScore = _questions.length * 10;
    final score = ((total / maxScore) * 100).round();

    final level = _resolveLevel(score);
    final redFlags = _collectRedFlags(answers);
    final nextMove = _resolveNextMove(score);

    final confidence =
        'Calculated from ${answers.length}/${_questions.length} behavior signals. '
        'Higher consistency, emotional availability, and follow-through increase confidence.';

    return LoveAnalysis(
      score: score,
      level: level,
      confidence: confidence,
      redFlags: redFlags,
      nextMove: nextMove,
    );
  }

  LoveLevel _resolveLevel(int score) {
    if (score >= 78) {
      return const LoveLevel(
        label: 'Strong Interest',
        emoji: '💖',
        description:
            'Their behavior shows strong intent and meaningful emotional effort.',
      );
    }

    if (score >= 55) {
      return const LoveLevel(
        label: 'Potential, Needs Clarity',
        emoji: '🌸',
        description:
            'There is potential, but consistency and communication should improve.',
      );
    }

    return const LoveLevel(
      label: 'Low or Unclear Interest',
      emoji: '🫧',
      description:
          'Signals are weak or inconsistent. Protect your emotional energy.',
    );
  }

  NextMove _resolveNextMove(int score) {
    if (score >= 78) {
      return const NextMove(
        title: 'Keep Building Momentum',
        advice:
            'Stay playful, communicate openly, and keep mutual effort balanced.',
        actions: [
          'Plan one quality date that reflects both of your interests.',
          'Name what is going well so it keeps growing.',
          'Maintain healthy boundaries while deepening connection.',
        ],
      );
    }

    if (score >= 55) {
      return const NextMove(
        title: 'Clarify Intention Gently',
        advice:
            'Ask direct but kind questions so both of you know where things stand.',
        actions: [
          'Invite one calm conversation about expectations.',
          'Observe actions over words for 2-3 weeks.',
          'Avoid over-investing until consistency is clear.',
        ],
      );
    }

    return const NextMove(
      title: 'Protect Your Peace',
      advice:
          'Do not chase unclear energy. Prioritize respect, reciprocity, and stability.',
      actions: [
        'Step back from one-sided effort.',
        'Set and keep firm boundaries.',
        'Reinvest your time in people who show consistent care.',
      ],
    );
  }

  List<String> _collectRedFlags(Map<String, int> answers) {
    final flags = <String>[];

    final boundaries = answers['respectBoundaries'] ?? 0;
    if (boundaries <= 3) {
      flags.add(
        'Boundary respect looks weak. That is a major emotional safety concern.',
      );
    }

    final followThrough = answers['followsThrough'] ?? 0;
    if (followThrough <= 4) {
      flags.add('Words and actions may not match consistently.');
    }

    final conflictStyle = answers['conflictStyle'] ?? 0;
    if (conflictStyle <= 3) {
      flags.add('Conflict handling may be avoidant or emotionally harsh.');
    }

    final mixedSignals = answers['mixedSignals'] ?? 10;
    if (mixedSignals <= 4) {
      flags.add(
        'Mixed signals are high. Clarity may be intentionally avoided.',
      );
    }

    final emotionalAvailability = answers['emotionalAvailability'] ?? 0;
    if (emotionalAvailability <= 3) {
      flags.add(
        'Emotional availability appears low for meaningful connection right now.',
      );
    }

    return flags;
  }
}
