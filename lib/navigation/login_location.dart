import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class LoginLocation extends BeamLocation<BeamState> {

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        child: LoginPage(),
        name: '/login',
        key: ValueKey('/login'),
        // onPopPage: BeamPage.routePop,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/login',
  ];

}