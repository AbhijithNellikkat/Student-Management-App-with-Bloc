import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:student_management_app/database/database.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentInitial()) {
    on<AddStudentSaveButtonEvent>(addStudentSaveButtonEvent);
  }

  FutureOr<void> addStudentSaveButtonEvent(
      AddStudentSaveButtonEvent event, Emitter<AddStudentState> emit) {
    try {
      final fullname = event.fullname;
      final idNumber = event.idNumber;
      StudentDatabase.insertStudent(fullname: fullname, idNumber: idNumber);
      emit(AddStudentSuccessSate());
    } catch (e) {
      emit(AddStudentErrorState());
    }
  }
}
