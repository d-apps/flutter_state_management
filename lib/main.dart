import 'package:flutter/material.dart';
import 'package:flutter_state_management/sm/state_management_type.dart';

void main() {
  final smType = StateManagementType.flutterBloc;
  runApp(smType.getMain());
}
