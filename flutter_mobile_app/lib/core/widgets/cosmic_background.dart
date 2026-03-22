import 'package:flutter/material.dart';

class CosmicBackground extends StatelessWidget {
  const CosmicBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF130F2C),
                  Color(0xFF1E1747),
                  Color(0xFF2A1F5D),
                  Color(0xFF141033),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: -30,
          child: _glowOrb(const Color(0xFFFF7AB6).withValues(alpha: 0.35), 180),
        ),
        Positioned(
          right: -50,
          top: 80,
          child: _glowOrb(const Color(0xFF57D7FF).withValues(alpha: 0.3), 170),
        ),
        Positioned(
          left: 40,
          bottom: -70,
          child: _glowOrb(const Color(0xFF8B7CFF).withValues(alpha: 0.28), 220),
        ),
        child,
      ],
    );
  }

  Widget _glowOrb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}
