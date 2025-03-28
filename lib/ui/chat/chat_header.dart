// chat_header.dart

import 'package:app_flutter/ui/chat/view_models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatHeader extends ConsumerWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(homeViewModelProvider.select((data) => data.time));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            'My Chatting',
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
    );
  }
}
