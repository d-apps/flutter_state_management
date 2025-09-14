import 'package:flutter/material.dart';

import 'cubit/cubit_view.dart';
import 'flutter_bloc/flutter_bloc_view.dart';
import 'riverpod/random_joke_generator/riverpod_view.dart';

enum StateManagementType {
  flutterBloc,
  riverpod,
  cubit,
  provider,
  mobx,
  getx;

  Widget widget() {
    switch (this) {
      case StateManagementType.flutterBloc:
        return FlutterBlocView();
      case StateManagementType.riverpod:
        return RiverpodView();
      case StateManagementType.cubit:
        return CubitView();
      case StateManagementType.provider:
        return const Placeholder();
      case StateManagementType.mobx:
        return const Placeholder();
      case StateManagementType.getx:
        return const Placeholder();
    }
  }

  Color color(){
    switch (this) {
      case StateManagementType.flutterBloc:
        return Colors.blue;
      case StateManagementType.riverpod:
        return Colors.green;
      case StateManagementType.cubit:
        return Colors.orange;
      case StateManagementType.provider:
        return Colors.purple;
      case StateManagementType.mobx:
        return Colors.red;
      case StateManagementType.getx:
        return Colors.teal;
    }
  }

}