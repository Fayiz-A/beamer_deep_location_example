import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/navigation/products_location.dart';

class HomeLocation extends BeamLocation<BeamState> {

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        child: HomePage(),
        name: '/home',
        key: ValueKey('/home'),
        // onPopPage: BeamPage.routePop,
      ),
      if(state.pathPatternSegments.contains('products'))
        ...ProductsLocation().buildPages(context, state)
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/home',
    '/products',
    '/products/:id'
  ];

}