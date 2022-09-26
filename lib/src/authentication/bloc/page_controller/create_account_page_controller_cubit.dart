import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_clone_app/src/authentication/bloc/create_account/create_account_bloc.dart';

class PageControllerCubit extends Cubit<int> {
  PageControllerCubit() : super(0);

  togglePage(BuildContext context, PageController controller, int oldIndex,
      int newIndex) {
    if (oldIndex < newIndex) {
      controller.nextPage(
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
    } else {
      controller.previousPage(
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
    }

    BlocProvider.of<CreateAccountBloc>(context).add(NewPageTriggered());

    emit(newIndex);
  }
}
