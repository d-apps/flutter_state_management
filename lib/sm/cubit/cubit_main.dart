
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'cubit_view.dart';

Widget cubitMain(){
  return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(home: CubitView())
  );
}