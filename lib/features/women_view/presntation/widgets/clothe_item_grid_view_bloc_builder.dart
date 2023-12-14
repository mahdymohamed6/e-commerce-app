import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_basic_look/features/women_view/data/data_sources/category_remote_data_sources.dart';
import 'package:the_basic_look/features/women_view/presntation/manger/collection_cubit/collection_cubit.dart';
import 'package:the_basic_look/features/women_view/presntation/widgets/clothe_item_grid_view_builder.dart';

class ClotheItemGridViewBlocBuilder extends StatelessWidget {
  const ClotheItemGridViewBlocBuilder({
    super.key,
    required this.collectionName,
  });
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final collectionCubit = CollectionCubit(RemoteDataSource(dio: Dio()));
        collectionCubit.getCollection(
            collection:collectionName); // Call the getCollection() method
        return collectionCubit;
      },
      child: BlocBuilder<CollectionCubit, CollectionState>(
        builder: (context, state) {
          if (state is CollectionSuccess) {
            return ClotheItemGridViewBuilder(
              product: state.products!,
            );
          } else if (state is CollectionFailure) {
            return Text(state.errMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
