import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecase.dart';

class SignOutUseCase extends FutureUseCase<void, void> {
  final UserRepository _userRepository;

  SignOutUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<void> execute(void input) async {
    await _userRepository.signOut();
  }
}
