part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();

  @override
  List<Object> get props => [];
}

class Empty extends SavedState {}
