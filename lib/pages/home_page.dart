import 'package:flutter/material.dart';
import '../models/project.dart';
import '../l10n/app_localizations.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/technology_section.dart';
import '../widgets/contact_section.dart';
import 'project_detail_page.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLocale;
  final AppLocalizations localizations;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLocale,
    required this.localizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> _navItems;
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'Inicio': GlobalKey(),
    'Dashboard': GlobalKey(),
    'Proyectos': GlobalKey(),
    'Tecnologías': GlobalKey(),
    'Contacto': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _updateNavItems();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.localizations != widget.localizations) {
      _updateNavItems();
    }
  }

  void _updateNavItems() {
    final l10n = widget.localizations;
    _navItems = [
      l10n.inicio,
      l10n.dashboard,
      l10n.proyectos,
      l10n.tecnologias,
      l10n.contacto,
    ];
  }

  String _getBaseKey(String item) {
    final l10n = widget.localizations;
    if (item == l10n.inicio) return 'Inicio';
    if (item == l10n.dashboard) return 'Dashboard';
    if (item == l10n.proyectos) return 'Proyectos';
    if (item == l10n.tecnologias) return 'Tecnologías';
    if (item == l10n.contacto) return 'Contacto';
    return item;
  }

  void _scrollToSection(String item) {
    final baseKey = _getBaseKey(item);
    final key = _sectionKeys[baseKey];
    if (key?.currentContext != null) {
      final renderObject = key!.currentContext!.findRenderObject();
      if (renderObject != null) {
        final offset = (renderObject as RenderBox).localToGlobal(
          Offset.zero,
          ancestor: context.findRenderObject(),
        );
        _scrollController.animateTo(
          _scrollController.offset + offset.dy - 80,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _onProjectTap(Project project) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProjectDetailPage(
              project: project,
              localizations: widget.localizations,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.localizations;

    return Scaffold(
      endDrawer: _buildMobileDrawer(context),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _NavbarDelegate(
              child: Navbar(
                isDarkMode: widget.isDarkMode,
                onToggleTheme: widget.onToggleTheme,
                onToggleLocale: widget.onToggleLocale,
                items: _navItems,
                sectionKeys: _sectionKeys,
                localizations: l10n,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                key: _sectionKeys['Inicio'],
                child: HeroSection(
                  localizations: l10n,
                  onScrollToProjects: () => _scrollToSection(l10n.proyectos),
                  onScrollToContact: () => _scrollToSection(l10n.contacto),
                ),
              ),
              Container(
                key: _sectionKeys['Dashboard'],
                child: DashboardSection(localizations: l10n),
              ),
              ProjectsSection(
                sectionKey: _sectionKeys['Proyectos']!,
                onProjectTap: _onProjectTap,
                localizations: l10n,
              ),
              Container(
                key: _sectionKeys['Tecnologías'],
                child: TechnologySection(localizations: l10n),
              ),
              Container(
                key: _sectionKeys['Contacto'],
                child: ContactSection(localizations: l10n),
              ),
              const SizedBox(height: 100),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Text(
              'DevTracker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          for (var item in _navItems)
            ListTile(
              title: Text(item),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(item);
              },
            ),
        ],
      ),
    );
  }
}

class _NavbarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _NavbarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant _NavbarDelegate oldDelegate) => false;
}