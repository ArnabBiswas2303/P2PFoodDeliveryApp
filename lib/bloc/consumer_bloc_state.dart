part of 'consumer_bloc_bloc.dart';

@immutable
abstract class ConsumerBlocState {}

class ConsumerBlocInitial extends ConsumerBlocState {}

class ConsumerName extends ConsumerBlocState {
  final String cName;
  ConsumerName(this.cName);
}

class ConsumerDrawerDetails extends ConsumerBlocState {
  final String cName;
  final String cImg;
  ConsumerDrawerDetails(this.cName, this.cImg);
}
