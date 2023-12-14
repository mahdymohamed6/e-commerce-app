import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/add_to_cart_model_bottom_sheet.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddToCartModelBottomSheet(
                  product: product,
                );
              });
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
              double.infinity, 30), // Set the desired width and height
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: const Text('ADD TO CART'),
      ),
    );
  }
}
