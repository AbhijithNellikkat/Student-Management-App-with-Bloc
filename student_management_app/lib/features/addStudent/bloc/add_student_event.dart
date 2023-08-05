part of 'add_student_bloc.dart';
 class AddStudentEvent {}

// ignore: must_be_immutable
class AddStudentSaveButtonEvent extends AddStudentEvent {
  String fullname;
  int idNumber;
  // ignore: prefer_typing_uninitialized_variables
  var studentProfileImage;
  
  AddStudentSaveButtonEvent({required this.fullname, required this.idNumber, required this.studentProfileImage });
}
