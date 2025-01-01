import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../providers.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentStateNotInitialized()) {
    on<PaymentEvent>(
      (event, emit) async {
        if (event is PaymentEventOrderCreate) {
          emit(PaymentStateLoading());
        }
      },
      transformer: sequential(),
    );
  }
}

final class PaymentEventOrderStatusCheck extends PaymentEvent {
  PaymentEventOrderStatusCheck(
      {this.emitLoading = true});
  final bool emitLoading;
}

final class PaymentEventOrderCreate extends PaymentEvent {
  PaymentEventOrderCreate({this.openWebForm = false});
  final bool openWebForm;
}

final class PaymentEventTransactionsGet extends PaymentEvent {
  PaymentEventTransactionsGet();
}

final class PaymentEventSend extends PaymentEvent {
  PaymentEventSend();
}

final class PaymentEvent {}

final class PaymentStateNotInitialized extends PaymentState {}

final class PaymentStateLoading extends PaymentState {}

final class PaymentStateSent extends PaymentState {}

final class PaymentStateOrderStatus extends PaymentState {
  PaymentStateOrderStatus();
}

final class PaymentStateOrderCreated extends PaymentState {
  PaymentStateOrderCreated();

}

final class PaymentStatePaymentsLoaded extends PaymentState {
  PaymentStatePaymentsLoaded();
}

final class PaymentAccountStateFailed extends PaymentState {
  PaymentAccountStateFailed();
}

final class PaymentState {}
