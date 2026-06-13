import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  final AppLocalizations localizations;
  final VoidCallback? onScrollToProjects;
  final VoidCallback? onScrollToContact;

  const HeroSection({
    super.key,
    required this.localizations,
    this.onScrollToProjects,
    this.onScrollToContact,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = localizations;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 60 : 100,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer.withAlpha(isDark ? 80 : 100),
                colorScheme.surface,
                colorScheme.tertiaryContainer.withAlpha(isDark ? 40 : 60),
              ],
            ),
          ),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildContent(context, textTheme, colorScheme, l10n),
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildContent(context, textTheme, colorScheme, l10n),
          ),
        );
      },
    );
  }

  List<Widget> _buildContent(
      BuildContext context,
      TextTheme textTheme,
      ColorScheme colorScheme,
      AppLocalizations l10n,
      ) {
    return [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.holaSoy,
              style: textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.fullStackDev,
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.heroDescription,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: onScrollToProjects,
                  icon: const Icon(Icons.code),
                  label: Text(l10n.verProyectos),
                ),
                OutlinedButton.icon(
                  onPressed: onScrollToContact,
                  icon: const Icon(Icons.mail),
                  label: Text(l10n.contactar),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(width: 48, height: 48),
      Expanded(
        flex: 2,
        child: Center(
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.tertiary,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withAlpha(80),
                  blurRadius: 40,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'A',
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}