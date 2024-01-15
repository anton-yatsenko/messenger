part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class ContactRouteToAddContactPage extends ContactEvent {}

class ContactUpdatePage extends ContactEvent {}
