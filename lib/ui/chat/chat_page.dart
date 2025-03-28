// chat_page.dart

import 'package:app_flutter/core/widgets/page.dart';
import 'package:app_flutter/ui/chat/chat_body.dart';
import 'package:app_flutter/ui/chat/chat_footer.dart';
import 'package:app_flutter/ui/chat/chat_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
      header: const ChatHeader(),
      body: const ChatBody(),
      footer: const ChatFooter(),
    );
  }
}
