import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeAddStudentCardNavigateEvent>(homeAddStudentCardNavigateEvent);
    on<HomeAllStudentsListCardNavigateEvent>(
        homeAllStudentsListCardNavigateEvent);
  }

  FutureOr<void> homeAddStudentCardNavigateEvent(
      HomeAddStudentCardNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToAddStudentPageActionState());
  }

  FutureOr<void> homeAllStudentsListCardNavigateEvent(
      HomeAllStudentsListCardNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToAllStudentsListPageActionState());
  }
}
