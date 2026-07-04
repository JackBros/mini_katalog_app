import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final Function(Product) onAdd;

  ProductDetailScreen({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black87),
      body: Column(
        children: [
          Hero(
            tag: 'product-${product.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              child: Image.asset(
                product.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(product.description,
                        style: TextStyle(color: Colors.grey[800])),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700])),
                        ElevatedButton.icon(
                          onPressed: () {
                            onAdd(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sepete eklendi')));
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Sepete Ekle'),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                    SizedBox(height: 24),
                    Text('Özellikler',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text('- Yüksek kalite\n- Kompakt tasarım\n- Uzun pil ömrü',
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
