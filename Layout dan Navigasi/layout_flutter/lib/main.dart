import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32), // Padding di seluruh tepi
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Soal 1
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8), // Soal 2
                  child: const Text(
                    'Wisata Gunung Kelud',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Wlingi , Blitar , Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // Soal 2
                  ),
                ),
              ],
            ),
          ),
          // Soal 3
          Icon(
            Icons.star,
            color: Colors.red, // Set warna merah
          ),
          const Text(
            '41',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );

    // Buat widget buttonSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menjajarkan kolom
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Buat widget textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Kelud adalah gunung berapi yang terletak di tiga wilayah administratif : '
        'Kabupaten Kediri, Kabupaten Blitar, dan Kabupaten Malang, Provinsi Jawa Timur.'
        'Dikenal dengan kawahnya yang berwarna hijau ruby, Gunung Kelud menawarkan pengalaman wisata yang unik.'
        'Setelah erupsi pada tahun 2014, kawahnya terbentuk kembali dan kini dikelilingi oleh perbukitan hijau.'
        'Kawah ini merupakan daya tarik utama bagi wisatawan, serta terdapat jalur terowongan yang mengarah ke kawasan tersebut.'
        'Firstia Aulia Wida Azizah / 2241720135',
        softWrap: true,
      ),
      
    );

    return MaterialApp(
      title: 'Flutter layout: Firstia Aulia Wida Azizah / 2241720135',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // body: Column(
        body: ListView(
          children: [
            Image.asset(
              'images/kelud.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection, // Menambahkan textSection di sini
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8), // Margin hanya di bagian atas
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout: Firstia Aulia Wida Azizah / 2241720135',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }