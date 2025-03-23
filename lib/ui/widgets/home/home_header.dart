// home_header.dart

import 'package:app_flutter/ui/view_models/time_view_model%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeViewModelProvider);

    return Container(
      color: const Color.fromARGB(255, 172, 172, 172),
      padding: EdgeInsets.all(8.0),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              'Message',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              time,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
