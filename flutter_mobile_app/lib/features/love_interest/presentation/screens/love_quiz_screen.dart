import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/cosmic_background.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../domain/entities/love_question.dart';
import '../../domain/entities/love_result.dart';
import '../providers/love_providers.dart';

class LoveQuizScreen extends ConsumerWidget {
  const LoveQuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loveQuizControllerProvider);
    final controller = ref.read(loveQuizControllerProvider.notifier);
    final questions = ref.watch(loveQuestionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Love Interest Analyzer'),
        backgroundColor: Colors.transparent,
      ),
      body: CosmicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: state.hasResult
                ? _ResultView(
                    analysis: state.analysis!,
                    onRestart: controller.restart,
                  )
                : _QuizView(
                    questions: questions,
                    currentIndex: state.currentIndex,
                    selectedScore:
                        state.answers[questions[state.currentIndex].id],
                    onAnswer: (questionId, score) {
                      controller.answerQuestion(
                        questionId: questionId,
                        score: score,
                      );
                    },
                    onPrevious: controller.previousStep,
                    onNext: controller.nextStep,
                    canProceed: controller.isAnswered(
                      questions[state.currentIndex].id,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _QuizView extends StatelessWidget {
  const _QuizView({
    required this.questions,
    required this.currentIndex,
    required this.selectedScore,
    required this.onAnswer,
    required this.onPrevious,
    required this.onNext,
    required this.canProceed,
  });

  final List<LoveQuestion> questions;
  final int currentIndex;
  final int? selectedScore;
  final void Function(String questionId, int score) onAnswer;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool canProceed;

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    final progress = (currentIndex + 1) / questions.length;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ${currentIndex + 1} of ${questions.length}',
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          borderRadius: BorderRadius.circular(999),
          backgroundColor: Colors.white.withValues(alpha: 0.12),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GlassPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question.prompt, style: textTheme.titleLarge),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.separated(
                    itemCount: question.options.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final option = question.options[index];
                      final selected = selectedScore == option.score;

                      return _OptionTile(
                        label: option.label,
                        selected: selected,
                        onTap: () => onAnswer(question.id, option.score),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: currentIndex == 0 ? null : onPrevious,
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: canProceed ? onNext : null,
                        child: Text(
                          currentIndex == questions.length - 1
                              ? 'See Results ✨'
                              : 'Next',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? const Color(0xFFAA9DFF)
                : Colors.white.withValues(alpha: 0.2),
            width: selected ? 1.6 : 1,
          ),
          color: selected
              ? const Color(0xFF8B7CFF).withValues(alpha: 0.24)
              : Colors.white.withValues(alpha: 0.06),
        ),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            if (selected)
              const Icon(Icons.check_circle_rounded, color: Color(0xFFFF7AB6)),
          ],
        ),
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({required this.analysis, required this.onRestart});

  final LoveAnalysis analysis;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = _resolveAccent(analysis.score);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        GlassPanel(
          child: Column(
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accent, width: 4),
                  gradient: RadialGradient(
                    colors: [
                      accent.withValues(alpha: 0.28),
                      Colors.transparent,
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${analysis.score}',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${analysis.level.emoji} ${analysis.level.label}',
                style: textTheme.titleLarge?.copyWith(color: accent),
              ),
              const SizedBox(height: 8),
              Text(
                analysis.level.description,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Why this score?', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                analysis.confidence,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Red Flags (${analysis.redFlags.length})',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (analysis.redFlags.isEmpty)
                Text(
                  'No strong red flags detected from your answers.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF8DFFCC),
                  ),
                )
              else
                ...analysis.redFlags.map(
                  (flag) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text('⚠️  '),
                        ),
                        Expanded(
                          child: Text(
                            flag,
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(analysis.nextMove.title, style: textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                analysis.nextMove.advice,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              ...analysis.nextMove.actions.map(
                (action) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('→ '),
                      Expanded(child: Text(action)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ElevatedButton(onPressed: onRestart, child: const Text('Try Again')),
      ],
    );
  }

  Color _resolveAccent(int score) {
    if (score >= 78) return const Color(0xFFFF7AB6);
    if (score >= 55) return const Color(0xFF57D7FF);
    return const Color(0xFFFFA56E);
  }
}
