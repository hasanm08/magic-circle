import 'package:go_router/go_router.dart';

import '../../presentation/screens/image_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const ImageScreen()),
  ],
);
