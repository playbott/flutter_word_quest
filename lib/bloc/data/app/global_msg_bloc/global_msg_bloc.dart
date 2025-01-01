import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cword/global.dart';
import '../../../providers.dart';

class GlobalMessageBloc extends Bloc<GlobalMessageEvent, GlobalMessageState> {
  GlobalMessageBloc() : super(GlobalMessageStateNoMessage()) {
    on<GlobalMessageEvent>(
      (event, emit) async {
        if (event is GlobalMessageEventGo) {
          emit(GlobalMessageStateGo(route: event.route));
        }

        if (event is GlobalMessageEventShow) {
          emit(GlobalMessageStateMessage(
            title: event.title,
            message: event.message,
            retryAction: () {},
            type: event.type,
          ));
        }
      },
      transformer: sequential(),
    );
  }
}

final class GlobalMessageEventHide extends GlobalMessageEvent {}

final class GlobalMessageEventShow extends GlobalMessageEvent {
  GlobalMessageEventShow({
    required this.title,
    required this.message,
    this.retryAction,
    required this.type,
  });

  final String title;
  final String message;
  final VoidCallback? retryAction;
  final ToastificationType type;
}

final class GlobalMessageEventGo extends GlobalMessageEvent {
  GlobalMessageEventGo({
    required this.route,
  });

  final String route;
}

final class GlobalMessageEvent {}

final class GlobalMessageStateNoMessage extends GlobalMessageState {}

final class GlobalMessageStateMessage extends GlobalMessageState {
  GlobalMessageStateMessage({
    required this.title,
    required this.message,
    required this.retryAction,
    required this.type,
  });

  final String title;
  final String message;
  final VoidCallback retryAction;
  final ToastificationType type;
}

final class GlobalMessageStateGo extends GlobalMessageState {
  GlobalMessageStateGo({
    required this.route,
  });

  final String route;
}

final class GlobalMessageState {}
