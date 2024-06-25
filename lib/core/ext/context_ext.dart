import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/widgets/app_snackbar_widget.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';
import 'package:sumangalam/features/auth/presentation/bloc/auth/auth_cubit.dart';


extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  void exit<T>([T? data]) => Navigator.of(this, rootNavigator: true).pop(data);
  void pop<T>([T? data]) => Navigator.of(this).pop();

  double get sizeOfWidth => MediaQuery.sizeOf(this).width;
  double get sizeOfHeight => MediaQuery.sizeOf(this).height;

  T cubit<T extends Cubit<Object>>() => BlocProvider.of<T>(this);

  LoggedInUser get user => $sl.get<LoggedInUser>();

  Future<void> logout() async => cubit<AuthCubit>().signOut();

  Future<T?> goToPage<T>(Widget child) async {
    return Navigator.push( this, MaterialPageRoute(
      builder: (_) => child,
    ));
  }
    void showSnackbar(String content, AppSnackBarType type) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: AppSnackBarWidget(content: content, type: type),
      ),
    );
  }
   String dayOfTimeGreeting() {
    final currHour = DateTime.now().hour;

    return switch (currHour) {
      <= 12 => 'Good Morning,',
      > 12 && <= 16 => 'Good Afternoon,',
      > 16 && < 20 => 'Good Evening,',
      >= 20 => 'Good Night,',
      _ => '',
    };
  }
}

   

