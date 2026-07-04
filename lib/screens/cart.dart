import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cart;
  final Function(Product) onRemove;

  CartScreen({required this.cart, required this.onRemove});

  double get total => cart.fold(0, (t, p) => t + p.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sepetim')),
      body: cart.isEmpty
          ? Center(child: Text('Sepetiniz boş'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final p = cart[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            p.image,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(p.title),
                        subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              onRemove(p);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Kaldırıldı')));
                            }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Toplam',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('\$${total.toStringAsFixed(2)}',
                          style:
                              TextStyle(fontSize: 18, color: Colors.green[700]))
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
