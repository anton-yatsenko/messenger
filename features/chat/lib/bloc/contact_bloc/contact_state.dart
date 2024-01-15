part of 'contact_bloc.dart';

@immutable
sealed class ContactState {}

class ContactInitial extends ContactState {}

class ContactWaiting extends ContactState {
  final List<UserModel> contacts;

  ContactWaiting({required this.contacts});
}

class ContactLoading extends ContactState {}

class ContactError extends ContactState {}
