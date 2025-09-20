import 'package:chat_message/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_message/features/auth/domain/entities/user.dart';
import 'package:chat_message/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String username, String password) {
    return remoteDataSource.login(username, password);
  }

  @override
  Future<User> register(String username, String password, String firstName, String lastName) {
    return remoteDataSource.register(username, password, firstName, lastName);
  }
}