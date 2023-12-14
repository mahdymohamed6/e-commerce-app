import 'package:go_router/go_router.dart';
import 'package:the_basic_look/features/cart_view/presntation/cart_view.dart';
import 'package:the_basic_look/features/home_view/presntation/home_view.dart';
import 'package:the_basic_look/features/register_views/presntation/login_view.dart';
import 'package:the_basic_look/features/register_views/presntation/signup_view.dart';
import 'package:the_basic_look/features/splash_view/presntation/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/HomeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/SignUp',
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        path: '/CartView',
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
