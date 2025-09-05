import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/sm/riverpod/riverpod_view.dart';

Widget riverpodMain(){
  return ProviderScope(
      child: MaterialApp(home: RiverpodView())
  );
}