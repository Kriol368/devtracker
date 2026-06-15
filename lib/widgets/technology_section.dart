import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../data/technology_data.dart';
import 'technology_card.dart';

class TechnologySection extends StatelessWidget {
  final AppLocalizations localizations;

  const TechnologySection({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = localizations;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final crossAxisCount =
        isMobile ? 2 : (constraints.maxWidth < 900 ? 3 : 5);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 64,
            vertical: 60,
          ),
          color: colorScheme.surfaceContainerLow.withAlpha(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.tecnologiasTitle,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.tecnologiasSubtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: technologies.length,
                itemBuilder: (context, index) {
                  final tech = technologies[index];
                  return TechnologyCard(
                    name: tech.name,
                    icon: tech.icon,
                    description: tech.description,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}