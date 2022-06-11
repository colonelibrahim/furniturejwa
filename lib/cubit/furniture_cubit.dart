import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture/models/models.dart';
import 'package:furniture/services/services.dart';

part 'furniture_state.dart';

class FurnitureCubit extends Cubit<FurnitureState> {
  FurnitureCubit() : super(FurnitureInitial());

  Future<void> getInteriors() async {
    ApiReturnValue<List<Furniture_interior>> result =
        await FurnitureServices.getInteriors();
    if (result.value != null) {
      emit(FurnitureLoaded(result.value));
    } else {
      emit(FurnitureLoadingFailed(result.message));
    }
  }
}
