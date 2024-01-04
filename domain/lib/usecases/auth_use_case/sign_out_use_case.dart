import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class SignOutUseCase extends FutureUseCase<void, void> {
  final AuthorisationRepository _authorisationRepository;

  SignOutUseCase({required AuthorisationRepository authorisationRepository})
      : _authorisationRepository = authorisationRepository;

  @override
  Future<void> execute(void input) async {
    await _authorisationRepository.signOut();
  }
}
