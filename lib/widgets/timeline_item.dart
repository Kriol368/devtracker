import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/timeline_data.dart';

class TimelineItem extends StatefulWidget {
  final TimelineEvent event;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.event,
    required this.isLast,
  });

  @override
  State<TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isWeb = kIsWeb;

    Widget timeline = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHovered && isWeb
                        ? colorScheme.primary
                        : colorScheme.primaryContainer,
                    boxShadow: _isHovered && isWeb
                        ? [
                      BoxShadow(
                        color: colorScheme.primary.withAlpha(100),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                        : [],
                  ),
                  child: Icon(
                    widget.event.icon,
                    color: _isHovered && isWeb
                        ? colorScheme.onPrimary
                        : colorScheme.primary,
                    size: 22,
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: colorScheme.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _isHovered && isWeb
                  ? (Matrix4.identity()..translate(8, 0))
                  : Matrix4.identity(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withAlpha(150),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.event.year,
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.event.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.event.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    if (isWeb) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: timeline,
      );
    }

    return timeline;
  }
}