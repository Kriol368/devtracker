import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final int value;
  final String suffix;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.suffix = '',
  });

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withAlpha(120),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                color: colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  '${(_animation.value * widget.value).toInt()}${widget.suffix}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}