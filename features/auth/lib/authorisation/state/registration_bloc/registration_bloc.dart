import 'package:auth/router/auth_router.gm.dart';
import 'package:domain/domain.dart';
import "package:domain/usecases/export_usecases.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final CreateUserWithEmailAndPasswordUseCase
      _createUserWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase _createUserWithGoogleUseCase;
  final AppRouter _appRouter;

  RegistrationBloc(
      {required CreateUserWithEmailAndPasswordUseCase
          createUserWithEmailAndPasswordUseCase,
      required SignInWithGoogleUseCase createUserWithGoogleUseCase,
      required AppRouter appRouter})
      : _createUserWithEmailAndPasswordUseCase =
            createUserWithEmailAndPasswordUseCase,
        _createUserWithGoogleUseCase = createUserWithGoogleUseCase,
        _appRouter = appRouter,
        super(RegistrationWaiting()) {
    on<RegistrationWithEmailAndPasswordAttempt>(
        _onRegistrationWithEmailAndPasswordAttempt);
    on<RegistrationWithGoogleAttempt>(_onRegistrationWithGoogleAttempt);
  }

  _onRegistrationWithGoogleAttempt(event, emit) async {
    if (event is RegistrationWithGoogleAttempt) {
      await _createUserWithGoogleUseCase.execute(null);
    }
  }

  _onRegistrationWithEmailAndPasswordAttempt(event, emit) async {
    if (event is RegistrationWithEmailAndPasswordAttempt) {
      try {
        emit(RegistrationInProgress());
        await _createUserWithEmailAndPasswordUseCase
            .execute((email: event.email, password: event.password));
        _appRouter.push(const RegistrationSuccessPopupDialog());
        emit(RegistrationSuccess());
      } on Exception catch (e) {
        if (e is WeakPasswordException) {
          emit(RegistrationWeakPassword());
        } else if (e is EmailAlreadyInUseException) {
          emit(RegistrationEmailAlreadyInUse());
        } else if (e is InvalidEmailException) {
          emit(RegistrationInvalidEmail());
        } else if (e is UnexpectedEventException) {
          emit(RegistrationUnexpectedEvent());
        }
      }
    }
  }
}
