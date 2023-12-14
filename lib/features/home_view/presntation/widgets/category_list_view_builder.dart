import 'package:flutter/material.dart';
import 'package:the_basic_look/core/utils/assets.dart';
import 'package:the_basic_look/features/home_view/presntation/models/category_model.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/category_list_view_item.dart';
import 'package:the_basic_look/features/women_view/presntation/collection_view.dart';

class CategoryListViewBuilder extends StatelessWidget {
  const CategoryListViewBuilder({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(
        image: AssetData.womenImage,
        categoryName: 'Women',
        collection: 'feminine'),
    CategoryModel(
        image: AssetData.menImage,
        categoryName: 'Men',
        collection: 'masculine'),
    CategoryModel(
        image: AssetData.formalImage,
        categoryName: 'Formal Collection',
        collection: 'formal'),
    CategoryModel(
        image: AssetData.essentialImage,
        categoryName: 'Essentials',
        collection: 'essentials')
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CollectionView(category: categories[index]),
                    ));
              },
              child: CategoryListViewItem(
                category: categories[index],
              ),
            );
          }),
    );
  }
}
