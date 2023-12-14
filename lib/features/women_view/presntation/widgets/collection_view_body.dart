import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/clothe_item_grid_view_bloc_builder.dart';

class CollectionViewBody extends StatelessWidget {
  const CollectionViewBody({super.key, required this.collectionName});
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 10,
          color: Colors.grey,
        ),
        ClotheItemGridViewBlocBuilder(
          collectionName: collectionName,
        )
      ],
    );
  }
}
