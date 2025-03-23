// home_body.dart

import 'package:app_flutter/ui/widgets/home/home_chat_section.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 500),
        color: const Color.fromARGB(255, 255, 190, 190),
        padding: EdgeInsets.all(8.0),
        child: HomeChatSection(),
      ),
    );
  }
}
