part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();

  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HistoricalDataModel vacants;
  const HomeLoaded(this.vacants);
}

class HomeError extends HomeState {
  final String? error;
  const HomeError(this.error);
}
