part of 'add_student_bloc.dart';

@immutable
abstract class AddStudentEvent {}

// ignore: must_be_immutable
class AddStudentSaveButtonEvent extends AddStudentEvent {
  String fullname;
  int idNumber;
  AddStudentSaveButtonEvent({required this.fullname , required this.idNumber});
}
