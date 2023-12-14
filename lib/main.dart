import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_basic_look/core/utils/app_router.dart';
import 'package:the_basic_look/core/utils/simple_bloc_observer.dart';
import 'package:the_basic_look/features/women_view/data/data_sources/category_remote_data_sources.dart';
import 'package:dio/dio.dart';
import 'package:the_basic_look/features/women_view/presntation/manger/collection_cubit/collection_cubit.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  runApp(const TheBasicLook());
  Bloc.observer = SimpleBlocObserver();
}

class TheBasicLook extends StatelessWidget {
  const TheBasicLook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionCubit(RemoteDataSource(dio: Dio())),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
