import 'package:domain/usecases/usecase.dart';

import '../../repositories/authorisation_repository.dart';

class SignInUseCase
    extends FutureUseCase<({String email, String password}), void> {
  final AuthorisationRepository _authorisationRepository;

  SignInUseCase({required AuthorisationRepository authorisationRepository})
      : _authorisationRepository = authorisationRepository;

  @override
  Future<void> execute(input) async {
    try {
      await _authorisationRepository.signIn(
        email: input.email,
        password: input.password,
      );
    } on Exception {
      rethrow;
    }
  }
}
