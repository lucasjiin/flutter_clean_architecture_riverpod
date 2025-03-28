// chat_message_section.dart

import 'dart:math';

import 'package:app_flutter/core/utils/time.dart';
import 'package:app_flutter/data/repositories/chat_repository_impl.dart';
import 'package:app_flutter/ui/chat/view_models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const outgoingMessages = [
  "Hello",
  'Hi',
  "Good Morning",
  "Have a nice day",
  "Apple",
  "Orange",
  "Dad",
  "Mom",
];

class _MessageBox extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessageBoxState();
}

class _MessageBoxState extends ConsumerState<_MessageBox> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(homeViewModelProvider.select((data) => data.history));
    final isConnected = ref.read(homeViewModelProvider).isConnected;
    int scrollJobCnt = 0;
    ref.listen(
      homeViewModelProvider.select((data) => data.history),
      (previous, next) {
        scrollJobCnt++;
        Future.delayed(
          Duration(milliseconds: 10),
          () {
            if (scrollJobCnt == 1) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut,
              );
            }

            scrollJobCnt--;
          },
        );
      },
    );

    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withValues(alpha: .84),
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(),
      //   borderRadius: BorderRadius.circular(38.5),
      // ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        child: ListView(
          controller: _scrollController,
          children: isConnected
              ? history.map((Message message) => _makeMessage(message)).toList()
              : [
                  _makeErrorText(),
                ],
        ),
      ),
    );
  }

  Widget _makeMessage(Message message) {
    return Column(
      crossAxisAlignment: message.type == MessageType.incoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(Time.now()),
        Text(
          message.data,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: message.type == MessageType.incoming ? TextAlign.start : TextAlign.end,
        ),
      ],
    );
  }

  Widget _makeErrorText() {
    return Text(
      "Not conected",
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }
}

class ChatBody extends ConsumerWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: _MessageBox(),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _makeCommandButtons(ref),
        )
      ],
    );
  }

  List<Widget> _makeCommandButtons(WidgetRef ref) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Text("send"),
          onPressed: () {
            final message = outgoingMessages[Random().nextInt(outgoingMessages.length)];
            ref.read(homeViewModelProvider.notifier).sendMessage(message);
          },
        ),
      ),
    ];
  }
}
