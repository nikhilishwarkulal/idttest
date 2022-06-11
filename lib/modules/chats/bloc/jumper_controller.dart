import 'package:flutter/material.dart';
import 'package:idttest/core/bloc/bloc.dart';

class JumperController extends Bloc<bool> {
  @override
  bool initDefaultValue() {
    return false;
  }

  ///[unJump]  jump shows an icon to scroll bottom.
  void unJump() {
    emit(true);
  }

  ///[jump]  jump to end and icon is hidden
  void jump(ScrollController controller) {
    controller.jumpTo(controller.position.maxScrollExtent);
    emit(false);
  }

  ///[jump]  hide the icon but don't jump to end.
  void jumpNoScroll() {
    emit(false);
  }
}
