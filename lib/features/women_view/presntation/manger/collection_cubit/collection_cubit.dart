import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_basic_look/features/women_view/data/data_sources/category_remote_data_sources.dart';

import '../../../data/models/product_model.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  CollectionCubit(this.remoteDataSource) : super(CollectionInitial());
  RemoteDataSource remoteDataSource;
  List<ProductModel>? products;

  Future<void> getCollection({required String collection}) async {
    emit(CollectionLoading());
    try {
      emit(CollectionSuccess(
          products:
              await remoteDataSource.getCollection(collection: collection)));
    } on Exception catch (e) {
      emit(CollectionFailure(errMessage: e.toString()));
    }
  }
}
