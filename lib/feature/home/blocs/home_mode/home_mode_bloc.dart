import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silver_market/core/model/models.dart';
import 'package:silver_market/utils/data_samples.dart';

part 'home_mode_event.dart';
part 'home_mode_state.dart';

class HomeModeBloc extends Bloc<HomeModeEvent, HomeModeState> {
  HomeModeBloc()
      : super(
          const SelectingPartition(
            stories: DataSamples.stories,
            homeParts: DataSamples.homeParts,
          ),
        ) {
    on<SelectHomePartEvent>(_onSelectHomePartEvent);
    on<SelectCategoryEvent>(_onSelectCategoryEvent);
    on<MoveBackEvent>(_onMoveUpEvent);
  }

  Future<void> _onSelectHomePartEvent(
    SelectHomePartEvent event,
    Emitter<HomeModeState> emit,
  ) async {
    emit(
      SelectingCategory(
        homePart: event.homePart,
        categories: DataSamples.categories,
      ),
    );
  }

  Future<void> _onSelectCategoryEvent(
    SelectCategoryEvent event,
    Emitter<HomeModeState> emit,
  ) async {
    if (state is! SelectingCategory) {
      return;
    }
    emit(
      SelectedCategory(
        homePart: (state as SelectingCategory).homePart,
        category: event.category,
      ),
    );
  }

  Future<void> _onMoveUpEvent(
    MoveBackEvent event,
    Emitter<HomeModeState> emit,
  ) async {
    if (state is SelectedCategory) {
      emit(
        SelectingCategory(
            homePart: (state as SelectedCategory).homePart,
            categories: DataSamples.categories),
      );
    } else if (state is SelectingCategory) {
      emit(const SelectingPartition(
        stories: DataSamples.stories,
        homeParts: DataSamples.homeParts,
      ));
    }
  }
}
