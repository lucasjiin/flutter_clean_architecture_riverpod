// page.dart

import 'package:app_flutter/core/themes/colors.dart';
import 'package:app_flutter/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;

  const AppPage({super.key, this.header, this.body, this.footer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _makeHeader(context),
            _makeBody(context),
            _makeFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _makeHeader(BuildContext context) {
    if (header == null) {
      return Container();
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.header,
        padding: EdgeInsets.all(8.0),
        height: AppDimens.heightHeader,
        child: header,
      );
    }
  }

  Widget _makeBody(BuildContext context) {
    if (body == null) {
      return Container();
    } else {
      return Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 255, 190, 190),
          padding: EdgeInsets.all(8.0),
          child: body,
        ),
      );
    }
  }

  Widget _makeFooter(BuildContext context) {
    if (body == null) {
      return Container();
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.footer,
        height: AppDimens.heightFooter,
        child: footer,
      );
    }
  }
}
