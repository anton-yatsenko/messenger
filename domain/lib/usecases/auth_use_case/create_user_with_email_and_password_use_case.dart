import 'package:domain/repositories/authorisation_repository.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserWithEmailAndPasswordUseCase
    extends FutureUseCase<({String email, String password}), UserCredential> {
  final AuthorisationRepository _authorisationRepository;

  CreateUserWithEmailAndPasswordUseCase(
      AuthorisationRepository authorisationRepository)
      : _authorisationRepository = authorisationRepository;

  @override
  Future<UserCredential> execute(input) async {
    try {
      return await _authorisationRepository.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );
    } on Exception {
      rethrow;
    }
  }
}
