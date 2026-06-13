import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../data/timeline_data.dart';
import 'timeline_item.dart';

class TimelineSection extends StatelessWidget {
  final AppLocalizations localizations;

  const TimelineSection({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = localizations;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 64,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.timelineTitle,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.timelineSubtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40),
              ...timelineEvents.asMap().entries.map((entry) {
                final index = entry.key;
                final event = entry.value;
                return TimelineItem(
                  event: event,
                  isLast: index == timelineEvents.length - 1,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}