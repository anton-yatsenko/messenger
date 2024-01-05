import 'package:domain/usecases/usecase.dart';

import '../../repositories/authorisation_repository.dart';

class ResetPasswordUseCase implements FutureUseCase<String, void> {
  final AuthorisationRepository _authorisationRepository;

  ResetPasswordUseCase(
      {required AuthorisationRepository authorisationRepository})
      : _authorisationRepository = authorisationRepository;

  @override
  Future<void> execute(String input) async {
    // TODO: implement execute
    return await _authorisationRepository.resetPassword(email: input);
  }
}
