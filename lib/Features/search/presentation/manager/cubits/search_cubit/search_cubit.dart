import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourister/Features/search/data/static/places_list.dart';
import 'package:tourister/core/models/place_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final List<PlaceModel> places = placesDatas;

  void searchPlace(String query) {
    emit(SearchLoading());
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      final data = places
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (data.isEmpty) {
        emit(SearchEmpty(message: 'No places found'));
      } else {
        emit(SearchSuccess(places: data));
      }
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
