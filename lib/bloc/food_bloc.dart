import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:p2p/models/foodItem.dart';
import '../data/foodListRepo.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  List<FoodItem> foodItems;
  final FoodListRepo foodListRepo;
  FoodBloc(this.foodItems, this.foodListRepo);

  @override
  FoodState get initialState => FoodInitial();

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is GetFood) {
      try {
        final foodList = await foodListRepo.fetchFood();
        yield FoodLoaded(foodList);
        foodItems = foodList;
      } catch (e) {
        yield FoodLoadingError("Check Your Internet!");
        print(e);
      }
    }
  }
}
