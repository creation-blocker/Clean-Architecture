import 'package:chat_message/features/auth/domain/entities/user.dart';
import 'package:chat_message/features/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);

  Future<User> call(String username, String password, String firstName, String lastName) {
    return repository.register(username, password, firstName, lastName);
  }
}