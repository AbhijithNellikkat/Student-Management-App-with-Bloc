import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_management_app/features/allStudentsList/bloc/all_student_list_bloc.dart';
import 'package:student_management_app/features/allStudentsList/ui/widgets/studentList_errorPage.dart';
import 'package:student_management_app/features/studentEdit/ui/pages/student_update.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

import '../../../studentDetails/ui/pages/student_details_page.dart';
import '../widgets/delete_confirm_alert.dart';
import '../widgets/studentList_loadingPage.dart';
import '../widgets/taTo_StudentDetailsPage.dart';

class AllStudentsListPage extends StatefulWidget {
  const AllStudentsListPage({super.key});

  @override
  State<AllStudentsListPage> createState() => _AllStudentsListPageState();
}

class _AllStudentsListPageState extends State<AllStudentsListPage> {
  final AllStudentListBloc allStudentListBloc = AllStudentListBloc();

  @override
  void initState() {
    allStudentListBloc.add(AllStudentListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllStudentListBloc, AllStudentListState>(
      bloc: allStudentListBloc,
      listenWhen: (previous, current) => current is AllStudentListActionState,
      buildWhen: (previous, current) => current is! AllStudentListActionState,
      listener: (context, state) {
        if (state is AllStudentListDeleteSuccessActionState) {
          allStudentListBloc.add(AllStudentListInitialEvent());
        } else if (state
            is AllStudentListNavigateToStudentsDetailsPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetailsPage(index: state.index),
              ));
        } else if (state is AllStudentListNavigarteToUpdatePageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentUpdatePage(index: state.index),
              ));
        }
      },
      builder: (context, state) {
        if (state is AllStudentListLoadingState) {
          return const StudentListLoadingPage();
        } else if (state is AllStudentListLoadedSuccessState) {
          return Scaffold(
              backgroundColor: Colors.grey.shade300,
              appBar: customAppbar(appbarTitle: ''),
              body: SafeArea(
                  child: ListView.builder(
                      itemCount: state.studentsDatas.length,
                      itemBuilder: (context, index) {
                        final String fullName =
                            state.studentsDatas[index]['fullName'];
                        var image =
                            state.studentsDatas[index]['studentProfileImage'];
                        final idNumber = state.studentsDatas[index]['idNumber'];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slidable(
                                endActionPane: ActionPane(
                                  motion: ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                        onPressed: (context) async {
                                          await deleteConfirmAlert(context);
                                          Future.delayed(
                                              const Duration(seconds: 3));
                                          allStudentListBloc.add(
                                              AllStudentListDeleteEvent(
                                                  id: state.studentsDatas[index]
                                                      ['id']));
                                        },
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete')
                                  ],
                                ),
                                child: tapToStudentDetailsPage(
                                    allStudentListBloc: allStudentListBloc,
                                    fullName: fullName,
                                    idNumber: idNumber,
                                    image: image,
                                    index: index)));
                      })));
        } else if (state is AllStudentListErrorState) {
          return const StudentListErrorPage();
        }
        return const SizedBox();
      },
    );
  }
}
