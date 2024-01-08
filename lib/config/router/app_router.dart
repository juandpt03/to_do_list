import 'package:go_router/go_router.dart';
import 'package:to_do_list/features/home/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
    name: HomeScreen.routeName,
  ),
]);
