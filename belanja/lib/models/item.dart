class Item {
  final String name;
  final double harga;
  final String imageUrl; // Pastikan ada properti ini
  final int stok;
  final double rating;

  Item({
    required this.name,
    required this.harga,
    required this.imageUrl, // Pastikan ini ada di constructor
    required this.stok,
    required this.rating,
  });

  // Metode untuk mencetak informasi item (opsional)
  @override
  String toString() {
    return 'Item(name: $name, price: $harga, imageUrl: $imageUrl, stock: $stok, rating: $rating)';
  }
}