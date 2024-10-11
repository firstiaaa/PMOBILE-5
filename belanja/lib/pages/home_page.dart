import 'package:flutter/material.dart';
import '../models/item.dart'; // Pastikan path import benar

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item',
                arguments: items[index],
              );
            },
            child: Card(
              child: ListTile(
                title: Text(items[index].name),
                subtitle: Text('Price: ${items[index].price}'),
              ),
            ),
          );
        },
      ),
    );
  }
}