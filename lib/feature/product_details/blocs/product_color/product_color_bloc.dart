import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silver_market/core/model/models.dart';

part 'product_color_event.dart';
part 'product_color_state.dart';

class ProductColorBloc extends Bloc<ProductColorEvent, ProductColorState> {
  ProductColorBloc({required ProductColor initialColor})
      : super(ProductColorState(initialColor)) {
    on<SetSelectedColorEvent>(_onSetSelectedColorEvent);
  }

  Future<void> _onSetSelectedColorEvent(
    SetSelectedColorEvent event,
    Emitter<ProductColorState> emit,
  ) async {
    emit(ProductColorState(event.color));
  }
}
