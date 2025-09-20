import 'package:chat_message/features/auth/domain/entities/user.dart';
import 'package:chat_message/features/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;
  LoginUser(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}