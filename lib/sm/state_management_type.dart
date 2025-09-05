import 'package:flutter/material.dart';
import 'package:flutter_state_management/sm/cubit/cubit_main.dart';
import 'package:flutter_state_management/sm/riverpod/riverpod_main.dart';

import 'flutter_bloc/flutter_bloc_main.dart';

enum StateManagementType {
  flutterBloc,
  riverpod,
  cubit,
  provider,
  mobx,
  getx;

  Widget getMain() {
    switch (this) {
      case StateManagementType.flutterBloc:
        return flutterBlocMain();
      case StateManagementType.riverpod:
        return riverpodMain();
      case StateManagementType.cubit:
        return cubitMain();
      case StateManagementType.provider:
        return const Placeholder();
      case StateManagementType.mobx:
        return const Placeholder();
      case StateManagementType.getx:
        return const Placeholder();
    }
  }
}