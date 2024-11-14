import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'displaypicture_screen.dart'; // Pastikan path ini benar

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Membuat CameraController untuk menampilkan output kamera.
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // Inisialisasi CameraController.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose controller ketika widget dihapus.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Jika inisialisasi selesai, tampilkan pratinjau kamera.
            return CameraPreview(_controller);
          } else {
            // Jika tidak, tampilkan indikator loading.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Pastikan kamera telah diinisialisasi.
            await _initializeControllerFuture;

            // Ambil gambar dan dapatkan lokasi penyimpanan file gambar.
            final XFile image = await _controller.takePicture();

            // Jika context masih terpasang, navigasi ke DisplayPictureScreen.
            if (!context.mounted) return;
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // Jika terjadi error, tampilkan di konsol.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}