import 'package:flutter/material.dart';
import '../models/item.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue[1000],
      child: Column(
        children: [
          Text(
            'FIRSTIA AULIA WIDA AZIZAH (2241720135)',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Gula Putih',
      harga: 20000,
      imageUrl: 'images/gulaku.jpg',
      stok: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Garam Dapur',
      harga: 15000,
      imageUrl: 'images/garam.jpg',
      stok: 20,
      rating: 4.0,
    ),
    Item(
      name: 'Minyak Goreng',
      harga: 30000,
      imageUrl: 'images/minyak.jpg',
      stok: 20,
      rating: 4.0,
    ),
    Item(
      name: 'Mie Instan',
      harga: 5000,
      imageUrl: 'images/mie.jpg',
      stok: 20,
      rating: 4.0,
    ),
    Item(
      name: 'Kecap Manis',
      harga: 18000,
      imageUrl: 'images/kecap.jpg',
      stok: 20,
      rating: 4.0,
    ),
    Item(
      name: 'Sirup',
      harga: 25000,
      imageUrl: 'images/sirup.jpg',
      stok: 20,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue[300], // Warna latar belakang app bar
      ),
      body: Container(
        color: Colors.blue[50], // Warna latar belakang yang lebih terang
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/item',
          arguments: item,
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.blue[100], // Warna latar belakang card
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'imageHero${item.name}',
              child: Image.asset(
                item.imageUrl,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Ukuran teks lebih kecil
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text('Harga: Rp. ${item.harga},-'),
                  Text('Stok: ${item.stok} pcs'),
                  Text('Rating: ${item.rating} ⭐'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}