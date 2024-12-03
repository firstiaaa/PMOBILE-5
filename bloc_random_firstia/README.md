# bloc_random_firstia

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

NAMA    : FIRSTIA AULIA WIDA AZIZAH
KELAS   : 2241720135 / 11


(Soal 13) : Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

Jawab : Pola BLoC terlihat pada RandomNumberBloc, yang menggunakan StreamController untuk menerima event input (generateRandom) dan mengalirkan output angka acak (randomNumber). UI di file random_screen.dart menggunakan StreamBuilder untuk mendengarkan stream dari BLoC dan memperbarui tampilan secara otomatis, sementara event input dikirim melalui sink.

[Result the video](images\01.mp4)