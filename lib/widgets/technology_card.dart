import 'package:flutter/material.dart';

class TechnologyCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final String description;

  const TechnologyCard({
    super.key,
    required this.name,
    required this.icon,
    required this.description,
  });

  @override
  State<TechnologyCard> createState() => _TechnologyCardState();
}

class _TechnologyCardState extends State<TechnologyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -4))
            : Matrix4.identity(),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withAlpha(120),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.icon,
                    color: colorScheme.primary,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}