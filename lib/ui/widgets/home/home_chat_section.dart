// home_chat_section.dart

import 'dart:math';

import 'package:app_flutter/core/utils/time.dart';
import 'package:app_flutter/ui/view_models/chat_view_model.dart';
import 'package:app_flutter/ui/view_models/states/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const outgoingMessages = [
  "Hello",
  'Hi',
  "Good Morning",
  "Have a nice day",
  "Apple",
  "Orange",
];

class _ChatBody extends ConsumerStatefulWidget {
  const _ChatBody();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __ChatBodyState();
}

class __ChatBodyState extends ConsumerState<_ChatBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(chatViewModelProvider).history;
    final isConnected = ref.read(chatViewModelProvider).isConnected;

    ref.listen(chatViewModelProvider, (previous, next) {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeOut,
        );
    },);

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
              ? history
                  .map(
                    (Message message) => Column(
                      crossAxisAlignment:
                          message.type == MessageType.incoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        Text(Time.now()),
                        Text(
                          message.data,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: message.type == MessageType.incoming ? TextAlign.start : TextAlign.end,
                        ),
                      ],
                    ),
                  )
                  .toList()
              : [
                  Text(
                    "Not conected",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
        ),
      ),
    );
  }
}

class HomeChatSection extends ConsumerWidget {
  const HomeChatSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _ChatBody(),
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
    );
  }
}
