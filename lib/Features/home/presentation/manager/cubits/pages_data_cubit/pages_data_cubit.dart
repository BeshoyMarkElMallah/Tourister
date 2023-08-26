import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourister/Features/search/data/static/places_list.dart';
import 'package:tourister/core/models/place_model.dart';

part 'pages_data_state.dart';

class PagesDataCubit extends Cubit<PagesDataState> {
  PagesDataCubit() : super(PagesDataInitial());

  List<PlaceModel> places = placesDatas;
  void getDataWithCategories(String category) {
    emit(PagesDataLoading());
    try {
      final List<PlaceModel> data =
          places.where((element) => element.category == category).toList();
      if (data.isEmpty) {
        emit(PagesDataEmpty());
      } else {
        emit(PagesDataLoaded(data: data));
      }
    } catch (e) {
      emit(PagesDataError(message: e.toString()));
    }
  }
}
