import 'package:auth/router/auth_router.gm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';

import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:chat/router/chat_router.gm.dart';

part 'authorisation_event.dart';

part 'authorisation_state.dart';

class AuthorisationBloc extends Bloc<AuthorisationEvent, AuthorisationState> {
  final SignInUseCase _signInUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final AppRouter _appRouter;

  AuthorisationBloc({
    required SignInUseCase signInUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required AppRouter appRouter,
  })  : _signInUseCase = signInUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _appRouter = appRouter,
        super(AuthorisationWaiting()) {
    on<AuthorisationAttempt>(_onAuthorisationAttempt);
    on<AuthorisationSignInWithGoogle>(_onAuthorisationSignInWithGoogle);
    on<AuthorisationRouteToSignInPage>(_onAuthorisationRouteToSignInPage);
    on<AuthorisationWait>(_onAuthorisationWait);
    on<AuthorisationRouteToForgotPasswordPage>(
        _onAuthorisationRouteToForgotPasswordPage);
  }

  _onAuthorisationAttempt(event, emit) async {
    if (event is AuthorisationAttempt) {
      try {
        emit(AuthorisationInProgress());
        await _signInUseCase.execute((
          email: event.email,
          password: event.password,
        ));
        _appRouter.replaceAll([const AllChatsRoute()]);
        emit(AuthorisationSuccess());
      } on Exception catch (e) {
        if (e is InvalidEmailException) {
          emit(AuthorisationInvalidEmail());
        } else if (e is UserDisabledException) {
          emit(AuthorisationUserDisabled());
        } else if (e is InvalidCredentialException) {
          emit(AuthorisationInvalidCredential());
        } else if (e is EmailNotVerifiedException) {
          emit(AuthorisationEmailNotVerified());
        } else if (e is UnexpectedEventException) {
          emit(AuthorisationUnexpectedEvent());
        }
      }
    }
  }

  _onAuthorisationSignInWithGoogle(event, emit) {
    try {
      emit(AuthorisationInProgress());
      _signInWithGoogleUseCase.execute(null);
      emit(AuthorisationSuccess());
    } on Exception {
      emit(AuthorisationUnexpectedEvent());
    }
  }

  _onAuthorisationRouteToSignInPage(event, emit) {
    _appRouter.push(const RegistrationRoute());
  }

  _onAuthorisationWait(event, emit) {
    emit(AuthorisationWaiting());
  }

  _onAuthorisationRouteToForgotPasswordPage(event, emit) {
    _appRouter.push(const ForgotPasswordRoute());
  }
}
