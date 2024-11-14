import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'widget/filter_carousel.dart'; 
import 'widget/takepicture_screen.dart';

Future<void> main() async {
  // Pastikan bahwa plugin services diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera yang tersedia pada perangkat.
  final cameras = await availableCameras();

  // Pilih kamera pertama dari daftar.
  final firstCamera = cameras.first;

  // Jalankan aplikasi dengan kamera pertama yang dipilih.
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera and Filter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Camera and Filter', camera: camera),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final CameraDescription camera;

  const MyHomePage({Key? key, required this.title, required this.camera}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke TakePictureScreen dengan kamera yang tersedia
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(camera: widget.camera),
                  ),
                );
              },
              child: const Text('Take a Picture'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}