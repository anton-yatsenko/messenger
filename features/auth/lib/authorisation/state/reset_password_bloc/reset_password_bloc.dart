import 'package:auth/router/auth_router.gm.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import "package:domain/usecases/export_usecases.dart";
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final AppRouter _appRouter;

  ResetPasswordBloc({
    required ResetPasswordUseCase resetPasswordUseCase,
    required AppRouter appRouter,
  })  : _resetPasswordUseCase = resetPasswordUseCase,
        _appRouter = appRouter,
        super(ResetPasswordWaiting()) {
    on<ResetPasswordAttempt>(_onResetPasswordAttempt);
    on<ResetPasswordWait>(_onResetPasswordWait);
  }

  _onResetPasswordAttempt(event, emit) async {
    if (event is ResetPasswordAttempt) {
      try {
        emit(ResetPasswordInProgress());
        await _resetPasswordUseCase.execute(event.email);
        _appRouter.push(const PasswordResetSuccessPopupDialog());
        emit(ResetPasswordSuccess());
      } on Exception catch (e) {
        if (e is InvalidEmailException) {
          emit(ResetPasswordInvalidEmail());
        } else if (e is UserNotFoundException) {
          emit(ResetPasswordUserNotFound());
        } else if (e is UnexpectedEventException) {
          emit(ResetPasswordUnexpectedEvent());
        }
      }
    }
  }

  _onResetPasswordWait(event, emit) {
    emit(ResetPasswordWaiting());
  }
}
