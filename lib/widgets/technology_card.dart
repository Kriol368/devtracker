import 'package:flutter/foundation.dart';
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
    final isWeb = kIsWeb;

    Widget card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: _isHovered && isWeb
          ? (Matrix4.identity()..translate(0, -4))
          : Matrix4.identity(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(120),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  color: colorScheme.primary,
                  size: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );

    if (isWeb) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: card,
      );
    }

    return card;
  }
}