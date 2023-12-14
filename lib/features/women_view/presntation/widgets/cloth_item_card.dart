import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/add_to_cart_button.dart';

class ClotheCardItem extends StatelessWidget {
  const ClotheCardItem({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    String carancy = '- LE';
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.78,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.network(
                product.productImage,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text(
                  product.prodctName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.price.toString() + carancy,
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                AddToCartButton(
                  product: product,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
