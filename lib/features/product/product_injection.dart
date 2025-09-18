import 'package:chat_message/features/product/domain/usecases/get_products.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/product_remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> productInjectionInit() async {
  //! Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  //! Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  //! Use case (only GetProducts)
  sl.registerLazySingleton(() => GetProducts(sl()));

  //! Bloc
  sl.registerFactory(
    () => ProductBloc(getProducts: sl()),
  );
}
