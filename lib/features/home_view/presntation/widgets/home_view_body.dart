import 'package:flutter/material.dart';
import 'package:the_basic_look/core/utils/assets.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/category_list_view_builder.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/time_box.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Divider(
            height: 8,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            ' Winter Collection Coming Very Soon!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AssetData.summer2023,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const TimeBox(),
          const SizedBox(
            height: 45,
          ),
          const CategoryListViewBuilder()
        ],
      ),
    );
  }
}
