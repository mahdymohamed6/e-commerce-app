import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/custom_icon_button.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/home_view_body.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomiIconButton(
          icon: Icons.menu_rounded,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 86),
          child: Logo(),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                GoRouter.of(context).push('/CartView');
              },
              child:
                  const CustomiIconButton(icon: Icons.shopping_bag_outlined)),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
