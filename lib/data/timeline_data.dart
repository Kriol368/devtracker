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
    year: '2018',
    title: 'Inicio en la Universidad',
    description: 'Comencé Ingeniería Informática. Primer contacto con Java, C y fundamentos de programación.',
    icon: Icons.school,
  ),
  const TimelineEvent(
    year: '2020',
    title: 'Primer Empleo como Desarrollador',
    description: 'Empecé como desarrollador backend junior trabajando con Java y Spring Boot en una startup fintech.',
    icon: Icons.work,
  ),
  const TimelineEvent(
    year: '2021',
    title: 'Stack Ampliado',
    description: 'Aprendí PHP con Symfony y ASP.NET. Participé en proyectos de e-commerce y facturación electrónica.',
    icon: Icons.rocket_launch,
  ),
  const TimelineEvent(
    year: '2022',
    title: 'Desarrollo Mobile',
    description: 'Entré en el mundo mobile con Kotlin para Android y di mis primeros pasos con Flutter.',
    icon: Icons.phone_android,
  ),
  const TimelineEvent(
    year: '2023',
    title: 'Full Stack Consolidado',
    description: 'Proyectos combinando Flutter, Spring Boot, ASP.NET y Symfony. Arquitecturas de microservicios.',
    icon: Icons.layers,
  ),
  const TimelineEvent(
    year: '2024',
    title: 'Situación Actual',
    description: 'Desarrollando DevTracker en Flutter Web. Buscando nuevas oportunidades como Full Stack Developer.',
    icon: Icons.trending_up,
  ),
];