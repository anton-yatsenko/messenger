import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:meta/meta.dart';

part 'create_chat_event.dart';

part 'create_chat_state.dart';

class CreateChatBloc extends Bloc<CreateChatEvent, CreateChatState> {
  final TakePhotoUseCase _takePhotoUseCase;
  final PickPhotoFromDeviceUseCase _pickPhotoFromDeviceUseCase;
  final CreateChatUseCase _createChatUseCase;

  CreateChatBloc(
      {required TakePhotoUseCase takePhotoUseCase,
      required PickPhotoFromDeviceUseCase pickPhotoFromDeviceUseCase,
      required CreateChatUseCase createChatUseCase})
      : _takePhotoUseCase = takePhotoUseCase,
        _pickPhotoFromDeviceUseCase = pickPhotoFromDeviceUseCase,
        _createChatUseCase = createChatUseCase,
        super(const ChatPageWaiting(photo: null)) {
    on<CreateChatAttempt>(_onChatPageCreateChat);
    on<CreateChatPickPhotoFromDevice>(_onCreateChatPickPhotoFromDevice);
    on<CreateChatTakePhoto>(_onCreateChatTakePhoto);
  }

  _onChatPageCreateChat(event, emit) async {
    if (event is CreateChatAttempt) {
      await _createChatUseCase.execute((
        chatName: event.chatName,
        usersInChat: event.usersInChat,
        photo: state.photo
      ));
    }
  }

  _onCreateChatPickPhotoFromDevice(event, emit) async {
    if (event is CreateChatPickPhotoFromDevice) {
      final photo = await _pickPhotoFromDeviceUseCase.execute(null);
      emit(ChatPageSuccess(photo: photo));
    }
  }

  _onCreateChatTakePhoto(event, emit) async {
    if (event is CreateChatTakePhoto) {
      final photo = await _pickPhotoFromDeviceUseCase.execute(null);
      emit(ChatPageSuccess(photo: photo));
    }
  }
}
