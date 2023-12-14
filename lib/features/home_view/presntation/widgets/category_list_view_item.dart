import 'package:flutter/material.dart';
import 'package:the_basic_look/features/home_view/presntation/models/category_model.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          category.categoryName,
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
