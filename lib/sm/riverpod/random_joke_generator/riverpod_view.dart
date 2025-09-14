import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/sm/widgets/app_scaffold.dart';
import 'joke.dart';

class RiverpodView extends StatelessWidget {
  RiverpodView({super.key});

  static final Dio dio = Dio();

  final randomJokeProvider = FutureProvider<Joke>((ref) async {
    // Fetching a random joke from a public API
    final response = await dio.get<Map<String, Object?>>(
      'https://official-joke-api.appspot.com/random_joke',
    );
    return Joke.fromJson(response.data!);
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AppScaffold(
        title: 'Riverpod - Random Joke Generator',
        body: SizedBox.expand(
          child: Consumer(
            builder: (context, ref, child) {
              final randomJoke = ref.watch(randomJokeProvider);

              return Stack(
                alignment: Alignment.center,
                children: [
                  // During the second request, we show a special loading indicator
                  if (randomJoke.isRefreshing) const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(),
                    ),

                  switch(randomJoke){
                    AsyncValue(:final value?) => Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SelectableText(
                        '${value.setup}\n\n${value.punchline}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    AsyncError() => const Text('Error loading joke'),
                    AsyncValue() => const CircularProgressIndicator(),
                  },

                  Positioned(
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () => ref.invalidate(randomJokeProvider),
                      child: const Text('Get another joke'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }


}