part of 'home_mode_bloc.dart';

abstract class HomeModeEvent extends Equatable {
  const HomeModeEvent();

  @override
  List<Object> get props => [];
}

class SelectHomePartEvent extends HomeModeEvent {
  const SelectHomePartEvent(this.homePart);

  final HomePart homePart;

  @override
  List<Object> get props => [homePart];
}

class SelectCategoryEvent extends HomeModeEvent {
  const SelectCategoryEvent(this.category);

  final Category category;

  @override
  List<Object> get props => [category];
}

// This is used to move user up through the Home page
class MoveBackEvent extends HomeModeEvent {}
