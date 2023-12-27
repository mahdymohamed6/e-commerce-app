import 'package:flutter/material.dart';
import 'package:the_basic_look/core/utils/app_storge.dart';
import 'package:the_basic_look/features/cart_view/presntation/cart_view.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/custom_icon_button.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/home_view_body.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/logo.dart';
import 'package:the_basic_look/features/women_view/data/models/cart_item_model2/cart_item_model2.dart';
import 'package:the_basic_look/features/women_view/data/services/cart_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String token = getxStorge.read('token');
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
          InkWell(
              onTap: () async {
                List<CartModel> cartModel =
                    await CartServices().getCartItems(token: token);
                int? totalPrice =
                    await CartServices().getCartPrice(token: token);
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartView(
                        cartModel: cartModel,
                        totalPrice: totalPrice,
                      ),
                    ));
              },
              child:
                  const CustomiIconButton(icon: Icons.shopping_bag_outlined)),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
