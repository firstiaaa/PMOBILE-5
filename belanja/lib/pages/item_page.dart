import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        color: Colors.blue[50],
        child: SingleChildScrollView( // Menggunakan SingleChildScrollView
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'imageHero${itemArgs.name}', 
                  child: Image.network(itemArgs.imageUrl),
                ),
                SizedBox(height: 20),
                Text('Harga: Rp. ${itemArgs.harga},-'), // Menggunakan itemArgs.harga
                Text('Stok: ${itemArgs.stok} pcs'), // Menggunakan itemArgs.stok
                Text('Rating: ${itemArgs.rating} ⭐'), // Menggunakan itemArgs.rating
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}