part of 'pages_data_cubit.dart';

@immutable
sealed class PagesDataState {}

final class PagesDataInitial extends PagesDataState {}

final class PagesDataLoading extends PagesDataState {}

final class PagesDataLoaded extends PagesDataState {
  PagesDataLoaded({
    required this.data,
  });
  final List<PlaceModel> data;
}

final class PagesDataError extends PagesDataState {
  PagesDataError({
    required this.message,
  });
  final String message;
}

final class PagesDataEmpty extends PagesDataState {}
