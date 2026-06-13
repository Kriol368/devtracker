import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class Navbar extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLocale;
  final List<String> items;
  final Map<String, GlobalKey> sectionKeys;
  final AppLocalizations localizations;

  const Navbar({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLocale,
    required this.items,
    required this.sectionKeys,
    required this.localizations,
  });

  void _scrollToSection(BuildContext context, String item) {
    final key = sectionKeys[item];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withAlpha(230),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 32,
              vertical: 12,
            ),
            child: Row(
              children: [
                Text(
                  'DevTracker',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  ...items.map(
                        (item) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextButton(
                        onPressed: () => _scrollToSection(context, item),
                        child: Text(item),
                      ),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: onToggleLocale,
                  tooltip: 'ES/EN',
                ),
                IconButton(
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  onPressed: onToggleTheme,
                  tooltip: localizations.cambiarTema,
                ),
                if (isMobile)
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}