import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database/database.dart';

part 'all_student_list_event.dart';
part 'all_student_list_state.dart';

class AllStudentListBloc
    extends Bloc<AllStudentListEvent, AllStudentListState> {
  AllStudentListBloc() : super(AllStudentListInitial()) {
    on<AllStudentListInitialEvent>(allStudentListInitialEvent);
    on<AllStudentListDeleteEvent>(allStudentListDeleteEvent);
    on<AllStudentListNavigateToStudentDetailsPage>(
        allStudentListNavigateToStudentDetailsPage);
    on<AllStudentListNavigateToUpdatePageEvent>(
        allStudentListNavigateToUpdatePageEvent);
  }

  FutureOr<void> allStudentListInitialEvent(AllStudentListInitialEvent event,
      Emitter<AllStudentListState> emit) async {
    emit(AllStudentListLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    try {
      final dataList = await StudentDatabase.getAllStudents();
      emit(AllStudentListLoadedSuccessState(studentsDatas: dataList));
    } catch (e) {
      emit(AllStudentListErrorState());
    }
  }

  FutureOr<void> allStudentListDeleteEvent(AllStudentListDeleteEvent event,
      Emitter<AllStudentListState> emit) async {
    await StudentDatabase.deleteData(event.id);
    emit(AllStudentListDeleteSuccessActionState());
  }

  FutureOr<void> allStudentListNavigateToStudentDetailsPage(
      AllStudentListNavigateToStudentDetailsPage event,
      Emitter<AllStudentListState> emit) {
    emit(AllStudentListNavigateToStudentsDetailsPageActionState(
        index: event.index));
  }

  FutureOr<void> allStudentListNavigateToUpdatePageEvent(
      AllStudentListNavigateToUpdatePageEvent event,
      Emitter<AllStudentListState> emit) {
    emit(AllStudentListNavigarteToUpdatePageState(index: event.index ,studentsDatas: event.studentsDatas));
  }
}
