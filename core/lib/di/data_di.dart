import 'package:core/config/app_config.dart';
import 'package:core/config/network/dio_config.dart';
import 'package:domain/usecases/auth_use_case/sign_in_use_case.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

import 'app_di.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/auth_use_case/create_user_with_email_and_password_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:data/errors/error_handler.dart';
import 'package:data/providers/api_provider.dart';
import 'package:data/repositories/authorisation_repository_impl.dart';
import 'package:navigation/app_router/app_router.dart';

import 'package:auth/auth.dart';

import 'firebase_options.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initCore();
    _initRepositories();
    _initUsecases();
    _initBlocs();
  }

  Future<void> _initCore() async {
    await EasyLocalization.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    appLocator.registerSingleton<AppRouter>(AppRouter());
    appLocator.registerSingleton<ImagePicker>(ImagePicker());
  }

  Future<void> _initDataDependencies() async {
    _initDio();
    _initApi();
    //await _initFirebase();
  }

  void _initRepositories() {
    appLocator.registerSingleton<AuthorisationRepository>(
        AuthorisationRepositoryImpl(
            auth: FirebaseAuth.instance, database: FirebaseDatabase.instance));
  }

  void _initUsecases() {
    _initAuthorisationUsecases();
  }

  void _initBlocs() {
    _initAuthorisationBlocs();
  }

  void _initAuthorisationUsecases() {
    appLocator.registerSingleton<CreateUserWithEmailAndPasswordUseCase>(
        CreateUserWithEmailAndPasswordUseCase(
            appLocator<AuthorisationRepository>()));
    appLocator.registerSingleton<SignInWithGoogleUseCase>(
        SignInWithGoogleUseCase(appLocator<AuthorisationRepository>()));
    appLocator.registerSingleton<SignInUseCase>(SignInUseCase(
        authorisationRepository: appLocator<AuthorisationRepository>()));
    appLocator.registerSingleton<SignOutUseCase>(SignOutUseCase(
      authorisationRepository: appLocator<AuthorisationRepository>(),
    ));
    appLocator.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase(
        authorisationRepository: appLocator<AuthorisationRepository>()));
  }

  void _initAuthorisationBlocs() {
    appLocator.registerFactory<AuthorisationBloc>(() => AuthorisationBloc(
          signInUseCase: appLocator<SignInUseCase>(),
          signInWithGoogleUseCase: appLocator<SignInWithGoogleUseCase>(),
          appRouter: appLocator<AppRouter>(),
        ));
    appLocator.registerFactory<RegistrationBloc>(() => RegistrationBloc(
          createUserWithGoogleUseCase: appLocator<SignInWithGoogleUseCase>(),
          createUserWithEmailAndPasswordUseCase:
              appLocator<CreateUserWithEmailAndPasswordUseCase>(),
          appRouter: appLocator<AppRouter>(),
        ));
    appLocator.registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc(
          resetPasswordUseCase: appLocator<ResetPasswordUseCase>(),
          appRouter: appLocator<AppRouter>(),
        ));
  }

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
  }

// Future<void> _initFirebase() async {
//   appLocator.registerSingleton<FirebaseApp>(await Firebase.initializeApp());
// }
}
