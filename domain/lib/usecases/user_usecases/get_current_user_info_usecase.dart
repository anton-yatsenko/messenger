import 'package:domain/models/user/user_model.dart';
import 'package:domain/usecases/usecase.dart';

import '../../repositories/user_repository.dart';

class GetCurrentUserInfoUseCase extends FutureUseCase<void, UserModel> {
  final UserRepository _userRepository;

  GetCurrentUserInfoUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<UserModel> execute(void input) async {
    return await _userRepository.getCurrentUserInfo();
  }
}
