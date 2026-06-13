import 'app_localizations.dart';

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn() : super('en');

  @override
  String get inicio => 'Home';
  @override
  String get dashboard => 'Dashboard';
  @override
  String get proyectos => 'Projects';
  @override
  String get tecnologias => 'Technologies';
  @override
  String get timeline => 'Timeline';
  @override
  String get contacto => 'Contact';
  @override
  String get cambiarTema => 'Toggle theme';

  @override
  String get holaSoy => 'Hi, I\'m Andreu';
  @override
  String get fullStackDev => 'Full Stack Developer';
  @override
  String get heroDescription =>
      'Developer with experience in Java, Spring Boot, ASP.NET, Kotlin, PHP, Symfony and Flutter.';
  @override
  String get verProyectos => 'View Projects';
  @override
  String get contactar => 'Contact';

  @override
  String get dashboardTitle => 'Dashboard';
  @override
  String get dashboardSubtitle => 'A quick overview of my experience';
  @override
  String get aniosExperiencia => 'Years of\nexperience';
  @override
  String get proyectosCompletados => 'Projects\ncompleted';
  @override
  String get tecnologiasDominadas => 'Technologies\nmastered';
  @override
  String get lenguajesUtilizados => 'Languages\nused';

  @override
  String get proyectosTitle => 'Projects';
  @override
  String proyectosRealizados(int count) => '$count projects completed';
  @override
  String get buscarProyectos => 'Search by name or description...';
  @override
  String get todos => 'All';
  @override
  String get noProyectos => 'No projects found';

  @override
  String get descripcion => 'Description';
  @override
  String get verEnGitHub => 'View on GitHub';
  @override
  String get volver => 'Back';

  @override
  String get tecnologiasTitle => 'Technologies';
  @override
  String get tecnologiasSubtitle =>
      'The tools and languages I work with';

  @override
  String get timelineTitle => 'Timeline';
  @override
  String get timelineSubtitle => 'My professional journey';

  @override
  String get contactoTitulo => 'Contact';
  @override
  String get contactoSubtitle => 'Have a project in mind? Write me';
  @override
  String get nombre => 'Name';
  @override
  String get email => 'Email';
  @override
  String get mensaje => 'Message';
  @override
  String get enviar => 'Send';
  @override
  String get enviando => 'Sending...';
  @override
  String get mensajeEnviado => 'Message sent successfully!';
  @override
  String get validarNombre => 'Please enter your name';
  @override
  String get validarEmail => 'Please enter your email';
  @override
  String get validarEmailFormato => 'Enter a valid email';
  @override
  String get validarMensaje => 'Please write a message';
  @override
  String get validarMensajeLongitud =>
      'Message must be at least 10 characters';
}