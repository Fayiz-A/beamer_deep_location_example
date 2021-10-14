import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/home_location.dart';
import 'package:flutter_app/navigation/login_location.dart';

void main() => runApp(MyApp());

class NavigatorDelegate {
  static late BeamerDelegate navigatorDelegate;
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // We can have global access to navigator delegate this way
    NavigatorDelegate.navigatorDelegate = BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          LoginLocation(),
          HomeLocation(),
          // ProductsLocation(), Commented because I don't want anyone to go to this location directly
        ],
      ),
      routeListener: (RouteInformation routeInformation, BeamLocation beamLocation) {
        print(
          routeInformation.location
        );
      },
      initialPath: '/login',
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: NavigatorDelegate.navigatorDelegate,
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: NavigatorDelegate.navigatorDelegate,
        fallbackToBeamBack: false,
        alwaysBeamBack: false,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                NavigatorDelegate.navigatorDelegate.beamToNamed('/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Go to products page'),
              onPressed: () {
                NavigatorDelegate.navigatorDelegate.beamToNamed('/products');
              },
            ),
            ElevatedButton(
              child: Text('Go to product details page directly'),
              onPressed: () {
                NavigatorDelegate.navigatorDelegate.beamToNamed('/products/5');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to products detail page'),
          onPressed: () {
            NavigatorDelegate.navigatorDelegate.beamToNamed('/products/5');
          },
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {

  final String id;

  ProductDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Product details of id $id'),
            Text('Press back button to go back'),
          ],
        ),
      ),
    );
  }
}