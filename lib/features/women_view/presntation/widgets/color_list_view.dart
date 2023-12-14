import 'package:flutter/material.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/size_widget.dart';

class ColorListView extends StatelessWidget {
  const ColorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['Black', 'Navy Blue', 'White'];
    return SizedBox(
      height: 40,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: sizes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizeListViewItem(
                size: sizes[index],
              ),
            );
          }),
    );
  }
}
