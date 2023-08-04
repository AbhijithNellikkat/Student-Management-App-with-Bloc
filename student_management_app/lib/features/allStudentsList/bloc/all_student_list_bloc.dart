import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_management_app/database/database.dart';

part 'all_student_list_event.dart';
part 'all_student_list_state.dart';

class AllStudentListBloc
    extends Bloc<AllStudentListEvent, AllStudentListState> {
  AllStudentListBloc() : super(AllStudentListInitial()) {
    on<AllStudentListInitialEvent>(allStudentListInitialEvent);
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
}
