import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:meta/meta.dart';
import 'package:domain/domain.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUseCase _getContactsUseCase;

  ContactBloc({
    required GetContactsUseCase getContactsUseCase,
  })  : _getContactsUseCase = getContactsUseCase,
        super(ContactInitial()) {
    on<ContactUpdatePage>(_onContactUpdateContactPage);
  }

  _onContactUpdateContactPage(event, emit) async {
    if (event is ContactUpdatePage) {
      emit(ContactLoading());
      try {
        final contacts = await _getContactsUseCase.execute(null);
        emit(ContactWaiting(contacts: contacts));
      } on Exception {
        emit(ContactError());
      }
    }
  }
}
