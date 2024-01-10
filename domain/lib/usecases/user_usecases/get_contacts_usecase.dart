import 'package:domain/usecases/usecase.dart';

import '../../models/user/user_model.dart';
import '../../repositories/user_repository.dart';

class GetContactsUseCase extends FutureUseCase<void, List<UserModel>> {
  final UserRepository _userRepository;

  GetContactsUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<List<UserModel>> execute(void input) async {
    return await _userRepository.getContacts();
  }
}
