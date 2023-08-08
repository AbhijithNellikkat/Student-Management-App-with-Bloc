import 'package:flutter/material.dart';

Future<void> deleteConfirmAlert(BuildContext context) async => showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Alert'),
          content: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('This is a delete alert dialog.'),
                Text('Would you like to confirm this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );




                                        // SlidableAction(
                                    //   onPressed: (context) {
                                    //     allStudentListBloc.add(
                                    //         AllStudentListNavigateToUpdatePageEvent(
                                    //             index: state.studentsDatas[index]['id']));
                                    //   },
                                    //   backgroundColor: Colors.green,
                                    //   foregroundColor: Colors.white,
                                    //   icon: Icons.edit,
                                    //   label: 'Update',
                                    // ),