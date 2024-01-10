import 'package:core/config/app_config.dart';
import 'package:core/config/network/dio_config.dart';
import 'package:data/repositories/chat_repository_impl.dart';
import 'package:data/repositories/device_media_repository_impl.dart';
import 'package:domain/repositories/chat_repository.dart';
import 'package:domain/repositories/device_media_repository.dart';
import 'package:domain/usecases/auth_use_case/sign_in_use_case.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
import 'package:chat/chat.dart';
import 'package:data/data.dart';

import 'firebase_options.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await _initCore();
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

  void _initRepositories() {
    appLocator.registerSingleton<AuthorisationRepository>(
        AuthorisationRepositoryImpl(
            auth: FirebaseAuth.instance, database: FirebaseDatabase.instance));
    appLocator.registerSingleton<ChatRepository>(ChatRepositoryImpl(
      auth: FirebaseAuth.instance,
      database: FirebaseDatabase.instance,
      storage: FirebaseStorage.instance,
    ));
    appLocator.registerSingleton<DeviceMediaRepository>(
      DeviceMediaRepositoryImpl(
        imagePicker: appLocator<ImagePicker>(),
      ),
    );
    appLocator.registerSingleton<RemoteMediaRepository>(
      RemoteMediaRepositoryImpl(
        storage: FirebaseStorage.instance,
      ),
    );
    appLocator.registerSingleton<UserRepository>(
      UserRepositoryImpl(
        storage: FirebaseStorage.instance,
        auth: FirebaseAuth.instance,
        database: FirebaseDatabase.instance,
      ),
    );
  }

  void _initUsecases() {
    _initAuthorisationUsecases();
    _initChatUsecases();
    _initDeviceMediaUsecases();
  }

  void _initBlocs() {
    _initAuthorisationBlocs();
    _initChatBlocs();
  }

  void _initMappers() {
    appLocator.registerSingleton<UserMapper>(
      UserMapper(
        remoteMediaRepository: appLocator<RemoteMediaRepository>(),
      ),
    );
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

  _initChatUsecases() {
    appLocator.registerSingleton<CreateChatUseCase>(
        CreateChatUseCase(chatRepository: appLocator<ChatRepository>()));
  }

  _initChatBlocs() {
    appLocator.registerFactory<AllChatsBloc>(
      () => AllChatsBloc(
        appRouter: appLocator<AppRouter>(),
      ),
    );
    appLocator.registerFactory<ChatPageBloc>(
      () => ChatPageBloc(
        appRouter: appLocator<AppRouter>(),
      ),
    );
    appLocator.registerFactory<CreateChatBloc>(
      () => CreateChatBloc(
        takePhotoUseCase: appLocator<TakePhotoUseCase>(),
        pickPhotoFromDeviceUseCase: appLocator<PickPhotoFromDeviceUseCase>(),
        createChatUseCase: appLocator<CreateChatUseCase>(),
      ),
    );
  }

  _initDeviceMediaUsecases() {
    appLocator.registerSingleton<PickPhotoFromDeviceUseCase>(
      PickPhotoFromDeviceUseCase(
        deviceMediaRepository: appLocator<DeviceMediaRepository>(),
      ),
    );
    appLocator.registerSingleton<TakePhotoUseCase>(
      TakePhotoUseCase(
        deviceMediaRepository: appLocator<DeviceMediaRepository>(),
      ),
    );
  }

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  Future<void> _initDataDependencies() async {
    _initDio();

    //await _initFirebase();
  }
}
