import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

class AppLocalizations {
  final String locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(String locale) {
    switch (locale) {
      case 'es':
        return AppLocalizationsEs();
      default:
        return AppLocalizationsEn();
    }
  }

  // Navbar
  String get inicio => 'Inicio';
  String get dashboard => 'Dashboard';
  String get proyectos => 'Proyectos';
  String get tecnologias => 'Tecnologías';
  String get timeline => 'Timeline';
  String get contacto => 'Contacto';
  String get cambiarTema => 'Cambiar tema';

  // Hero
  String get holaSoy => 'Hola, soy Andreu';
  String get fullStackDev => 'Full Stack Developer';
  String get heroDescription =>
      'Desarrollador con experiencia en Java, Spring Boot, ASP.NET, Kotlin, PHP, Symfony y Flutter.';
  String get verProyectos => 'Ver Proyectos';
  String get contactar => 'Contactar';

  // Dashboard
  String get dashboardTitle => 'Dashboard';
  String get dashboardSubtitle => 'Un vistazo rápido a mi experiencia';
  String get aniosExperiencia => 'Años de\nexperiencia';
  String get proyectosCompletados => 'Proyectos\ncompletados';
  String get tecnologiasDominadas => 'Tecnologías\ndominadas';
  String get lenguajesUtilizados => 'Lenguajes\nutilizados';

  // Proyectos
  String get proyectosTitle => 'Proyectos';
  String proyectosRealizados(int count) => '$count proyectos realizados';
  String get buscarProyectos => 'Buscar por nombre o descripción...';
  String get todos => 'Todos';
  String get noProyectos => 'No se encontraron proyectos';

  // Detalle proyecto
  String get descripcion => 'Descripción';
  String get verEnGitHub => 'Ver en GitHub';
  String get volver => 'Volver';

  // Tecnologías
  String get tecnologiasTitle => 'Tecnologías';
  String get tecnologiasSubtitle =>
      'Las herramientas y lenguajes con los que trabajo';

  // Timeline
  String get timelineTitle => 'Timeline';
  String get timelineSubtitle => 'Mi trayectoria profesional';

  // Contacto
  String get contactoTitulo => 'Contacto';
  String get contactoSubtitle => '¿Tienes un proyecto en mente? Escríbeme';
  String get nombre => 'Nombre';
  String get email => 'Email';
  String get mensaje => 'Mensaje';
  String get enviar => 'Enviar';
  String get enviando => 'Enviando...';
  String get mensajeEnviado => '¡Mensaje enviado con éxito!';
  String get validarNombre => 'Por favor, escribe tu nombre';
  String get validarEmail => 'Por favor, escribe tu email';
  String get validarEmailFormato => 'Introduce un email válido';
  String get validarMensaje => 'Por favor, escribe un mensaje';
  String get validarMensajeLongitud =>
      'El mensaje debe tener al menos 10 caracteres';
}

class AppLocalizationsDelegate {
  const AppLocalizationsDelegate();

  AppLocalizations get(String locale) => AppLocalizations.of(locale);
}