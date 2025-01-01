import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../providers.dart';

class ClientLocationBloc
    extends Bloc<ClientLocationEvent, ClientLocationState> {
  ClientLocationBloc() : super(ClientLocationStateNotInitialized()) {
    on<ClientLocationEvent>(
      (event, emit) async {
        if (event is ClientLocationEventCheckConnection) {
          emit(ClientLocationStateLoading());
        }
      },
      transformer: droppable(),
    );
  }
}

final class ClientLocationEventCheckConnection extends ClientLocationEvent {}

final class ClientLocationEvent {}

final class ClientLocationStateNotInitialized extends ClientLocationState {}

final class ClientLocationStateLoading extends ClientLocationState {}

final class ClientLocationStateCompleted extends ClientLocationState {
  ClientLocationStateCompleted();
}

final class ClientLocationStateFailed extends ClientLocationState {
  ClientLocationStateFailed();
}

final class ClientLocationState {}
