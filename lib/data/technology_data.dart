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
    description:
    'Lenguaje para aplicaciones empresariales, escritorio con Swing y APIs REST con Spring Boot.',
  ),
  const Technology(
    name: 'Spring Boot',
    icon: Icons.eco,
    description:
    'Framework Java/Kotlin para APIs REST, seguridad JWT, JPA y microservicios.',
  ),
  const Technology(
    name: 'Kotlin',
    icon: Icons.android,
    description:
    'Lenguaje moderno para backend con Ktor, apps Android con Compose y Spring Boot.',
  ),
  const Technology(
    name: 'Ktor',
    icon: Icons.cable,
    description:
    'Framework ligero de Kotlin para APIs REST asíncronas con corrutinas.',
  ),
  const Technology(
    name: 'Jetpack Compose',
    icon: Icons.dashboard_customize,
    description:
    'Toolkit moderno de UI declarativa para apps Android nativas con Kotlin.',
  ),
  const Technology(
    name: 'PHP',
    icon: Icons.code,
    description:
    'Lenguaje para desarrollo web con Symfony, Doctrine y arquitecturas MVC robustas.',
  ),
  const Technology(
    name: 'Symfony',
    icon: Icons.build,
    description:
    'Framework PHP full-stack con componentes reutilizables, Doctrine y buenas prácticas.',
  ),
  const Technology(
    name: 'Python',
    icon: Icons.terminal,
    description:
    'Lenguaje versátil para scripting, scraping, automatización y herramientas CLI.',
  ),
  const Technology(
    name: 'Flutter',
    icon: Icons.flutter_dash,
    description:
    'Framework de Google para aplicaciones multiplataforma con Material 3 y Dart.',
  ),
  const Technology(
    name: 'SQL',
    icon: Icons.storage,
    description:
    'Bases de datos relacionales con PostgreSQL y MySQL usando Exposed, Doctrine y JDBC.',
  ),
];