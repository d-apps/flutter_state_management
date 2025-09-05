import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CubitView extends StatelessWidget {
  const CubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("How have pushed the button this many times:"),
            BlocBuilder<CounterCubit, int>(
              builder: (BuildContext context, int count){
                return Text('$count');
              },
            ),
            ElevatedButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: Text("Tap")
            )
          ],
        ),
      ),
    );
  }
}
