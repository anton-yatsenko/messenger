import 'package:domain/usecases/usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/authorisation_repository.dart';

class SignInWithGoogleUseCase extends FutureUseCase<void, void> {
  final AuthorisationRepository _authorisationRepository;

  SignInWithGoogleUseCase(AuthorisationRepository authorisationRepository)
      : _authorisationRepository = authorisationRepository;

  @override
  Future<void> execute(void input) async {
    return await _authorisationRepository.signInWithGoogle();
  }
}
