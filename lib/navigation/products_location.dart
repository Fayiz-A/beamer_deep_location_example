import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ProductsLocation extends BeamLocation<BeamState> {

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        child: ProductsPage(),
        name: '/products',
        key: ValueKey('/products'),
        // onPopPage: BeamPage.routePop,
      ),
      if(state.pathParameters['id'] != null)
        BeamPage(
          child: ProductDetailPage(state.pathParameters['id']!), // id parameter will not be null due to check above
          name: '/products/${state.pathParameters['id']!}',
          key: ValueKey('/products/${state.pathParameters['id']!}'),
          // onPopPage: BeamPage.routePop,
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/products',
    '/products/:id'
  ];

}