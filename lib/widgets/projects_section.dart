import 'package:flutter/material.dart';
import '../models/project.dart';
import '../l10n/app_localizations.dart';
import '../data/project_data.dart';
import 'project_card.dart';

class ProjectsSection extends StatefulWidget {
  final GlobalKey sectionKey;
  final Function(Project) onProjectTap;
  final AppLocalizations localizations;

  const ProjectsSection({
    super.key,
    required this.sectionKey,
    required this.onProjectTap,
    required this.localizations,
  });

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _searchQuery = '';
  String _selectedTechnology = 'Todos';
  final List<String> _allTechnologies = [
    'Todos',
    'Java',
    'Spring Boot',
    'ASP.NET',
    'Kotlin',
    'Flutter',
    'PHP',
    'Symfony',
    'Python',
  ];

  List<Project> get _filteredProjects {
    return projects.where((p) {
      final matchesSearch = _searchQuery.isEmpty ||
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesTech = _selectedTechnology == 'Todos' ||
          p.technologies.contains(_selectedTechnology);
      return matchesSearch && matchesTech;
    }).toList();
  }

  void _toggleFavorite(Project project) {
    setState(() {
      project.favorite = !project.favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final filtered = _filteredProjects;
    final l10n = widget.localizations;

    // Actualizar "Todos" si cambia el idioma
    if (_allTechnologies[0] != l10n.todos) {
      _allTechnologies[0] = l10n.todos;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final crossAxisCount =
        isMobile ? 1 : (constraints.maxWidth < 900 ? 2 : 3);

        return Container(
          key: widget.sectionKey,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 64,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.proyectosTitle,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.proyectosRealizados(projects.length),
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: l10n.buscarProyectos,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _allTechnologies.map((tech) {
                  final isSelected = _selectedTechnology == tech;
                  return FilterChip(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        tech,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedTechnology = selected ? tech : l10n.todos;
                      });
                    },
                    selectedColor: colorScheme.primaryContainer,
                    checkmarkColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4, vertical: 2),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              if (filtered.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(48),
                    child: Column(
                      children: [
                        Icon(Icons.search_off,
                            size: 64, color: colorScheme.onSurfaceVariant),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noProyectos,
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final project = filtered[index];
                    return ProjectCard(
                      project: project,
                      onTap: () => widget.onProjectTap(project),
                      onToggleFavorite: () => _toggleFavorite(project),
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