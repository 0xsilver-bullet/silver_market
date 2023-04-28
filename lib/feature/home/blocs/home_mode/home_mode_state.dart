part of 'home_mode_bloc.dart';

abstract class HomeModeState extends Equatable {
  const HomeModeState();

  @override
  List<Object> get props => [];
}

// This is the initial state where user can show storeis and select a home partition.
class SelectingPartition extends HomeModeState {
  const SelectingPartition({
    required this.stories,
    required this.homeParts,
  });

  final List<Story> stories;
  final List<HomePart> homeParts;

  @override
  List<Object> get props => [
        stories,
        homeParts,
      ];
}

class SelectingCategory extends HomeModeState {
  const SelectingCategory({
    required this.homePart,
    required this.categories,
  });

  final HomePart homePart;
  final List<Category> categories;

  @override
  List<Object> get props => [];
}

class SelectedCategory extends HomeModeState {
  const SelectedCategory({
    required this.homePart,
    required this.category,
  });

  final HomePart homePart;
  final Category category;

  @override
  List<Object> get props => [
        homePart,
        category,
      ];
}
