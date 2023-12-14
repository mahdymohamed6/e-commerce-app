import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_basic_look/features/home_view/presntation/models/category_model.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/custom_icon_button.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/collection_view_body.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black87, // Set your desired color here
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            category.categoryName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        actions: const [
          CustomiIconButton(icon: Icons.shopping_bag_outlined),
        ],
      ),
      body: CollectionViewBody(
        collectionName: category.collection,
      ),
    );
  }
}
