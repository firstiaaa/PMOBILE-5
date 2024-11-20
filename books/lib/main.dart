import 'dart:async';
import 'package:books/geolocation.dart';
import 'package:books/navigation_dialog.dart';
import 'package:books/navigation_first.dart';
import 'package:books/navigation_second.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationDialogScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String myPosition = ''; // Posisi awal kosong untuk loading awal
  String result = '';
  bool isLoading = false; // Status loading untuk tombol GO!


  // Simulasi pengambilan posisi
  Future<void> _getPosition() async {
    setState(() {
      myPosition = ''; // Mulai dengan posisi kosong (loading awal)
    });
    // Tambahkan delay untuk memastikan animasi loading terlihat
    await Future.delayed(const Duration(seconds: 3)); // Simulasi loading selama 3 detik
    setState(() {
      myPosition = 'Position Found!'; // Data ditemukan setelah loading
    });
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  // void returnFG() {
  //   FutureGroup<int> futureGroup = FutureGroup<int>();
  //   futureGroup.add(returnOneAsync());
  //   futureGroup.add(returnTwoAsync());
  //   futureGroup.add(returnThreeAsync());
  //   futureGroup.close();
  //   futureGroup.future.then((List<int> value) {
  //     int total = 0;
  //     for (var element in value) {
  //       total += element;
  //     }
  //     setState(() {
  //       result = total.toString();
  //     });
  //   });
  // }

  void returnFG() {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> values) {
      int total = 0;
      for (var value in values) {
        total += value;
      }
      setState(() {
        result = total.toString();
      });
    }).catchError((error) {
      setState(() {
        result = 'An error occurred: $error';
      });
    });
  }

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await new Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  // Future calculate() async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   completer.complete(42);
  // }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Logika menentukan widget berdasarkan loading awal
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator() // Tampilkan loading jika myPosition kosong
        : Text(myPosition); // Tampilkan posisi jika sudah tersedia

    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future (Firstiaaa)'),
      ),
      body: Center(
        child: myPosition == ''
            ? myWidget // Tampilkan loading awal jika myPosition masih kosong
            : Column(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ) // Indikator loading dalam tombol
                        : const Text('GO!'),
                    onPressed: isLoading
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true; // Mulai loading tombol
                            });

                            try {
                              await returnError(); // Jalankan proses async
                              setState(() {
                                result = 'Success';
                              });
                            } catch (error) {
                              setState(() {
                                result = error.toString();
                              });
                            } finally {
                              setState(() {
                                isLoading = false; // Selesai loading tombol
                              });
                              print('Complete');
                            }
                          },
                  ),
                  const Spacer(),
                  Text(result),
                  const Spacer(),
                  if (result.isEmpty) const CircularProgressIndicator(),
                  const Spacer(),
                ],
              ),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       const Spacer(),
      //       ElevatedButton(
      //         child: const Text('GO!'),
      //         onPressed: () async {
      //           // setState(() {});
      //           // getData().then((value) {
      //           //   setState(() {
      //           //     result = value.body.toString().substring(0, 450);
      //           //   });
      //           // }).catchError((_) {
      //           //   setState(() {
      //           //     result = 'An error occurred';
      //           //   });
      //           // });

      //           //count();

      //           // getNumber().then((value) {
      //           //   setState(() {
      //           //     result = value.toString();
      //           //   });
      //           // }).catchError((e) {
      //           //   result = 'An error occured';
      //           // });

      //           // returnFG();

      //           returnError().then((value) {
      //             setState(() {
      //               result = 'Succes';
      //             });
      //           }).catchError((onError) {
      //             setState(() {
      //               result = onError.toString();
      //             });
      //           }).whenComplete(() => print('Complete'));
      //         },
      //       ),

      //       const Spacer(),
      //       Text(result),
      //       const Spacer(),
      //       if (result.isEmpty) const CircularProgressIndicator(),
      //       const Spacer(),
      //     ],
      //   ),
      // ),
    );
  }

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/zA36EAAAQBAJ';
    final uri = Uri.https(authority, path);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
