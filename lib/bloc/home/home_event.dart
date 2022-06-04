part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class HomeVacantsList extends HomeEvent {}

