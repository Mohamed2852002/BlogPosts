import 'package:flutter/material.dart';
import 'package:social_app/core/utils/styles.dart';

AppBar customAppBar(BuildContext context, String title, bool isHome) {
  return AppBar(
    leading:
        isHome
            ? null
            : IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
    centerTitle: true,
    title: Text(title),
    titleTextStyle: Styles.styleBold20(context),
  );
}
