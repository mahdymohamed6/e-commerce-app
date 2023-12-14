part of 'collection_cubit.dart';

@immutable
abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionFailure extends CollectionState {
  final String errMessage;

  CollectionFailure({required this.errMessage});
}

class CollectionSuccess extends CollectionState {
  final List<ProductModel>? products;

  CollectionSuccess({required this.products});
}
