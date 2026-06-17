import '../models/project.dart';

List<Project> projects = [
  Project(
    id: '1',
    name: 'DevTracker',
    description: 'Dashboard portfolio profesional para desarrolladores',
    longDescription:
    'Aplicación web desarrollada en Flutter que funciona como portfolio profesional y dashboard de proyectos. Incluye estadísticas de experiencia, timeline profesional, filtro de proyectos por tecnología, favoritos, tema claro/oscuro, selector de idioma ES/EN y diseño responsive. Construida con Material 3 y sin dependencias de backend.',
    technologies: ['Flutter', 'Dart', 'Material 3', 'SharedPreferences'],
    date: DateTime(2026, 6, 1),
    category: 'Web',
    githubUrl: 'https://github.com/Kriol368/devtracker',
    featured: true,
  ),
  Project(
    id: '2',
    name: 'HairUp Backend',
    description: 'API REST para app de peluquerías con Ktor',
    longDescription:
    'Backend desarrollado con Kotlin y Ktor que sirve como API para la aplicación HairUp de gestión de peluquerías. Implementa autenticación JWT con Auth0, gestión de citas, catálogo de servicios, perfiles de peluqueros, salones y sistema de valoraciones. Base de datos MySQL con Exposed ORM, migraciones con Flyway y conexiones con HikariCP.',
    technologies: ['Kotlin', 'Ktor', 'MySQL', 'Flyway', 'JWT'],
    date: DateTime(2026, 3, 15),
    category: 'Backend',
    githubUrl: 'https://github.com/Kriol368/hairup-backend',
    featured: true,
  ),
  Project(
    id: '3',
    name: 'HairUp Frontend',
    description: 'App Android de gestión de peluquerías',
    longDescription:
    'Aplicación Android nativa desarrollada con Kotlin y Jetpack Compose para la gestión de peluquerías. Permite a los clientes buscar peluquerías, reservar citas, ver catálogo de servicios y dejar valoraciones. Implementa Material 3, navegación con Navigation Compose, inyección de dependencias con Koin, carga de imágenes con Coil y consume la API de HairUp Backend con Retrofit.',
    technologies: ['Kotlin', 'Jetpack Compose', 'Koin', 'Retrofit', 'Material 3'],
    date: DateTime(2026, 3, 15),
    category: 'Mobile',
    githubUrl: 'https://github.com/Kriol368/hairup-frontend',
    featured: true,
  ),
  Project(
    id: '4',
    name: 'Talos II Archive Backend',
    description: 'API para archivo documental con Spring Boot',
    longDescription:
    'Backend desarrollado con Kotlin y Spring Boot que sirve como API REST para el archivo documental del proyecto Talos II. Implementa Spring Security con JWT, JPA con MySQL, migraciones Flyway y documentación con Swagger/OpenAPI. Gestiona documentos, metadatos y control de acceso por roles.',
    technologies: ['Kotlin', 'Spring Boot', 'MySQL', 'Swagger', 'JWT'],
    date: DateTime(2026, 1, 20),
    category: 'Backend',
    githubUrl: 'https://github.com/Kriol368/talos-II-archive-backend',
    featured: false,
  ),
  Project(
    id: '5',
    name: 'Talos II Archive Frontend',
    description: 'Interfaz de archivo documental con Jetpack Compose',
    longDescription:
    'Aplicación Android desarrollada con Kotlin y Jetpack Compose que sirve como interfaz para el archivo documental de Talos II. Permite navegar por documentos, filtrar por categorías, buscar por texto completo y visualizar metadatos detallados. Diseño adaptable para tablets y phones con Material 3. Usa Retrofit para consumir la API del backend.',
    technologies: ['Kotlin', 'Jetpack Compose', 'Retrofit', 'Koin', 'Material 3'],
    date: DateTime(2026, 1, 20),
    category: 'Mobile',
    githubUrl: 'https://github.com/Kriol368/talos-II-archive-frontend',
    featured: false,
  ),
  Project(
    id: '6',
    name: 'TrackTrails',
    description: 'App de seguimiento de rutas GPS con Compose',
    longDescription:
    'Aplicación Android nativa con Kotlin y Jetpack Compose para el seguimiento de rutas GPS. Permite grabar trayectos, visualizarlos en mapa con Google Maps Compose, añadir waypoints y ver estadísticas de distancia recorrida. Usa SQLDelight para persistencia local de datos y Koin para inyección de dependencias. Arquitectura MVVM.',
    technologies: ['Kotlin', 'Jetpack Compose', 'Google Maps', 'SQLDelight', 'MVVM'],
    date: DateTime(2025, 11, 10),
    category: 'Mobile',
    githubUrl: 'https://github.com/Kriol368/TrackTrails',
    featured: true,
  ),
  Project(
    id: '7',
    name: 'Xenoblade 3 Checklist',
    description: 'Checklist interactiva para Xenoblade Chronicles 3',
    longDescription:
    'Aplicación web desarrollada con PHP y Symfony para llevar el seguimiento de coleccionables, misiones secundarias y logros de Xenoblade Chronicles 3. Incluye filtros por región, marcado de completado, barra de progreso global, cuentas de usuario y diseño responsive con Bootstrap y Stimulus. Base de datos MySQL con Doctrine ORM.',
    technologies: ['PHP', 'Symfony', 'MySQL', 'Bootstrap', 'Doctrine'],
    date: DateTime(2025, 9, 5),
    category: 'Web',
    githubUrl: 'https://github.com/Kriol368/xenoblade3-checklist',
    featured: false,
  ),
  Project(
    id: '8',
    name: 'PJ Sekai Song Downloader',
    description: 'Descargador de canciones de Project Sekai',
    longDescription:
    'Herramienta CLI desarrollada en Python para descargar canciones y metadatos del juego Project Sekai: Colorful Stage. Utiliza web scraping con BeautifulSoup, descarga concurrente con asyncio y aiohttp, y organización automática de archivos por artista. Empaquetado como ejecutable independiente con PyInstaller.',
    technologies: ['Python', 'BeautifulSoup', 'asyncio', 'PyInstaller'],
    date: DateTime(2025, 7, 18),
    category: 'Tools',
    githubUrl: 'https://github.com/Kriol368/pjsekai-song-downloader',
    featured: false,
  ),
  Project(
    id: '9',
    name: 'SteamWave',
    description: 'Red social para jugadores con integración de Steam',
    longDescription:
    'Aplicación web desarrollada con PHP y Symfony que funciona como red social para jugadores. Permite iniciar sesión con Steam, mostrar biblioteca de juegos, conectar con amigos, compartir logros y actividad de juego. Diseño responsive con Bootstrap, Stimulus y Webpack Encore.',
    technologies: ['PHP', 'Symfony', 'MySQL', 'Bootstrap', 'Steam API'],
    date: DateTime(2025, 5, 22),
    category: 'Web',
    githubUrl: 'https://github.com/Kriol368/SteamWave',
    featured: true,
  ),
  Project(
    id: '10',
    name: 'Pokedex',
    description: 'Aplicación de escritorio Pokédex con Java Swing',
    longDescription:
    'Aplicación de escritorio desarrollada con Java que simula una Pokédex interactiva. Permite buscar Pokémon, filtrar por tipos y generaciones, ver estadísticas, evoluciones y habilidades. Interfaz gráfica construida con Java Swing y FlatLaf para un aspecto moderno. Arquitectura MVC con datos desde archivos locales sin dependencia de APIs externas.',
    technologies: ['Java', 'Swing', 'FlatLaf', 'MVC'],
    date: DateTime(2025, 3, 8),
    category: 'Desktop',
    githubUrl: 'https://github.com/Kriol368/Pokedex',
    featured: false,
  ),
];