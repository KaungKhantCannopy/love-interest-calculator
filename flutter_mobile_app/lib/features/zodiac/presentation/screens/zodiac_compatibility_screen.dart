import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/cosmic_background.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../domain/entities/zodiac_compatibility.dart';
import '../../domain/entities/zodiac_sign.dart';
import '../providers/zodiac_providers.dart';

class ZodiacCompatibilityScreen extends ConsumerWidget {
  const ZodiacCompatibilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(zodiacCompatibilityControllerProvider);
    final controller = ref.read(zodiacCompatibilityControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Compatibility'),
        backgroundColor: Colors.transparent,
      ),
      body: CosmicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  'Check your cosmic vibe ✨',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 6),
                Text(
                  'Enter two exact dates of birth to reveal sign-by-sign compatibility insights.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 14),
                _DateInputCard(
                  label: 'Your Date of Birth',
                  value: state.firstDob,
                  accent: const Color(0xFFFF7AB6),
                  onTap: () async {
                    final selected = await _pickDate(
                      context,
                      initialDate: state.firstDob,
                    );
                    if (selected != null) {
                      controller.setFirstDob(selected);
                    }
                  },
                ),
                const SizedBox(height: 10),
                _DateInputCard(
                  label: 'Your Partner Date of Birth',
                  value: state.secondDob,
                  accent: const Color(0xFF57D7FF),
                  onTap: () async {
                    final selected = await _pickDate(
                      context,
                      initialDate: state.secondDob,
                    );
                    if (selected != null) {
                      controller.setSecondDob(selected);
                    }
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: state.canCalculate ? controller.calculate : null,
                  child: const Text('Check Compatibility 💞'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Uses Western tropical zodiac signs, element pairings, and modality dynamics.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white60),
                ),
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 10),
                  GlassPanel(
                    child: Text(
                      state.errorMessage!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFFFFC9D9),
                      ),
                    ),
                  ),
                ],
                if (state.result != null) ...[
                  const SizedBox(height: 14),
                  _CompatibilityCard(result: state.result!),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final twoColumns = constraints.maxWidth > 760;
                      if (twoColumns) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _SignCard(
                                label: 'Person A',
                                sign: state.result!.firstSign,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _SignCard(
                                label: 'Person B',
                                sign: state.result!.secondSign,
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          _SignCard(
                            label: 'Person A',
                            sign: state.result!.firstSign,
                          ),
                          const SizedBox(height: 10),
                          _SignCard(
                            label: 'Person B',
                            sign: state.result!.secondSign,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _pickDate(BuildContext context, {DateTime? initialDate}) {
    final now = DateTime.now();

    return showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year, now.month, now.day),
      initialDate: initialDate ?? DateTime(2000, 1, 1),
    );
  }
}

class _DateInputCard extends StatelessWidget {
  const _DateInputCard({
    required this.label,
    required this.value,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final DateTime? value;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.calendar_month_rounded, color: accent),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value == null
                          ? 'Tap to select date'
                          : MaterialLocalizations.of(
                              context,
                            ).formatMediumDate(value!),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_drop_down_rounded, color: accent),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompatibilityCard extends StatelessWidget {
  const _CompatibilityCard({required this.result});

  final ZodiacPairResult result;

  @override
  Widget build(BuildContext context) {
    final data = result.compatibility;

    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _SignChip(sign: result.firstSign),
              const Text('💘', style: TextStyle(fontSize: 18)),
              _SignChip(sign: result.secondSign),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              '${data.score}% ${data.label}',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: data.score / 100,
              minHeight: 10,
              backgroundColor: Colors.white.withValues(alpha: 0.12),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFFF7AB6)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${data.emoji} ${data.description}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _smallTag(data.elementSummary),
              _smallTag(data.modalitySummary),
              if (data.isOppositePair) _smallTag('Opposite-sign axis'),
              if (data.isSameSign) _smallTag('Same-sign mirror'),
            ],
          ),
          const SizedBox(height: 12),
          _insightRow('Core Chemistry', data.chemistry),
          _insightRow('Possible Challenge', data.challenge),
          _insightRow('Habits Tip', data.habitTip),
          _insightRow('Modality Insight', data.modalityInsight),
        ],
      ),
    );
  }

  Widget _smallTag(String text) {
    return Chip(label: Text(text, style: const TextStyle(fontSize: 11)));
  }

  Widget _insightRow(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(body, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class _SignChip extends StatelessWidget {
  const _SignChip({required this.sign});

  final ZodiacSign sign;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Text(sign.emoji),
      label: Text('${sign.symbol} ${sign.name}'),
    );
  }
}

class _SignCard extends StatelessWidget {
  const _SignCard({required this.label, required this.sign});

  final String label;
  final ZodiacSign sign;

  @override
  Widget build(BuildContext context) {
    final accent = Color(sign.accentHex);

    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${sign.symbol} ${sign.name}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: accent),
                    ),
                    Text(
                      sign.dateRange,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white60),
                    ),
                  ],
                ),
              ),
              Text(sign.emoji, style: const TextStyle(fontSize: 30)),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _metaChip('Element', sign.element),
              _metaChip('Modality', sign.modality),
              _metaChip('Ruler', sign.rulingPlanet),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'General Behaviors',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          ...sign.behaviors.map((item) => _bullet(item)),
          const SizedBox(height: 8),
          Text('Common Habits', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          ...sign.habits.map((item) => _bullet(item)),
          const SizedBox(height: 8),
          Text(
            'Cosmic note: ${sign.cosmicTip}',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _metaChip(String label, String value) {
    return Chip(
      label: Text('$label: $value', style: const TextStyle(fontSize: 11)),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
