import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'models/product.dart';

void main() => runApp(MinikatalogApp());

class MinikatalogApp extends StatefulWidget {
  @override
  _MinikatalogAppState createState() => _MinikatalogAppState();
}

class _MinikatalogAppState extends State<MinikatalogApp> {
  final List<Product> cart = [];

  void addToCart(Product p) {
    setState(() {
      cart.add(p);
    });
  }

  void removeFromCart(Product p) {
    setState(() {
      cart.remove(p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.grey[900])),
      ),
      home: HomeScreen(onAddToCart: addToCart, onRemoveFromCart: removeFromCart, cart: cart),
    );
  }
}
