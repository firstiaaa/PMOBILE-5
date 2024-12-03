import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Firstia',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late ColorStream colorStream;
  Color bgColor = Colors.blueGrey;

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer transformer;
  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  String values = '';

  @override
  void initState() {
    // super.initState(); // Pastikan untuk memanggil super.initState() di awal
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    // Stream stream = numberStreamController.stream;
    Stream stream = numberStreamController.stream.asBroadcastStream();

    subscription = stream.listen(
      (event) {
        setState(() {
          // lastNumber = event;
          values += '$event -';
        });
      },
      // onError: (error) {
      //   setState(() {
      //     lastNumber =
      //         -1; // Mengupdate lastNumber menjadi -1 saat terjadi kesalahan
      //   });
      // },
      // onDone: () {
      //   print('onDone was called!'); // Pesan saat stream selesai
      // },
    );
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event -';
      });
    });

    // transformer = StreamTransformer<int, int>.fromHandlers(
    //   handleData: (value, sink) {
    //     sink.add(value * 10); // Mengalikan nilai dengan 10
    //   },
    //   handleError: (error, trace, sink) {
    //     sink.add(-1); // Mengirim -1 jika terjadi kesalahan
    //   },
    //   handleDone: (sink) => sink.close(), // Menutup sink saat selesai
    // ),

    // stream.transform(transformer).listen((event) {
    //   setState(() {
    //     lastNumber = event; // Mengupdate lastNumber dengan event yang diterima
    //   });
    // }).onError((error) {
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
    subscription.cancel();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
    // numberStream.addNumberToSink(myNum);
    // numberStream.addError();
  }

  void changeColor() async {
    // await for (var eventColor in colorStream.getColors()) {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void stopStream() {
    numberStreamController.close(); // Menutup controller stream
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Firstia'),
      ),
      body: SizedBox(
        // decoration: BoxDecoration(color: bgColor),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
              ),
            ElevatedButton(
              onPressed: () => stopStream(), 
              child: const Text('Stop Subcription'),
              )
          ],
        ),
      ),
    );
  }
}
