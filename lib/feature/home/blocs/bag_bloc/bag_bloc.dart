import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(EmptyBag());
}
