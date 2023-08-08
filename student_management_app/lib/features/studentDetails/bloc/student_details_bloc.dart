import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../database/database.dart';

part 'student_details_event.dart';
part 'student_details_state.dart';

class StudentDetailsBloc
    extends Bloc<StudentDetailsEvent, StudentDetailsState> {
  StudentDetailsBloc() : super(StudentDetailsInitial()) {
    on<StudentDetailsInitialEvent>(studentDetailsInitialEvent);
  }

  FutureOr<void> studentDetailsInitialEvent(StudentDetailsInitialEvent event,
      Emitter<StudentDetailsState> emit) async {
    emit(StudentDetailsLoadingState());
    try {
      final dataList = await StudentDatabase.getAllStudents();
      emit(StudentDetailsLoadedSuccessState(students: dataList));
    } catch (e) {
      emit(StudentDetailsErrorState());
    }
  }
}
