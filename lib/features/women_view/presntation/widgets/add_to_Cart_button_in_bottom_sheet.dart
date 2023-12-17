import 'package:flutter/material.dart';
import 'package:the_basic_look/core/utils/app_storge.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:the_basic_look/features/women_view/data/services/cart_services.dart';

class AddToCartButtonInBottomSheet extends StatelessWidget {
  const AddToCartButtonInBottomSheet({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    String token = getxStorge.read('token');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          addToCartIsPressed(token, context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
              double.infinity, 55), // Set the desired width and height
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          side: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: const Text(
          'ADD TO CART',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void addToCartIsPressed(String token, BuildContext context) {
    CartServices()
        .postItem(
      size: 'S',
      token: token,
      id: product.id!,
    )
        .then((success) {
      if (success) {
        const snackBar = SnackBar(
          content: Text('Product added to cart successfully'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text('faild'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
