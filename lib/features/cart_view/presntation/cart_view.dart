import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_basic_look/features/cart_view/presntation/widgets/cart_view_body.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/custom_icon_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const CustomiIconButton(
            icon: Icons.arrow_back,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 110),
          child: Text(
            'CART',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      body: const CartViewBody(),
    );
  }
}
