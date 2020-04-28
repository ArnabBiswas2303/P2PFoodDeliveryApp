import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/consumerRepo.dart';

part 'consumer_bloc_event.dart';
part 'consumer_bloc_state.dart';

class ConsumerBlocBloc extends Bloc<ConsumerBlocEvent, ConsumerBlocState> {
  final ConsumerRepo consumerRepo;
  ConsumerBlocBloc(this.consumerRepo);
  @override
  ConsumerBlocState get initialState => ConsumerBlocInitial();

  @override
  Stream<ConsumerBlocState> mapEventToState(
    ConsumerBlocEvent event,
  ) async* {
    if (event is GetName) {
      final cName = consumerRepo.getName;
      yield ConsumerName(cName);
    } else if (event is GetDrawerDetails) {
      final cName = consumerRepo.getName;
      final cImg = consumerRepo.getImg;
      yield ConsumerDrawerDetails(
        cName,
        cImg,
      );
    }
  }
}
