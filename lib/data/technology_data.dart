import 'package:flutter/material.dart';

class Technology {
  final String name;
  final IconData icon;
  final String description;

  const Technology({
    required this.name,
    required this.icon,
    required this.description,
  });
}

List<Technology> technologies = [
  const Technology(
    name: 'Java',
    icon: Icons.coffee,
    description: 'Lenguaje principal para backend empresarial con Spring Boot y microservicios.',
  ),
  const Technology(
    name: 'Spring Boot',
    icon: Icons.eco,
    description: 'Framework Java para APIs REST, microservicios y aplicaciones cloud-native.',
  ),
  const Technology(
    name: 'ASP.NET',
    icon: Icons.grid_view,
    description: 'Framework de Microsoft para aplicaciones web, APIs y servicios empresariales.',
  ),
  const Technology(
    name: 'Flutter',
    icon: Icons.flutter_dash,
    description: 'Framework de Google para aplicaciones multiplataforma con un solo código base.',
  ),
  const Technology(
    name: 'Kotlin',
    icon: Icons.android,
    description: 'Lenguaje moderno para desarrollo Android y aplicaciones server-side.',
  ),
  const Technology(
    name: 'PHP',
    icon: Icons.code,
    description: 'Lenguaje para desarrollo web con Symfony y arquitecturas MVC robustas.',
  ),
  const Technology(
    name: 'Symfony',
    icon: Icons.build,
    description: 'Framework PHP full-stack con componentes reutilizables y buenas prácticas.',
  ),
  const Technology(
    name: 'Python',
    icon: Icons.terminal,
    description: 'Lenguaje versátil para scripting, automatización y herramientas CLI.',
  ),
  const Technology(
    name: 'SQL',
    icon: Icons.storage,
    description: 'Bases de datos relacionales con PostgreSQL, MySQL y SQL Server.',
  ),
];