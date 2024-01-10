import 'package:domain/usecases/usecase.dart';

import '../../repositories/user_repository.dart';

final class DeleteUserUseCase extends FutureUseCase<void, void> {
  final UserRepository _userRepository;

  DeleteUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<void> execute(void input) async {
    await _userRepository.deleteUser();
  }
}
