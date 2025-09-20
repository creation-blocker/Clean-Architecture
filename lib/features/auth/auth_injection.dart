import 'package:chat_message/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_message/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_message/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_message/features/auth/domain/usecases/login_user.dart';
import 'package:chat_message/features/auth/domain/usecases/register_user.dart';
import 'package:chat_message/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> authInjectionInit() async {
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerFactory(() => AuthBloc(loginUser: sl(), registerUser: sl()));
}