part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<PlaceModel> places;

  SearchSuccess({required this.places});
}

class SearchError extends SearchState {
  final String error;

  SearchError({required this.error});
}

class SearchEmpty extends SearchState {
  final String message;

  SearchEmpty({required this.message});
}
