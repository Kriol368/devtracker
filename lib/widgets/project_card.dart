import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -4))
            : Matrix4.identity(),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen placeholder con gradiente
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getColorForProject(project.id, colorScheme),
                        _getColorForProject(project.id, colorScheme)
                            .withAlpha(150),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      _getIconForCategory(project.category),
                      size: 40,
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              project.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: widget.onToggleFavorite,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                project.favorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: project.favorite
                                    ? Colors.red
                                    : colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        project.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: project.technologies.take(3).map((tech) {
                          return Chip(
                            label: Text(
                              tech,
                              style: const TextStyle(fontSize: 10),
                            ),
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${project.date.day}/${project.date.month}/${project.date.year}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForProject(String id, ColorScheme colorScheme) {
    final colors = [
      colorScheme.primary,
      colorScheme.tertiary,
      const Color(0xFF0EA5E9),
      const Color(0xFF8B5CF6),
      const Color(0xFFF97316),
      const Color(0xFF10B981),
    ];
    return colors[int.parse(id) % colors.length];
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Backend':
        return Icons.dns;
      case 'Frontend':
        return Icons.web;
      case 'Full Stack':
        return Icons.layers;
      case 'Mobile':
        return Icons.phone_android;
      case 'Web':
        return Icons.language;
      case 'Tools':
        return Icons.terminal;
      default:
        return Icons.folder;
    }
  }
}