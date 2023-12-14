import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';

class ImagePriceName extends StatelessWidget {
  const ImagePriceName({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    String carancy = ' -LE';
    return Row(
      children: [
        Container(
            height: 135,
            width: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              product.productImage,
              fit: BoxFit.fill,
            )),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.prodctName,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 85,
            ),
            Text(
              product.price.toString() + carancy,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        )
      ],
    );
  }
}
