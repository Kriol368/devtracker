import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'stat_card.dart';

class DashboardSection extends StatelessWidget {
  final AppLocalizations localizations;

  const DashboardSection({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = localizations;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final crossAxisCount = isMobile ? 2 : 4;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 64,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.dashboardTitle,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.dashboardSubtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 1.1 : 1.3,
                children: [
                  StatCard(
                    icon: Icons.work_history,
                    label: l10n.aniosExperiencia,
                    value: 1,
                  ),
                  StatCard(
                    icon: Icons.folder,
                    label: l10n.proyectosCompletados,
                    value: 10,
                  ),
                  StatCard(
                    icon: Icons.code,
                    label: l10n.tecnologiasDominadas,
                    value: 10,
                  ),
                  StatCard(
                    icon: Icons.language,
                    label: l10n.lenguajesUtilizados,
                    value: 4,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}