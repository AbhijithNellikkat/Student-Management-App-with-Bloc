import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_management_app/features/addStudent/ui/pages/add_student_page.dart';
import 'package:student_management_app/features/allStudentsList/ui/pages/all_students_list_page.dart';
import 'package:student_management_app/utils/const/constants.dart';

import '../../features/home/ui/pages/home_page.dart';
import 'error_page.dart';

final GoRouter appRouter = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  initialLocation: Constants.homeRoutePath,
  routes: <RouteBase>[
    GoRoute(
      name: Constants.homeRouteName,
      path: Constants.homeRoutePath,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      name: Constants.addSrudentRouteName,
      path: Constants.addSrudentRoutePath,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          fullscreenDialog: true,
          key: state.pageKey,
          child: AddStudentPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: Constants.allStudentsListRouteName,
      path: Constants.allStudentsListRoutePath,
      builder: (context, state) => const AllStudentsListPage(),
    ),
  ],
);
