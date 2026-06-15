import 'package:flutter/material.dart';

class TimelineEvent {
  final String year;
  final String title;
  final String description;
  final IconData icon;

  const TimelineEvent({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });
}

List<TimelineEvent> timelineEvents = [
  const TimelineEvent(
    year: '2024',
    title: 'Inicio en Desarrollo de Software',
    description:
    'Comienzo de la formación en desarrollo de software. Primer contacto con Java, programación orientada a objetos y fundamentos de desarrollo.',
    icon: Icons.school,
  ),
  const TimelineEvent(
    year: '2025',
    title: 'Primeros Proyectos',
    description:
    'Desarrollo de Pokedex con Java Swing, SteamWave y Xenoblade 3 Checklist con Symfony, TrackTrails con Kotlin y Compose, y PJ Sekai Downloader con Python.',
    icon: Icons.rocket_launch,
  ),
  const TimelineEvent(
    year: '2025',
    title: 'Desarrollo Full Stack',
    description:
    'Combinación de proyectos backend con Spring Boot y frontend con Jetpack Compose. Talos II Archive como proyecto full stack completo.',
    icon: Icons.layers,
  ),
  const TimelineEvent(
    year: '2026',
    title: 'Proyecto HairUp',
    description:
    'Desarrollo de HairUp, aplicación completa de gestión de peluquerías con backend en Kotlin/Ktor y app Android en Jetpack Compose.',
    icon: Icons.phone_android,
  ),
  const TimelineEvent(
    year: '2026',
    title: 'Flutter y DevTracker',
    description:
    'Aprendizaje de Flutter y desarrollo de DevTracker, portfolio dashboard profesional. Consolidación como desarrollador full stack.',
    icon: Icons.flutter_dash,
  ),
];