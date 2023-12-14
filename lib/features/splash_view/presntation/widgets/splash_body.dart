import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push('/HomeView');
    });
    return const Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Where Quality Meets Affordability',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        Text(
          'Thebasiclook.com',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
// /LoginView