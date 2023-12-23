import 'package:flutter/material.dart';
import 'package:pinjam_buku/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Books product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${product.fields.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Amount: ${product.fields.amount}'),
            const SizedBox(height: 10),
            Text('Description: ${product.fields.description}'),
            // Tambahkan atribut lainnya sesuai kebutuhan

            // Tombol untuk kembali ke halaman daftar item
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to List'),
            ),
          ],
        ),
      ),
    );
  }
}
