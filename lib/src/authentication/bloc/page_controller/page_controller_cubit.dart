import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PageControllerCubit extends Cubit<int> {
  PageControllerCubit() : super(0);

  togglePage(PageController controller, int oldIndex, int newIndex) {
    debugPrint('old index: $oldIndex');
    debugPrint('new index: $newIndex');

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

    emit(newIndex);
  }
}
