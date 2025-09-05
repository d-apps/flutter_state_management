import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_event.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_state.dart';

class FlutterBlocView extends StatelessWidget {
  const FlutterBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state){
                return Text('${state.count}');
              },
            ),
            ElevatedButton(
                onPressed: () => counterBloc.add(CounterIncrementEvent()),
                child: Text("Tap +")
            ),
            ElevatedButton(
                onPressed: () => counterBloc.add(CounterDecrementEvent()),
                child: Text("Tap -")
            ),
            ElevatedButton(
                onPressed: () => counterBloc.add(CounterResetEvent()),
                child: Text("Reset")
            )
          ],
        ),
      ),
    );
  }
}
