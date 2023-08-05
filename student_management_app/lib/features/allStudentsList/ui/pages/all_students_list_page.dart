import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/allStudentsList/bloc/all_student_list_bloc.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

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
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AllStudentListLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AllStudentListLoadedSuccessState) {
          return Scaffold(
            appBar: customAppbar(appbarTitle: 'All Students List'),
            body: SafeArea(
              child: ListView.builder(
                itemCount: state.studentsDatas.length,
                itemBuilder: (context, index) {
                  var image = state.studentsDatas[index]['studentProfileImage'];
                  return ListTile(
                    leading: image != null
                        ? CircleAvatar(backgroundImage: MemoryImage(image))
                        : const CircleAvatar(child: Icon(Icons.person),),
                    title: Text(
                      'name : ${state.studentsDatas[index]['fullName']}',
                    ),
                    subtitle:
                        Text('age : ${state.studentsDatas[index]['idNumber']}'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is AllStudentListErrorState) {
          return Scaffold(
            appBar: customAppbar(),
            body: const Center(
                child: Text(
              'Error ',
              style: TextStyle(
                  color: Colors.red, fontSize: 33, fontWeight: FontWeight.bold),
            )),
          );
        }
        return const SizedBox();
      },
    );
  }
}
