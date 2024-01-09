import 'package:data/repositories/authorisation_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final auth = MockFirebaseAuth();
  final authRepo = AuthorisationRepositoryImpl(auth: auth, database: );
  group('auth repo tests', () {
    group('create user tests', () {
      test('create user', () async {
        late UserCredential user;
        try {
          user = await authRepo.createUserWithEmailAndPassword(
              email: '', password: '1111');
        } on Exception catch (e) {
          print(e);
        }
        print(user);
        expect(user, isA<UserCredential>());
      });
    });
    group('sign in tests', () {});
  });
}
