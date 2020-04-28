part of 'consumer_bloc_bloc.dart';

@immutable
abstract class ConsumerBlocEvent {}

class GetName extends ConsumerBlocEvent {}

class GetDrawerDetails extends ConsumerBlocEvent {}
