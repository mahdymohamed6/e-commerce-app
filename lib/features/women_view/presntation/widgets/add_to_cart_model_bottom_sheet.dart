import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/add_to_Cart_button_in_bottom_sheet.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/color_list_view.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/image_price_name.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/size_list_view.dart';

class AddToCartModelBottomSheet extends StatelessWidget {
  const AddToCartModelBottomSheet({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 425,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImagePriceName(product: product),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 9,
            color: Color.fromARGB(255, 122, 120, 120),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Size',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const SizedBox(
            height: 6,
          ),
          const SizeListView(),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Color',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const SizedBox(
            height: 6,
          ),
          const ColorListView(),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            height: 9,
            color: Color.fromARGB(255, 122, 120, 120),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AddToCartButtonInBottomSheet(
              product: product,
            ),
          ),
        ]),
      ),
    );
  }
}
