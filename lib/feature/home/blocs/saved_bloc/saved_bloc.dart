import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(Empty());
}
