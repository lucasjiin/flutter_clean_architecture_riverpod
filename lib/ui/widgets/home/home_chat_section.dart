// home_chat_section.dart

import 'package:app_flutter/ui/view_models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeChatSection extends ConsumerWidget {
  const HomeChatSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(chatViewModelProvider).history;
    final isConnected = ref.read(chatViewModelProvider).isConnected;

    return Expanded(
      child: Container(
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
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: ListView(
            children: isConnected
                ? history
                    .map(
                      (String message) => Text(
                        message,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
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
      ),
    );
  }
}
