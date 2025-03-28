// home_page.dart

import 'package:app_flutter/core/widgets/page.dart';
import 'package:app_flutter/ui/home/home_body.dart';
import 'package:app_flutter/ui/home/home_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: HomeBody(),
      footer: HomeFooter(),
    );
  }
}
