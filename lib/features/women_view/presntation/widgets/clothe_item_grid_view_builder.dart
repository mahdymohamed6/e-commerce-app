import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/cloth_item_card.dart';

class ClotheItemGridViewBuilder extends StatelessWidget {
  const ClotheItemGridViewBuilder({
    super.key,
    required this.product,
  });
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.48,
        ),
        itemCount: product.length, // Replace with the number of items you have
        itemBuilder: (BuildContext context, int index) {
          return ClotheCardItem(
            product: product[index],
          );
        },
      ),
    );
  }
}
