import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cword/data/datasources/locale/log_service/hive_log_service.dart';
import 'package:cword/data/datasources/locale/log_service/hive_log_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterState('/home')) {
    on<RouterEvent>(
      (event, emit) async {
        print('event.newRoute: ${event.newRoute}');
        await AppLogService.addLog(event.newRoute, type: AppLogType.navigation);
        emit(RouterState(event.newRoute));
      },
      transformer: sequential(),
    );
  }
}

class RouterEvent {
  RouterEvent(this.newRoute);

  final String newRoute;
}

class RouterState {
  RouterState(this.currentRoute);

  final String currentRoute;
}
