// home_page.dart

import 'dart:math';

import 'package:app_flutter/ui/view_models/chat_view_model.dart';
import 'package:app_flutter/ui/view_models/time_view_model%20.dart';
import 'package:app_flutter/ui/widgets/home/home_chat_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const outgoingMessages = [
  "Hello",
  'Hi',
  "Good Morning",
  "Have a nice day",
  "Apple",
  "Orange",
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          // header
          Container(
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
          ),
          // body
          Expanded(
            child: Container(
              constraints: BoxConstraints(minHeight: 500),
              color: const Color.fromARGB(255, 255, 190, 190),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HomeChatSection(),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text("Next"),
                    onPressed: () {
                      final message = outgoingMessages[Random().nextInt(outgoingMessages.length)];
                      ref.read(chatViewModelProvider.notifier).sendMessage(message);
                    },
                  ),
                ],
              ),
            ),
          ),
          // footer
          Container(
              color: const Color.fromARGB(255, 172, 172, 172),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Footer"),
                ],
              ))
        ],
      ),
    );
  }
}
