import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:student_management_app/database/database.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentInitialState()) {
    on<AddStudentSaveButtonEvent>(addStudentSaveButtonEvent);
  }

  FutureOr<void> addStudentSaveButtonEvent(
      AddStudentSaveButtonEvent event, Emitter<AddStudentState> emit) async {
    try {
      final fullname = event.fullname;
      final idNumber = event.idNumber;
      var studentProfileImage = event.studentProfileImage;
      await StudentDatabase.insertStudent(
        studentProfileImage:studentProfileImage ,
        
        fullname: fullname,
        idNumber: idNumber,
        // studentProfileImage: studentProfileImage,
      );
      print('AddStudentSuccessSate => called');
      emit(AddStudentSuccessSate());
    } catch (e) {
      emit(AddStudentErrorState());
    }
  }
}
