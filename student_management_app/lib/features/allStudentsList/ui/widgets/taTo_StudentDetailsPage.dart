import 'package:flutter/material.dart';
import 'package:student_management_app/features/allStudentsList/bloc/all_student_list_bloc.dart';
import 'package:student_management_app/features/allStudentsList/ui/widgets/studentList_ListTile.dart';

GestureDetector tapToStudentDetailsPage(
    {required int index,
    required var image,
    required String fullName,
    required int idNumber,
    required AllStudentListBloc allStudentListBloc}) {
  return GestureDetector(
      onTap: () {
        allStudentListBloc
            .add(AllStudentListNavigateToStudentDetailsPage(index: index));
      },
      child: StudentListTileWidget(
          image: image, fullName: fullName, idNumber: idNumber));
}
