// home_page.dart

import 'package:app_flutter/ui/widgets/home/home_body.dart';
import 'package:app_flutter/ui/widgets/home/home_chat_section.dart';
import 'package:app_flutter/ui/widgets/home/home_footer.dart';
import 'package:app_flutter/ui/widgets/home/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          HomeHeader(),
          HomeBody(),
          HomeFooter(),
        ],
      ),
    );
  }
}
