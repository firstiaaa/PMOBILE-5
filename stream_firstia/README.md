# stream_nama

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

NAMA : FIRSTIA AULIA WIDA AZIZAH
NIM  : 2241720135 / TI - 3H

# PRAKTIKUM 1

(Soal 1) : Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

(Soal 2) : Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

(Soal 3) : Jelaskan fungsi keyword yield* pada kode tersebut!
Apa maksud isi perintah kode tersebut?

Jawab : Dalam konteks kode tersebut yield* digunakan untuk meneruskan aliran nilai dari satu stream ke stream lainnya. async* menandakan bahwa fungsi tersebut adalah generator asynkron , yield* ini merupakan kata kunci yang digunakan untuk meneruskan semua nilai dari stream yang dihasilkan oleh Stream.periodic. Dengan menggunakan yield* fungsi getColors tidak perlu mengiterasi sendiri nilai-nilai dari stream yang dihasilkan. Sebagai gantinya , semua nilai yang dihasilkan oleh Stream.periodic akan diteruskan langsung.

(Soal 4) : Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

[Result the video](images/01.mp4)

(Soal 5) : Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

Jawab : Listen digunakan untuk stream sedangkan await digunakan untuk future. Lalu Listen mendengarkan data secara terus menerus sedangkan await menunggu hasil dari operasi asinkron. Listen secara eksekusi yaitu kode tetap berjalan saat menunggu data baru sedangkan await kode tertahan sampai hasil tersedia. Dalam callback listen menggunakan callback untuk setiap nilai baru sedangkan await mengembalikan nilai setelah selesai.

Hasilnya setelah di running sama saja seperti sebelumnya hanya berbeda dalam penggunaan listen dan await saja.

# PRAKTIKUM 2

(Soal 6) : Jelaskan maksud kode langkah 8 dan 10 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

Jawab :

[Result the video](images\02.mp4)
Perintah pada langkah ke 8 ini mengatur aliran data untuk angka acak yang dihasilkan oleh NumberStream. Dengan menambahkan listener pada stream, setiap kali angka baru ditambahkan ke stream, lastNumber akan diperbarui, dan tampilan aplikasi akan diperbarui secara otomatis. Sedangkan langkah 10 metode addRandomNumber() adalah cara untuk menghasilkan dan mengirim angka acak ke stream, yang kemudian akan diteruskan kepada UI untuk diperbarui.

(Soal 7) : Jelaskan maksud kode langkah 13 sampai 15 tersebut!
Kembalikan kode seperti semula pada Langkah 15, comment addError() agar Anda dapat melanjutkan ke praktikum 3 berikutnya.

Jawab :

Langkah 13 hingga 15 bertujuan untuk meningkatkan penanganan kesalahan dalam stream. Pada langkah 13, kode addError('error'); ditambahkan untuk mengirimkan sinyal kesalahan ke sink dari StreamController, yang memungkinkan aliran data untuk menginformasikan bahwa terjadi kesalahan. Langkah 14 melibatkan penambahan metode onError dalam listen pada stream di initState(), di mana ketika kesalahan terjadi, fungsi ini mengubah state lastNumber menjadi -1 untuk menunjukkan adanya masalah. Langkah 15 memperbarui metode addRandomNumber() dengan mengomentari baris yang menghasilkan angka acak dan menambahkan numberStream.addError('error');, yang mensimulasikan kesalahan untuk menguji respons aplikasi terhadap kondisi tersebut.


# PRAKTIKUM 3

(Soal 8) : Jelaskan maksud kode langkah 1-3 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

Jawab :

Langkah 1 bertujuan untuk mendeklarasikan StreamTransformer, yang memungkinkan transformasi data secara efisien saat diterima dari stream. Langkah 2 berfungsi untuk mendefinisikan bagaimana data dan kesalahan akan ditangani melalui transformer, sehingga memberikan pengendalian yang lebih baik atas aliran data. Langkah 3 memastikan bahwa transformer diterapkan pada stream, memungkinkan listener untuk memonitor dan memperbarui state aplikasi berdasarkan data yang telah diproses.

[Result the picture](images\pict01.png)

# PRAKTIKUM 4

(Soal 9) : Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

Jawab : 

[Result the picture](images\pict02.jpg)
[Result the picture](images\pict03.jpg)

Kode pada initState() berfungsi untuk menginisialisasi stream, controller, dan subscription saat widget dibuat. NumberStream menghasilkan data berkala, controllernya digunakan untuk mengelola data yang dikirim ke stream, dan streamnya menjadi sumber data untuk widget. Dengan stream.listen(), event baru dari stream diterima, lalu UI diperbarui melalui setState(). super.initState() memastikan inisialisasi pada kelas induk tetap berjalan.Metode dispose() digunakan untuk menghentikan langganan stream dengan subscription.cancel() agar mencegah kebocoran memori dan error saat widget tidak lagi aktif. super.dispose() memastikan pembersihan resource pada kelas induk berjalan.

# PRAKTIKUM 5

(Ssoal 10) : Jelaskan mengapa error itu bisa terjadi ?

Jawab : Error tersebut terjadi ketika dua listener mencoba mendengarkan Stream yang sama , yang merupakan single-subscription. Dua listener (subscription dan subscription2) ditambahkan pada stream yang sama tanpa mengubah menjadi broadcast.

(Soal 11) : Jelaskan mengapa hal itu bisa terjadi?
Capture hasil praktikum anda berupa gif dan lampirkan di README.

Jawab : Pada langkah 4 menginisialisasi dan mengatur stream untuk memungkinkan pengiriman data secara bersamaan ke beberapa listener, lalu langkah 5 mendesain antarmuka pengguna untuk menampilkan angka yang dihasilkan dalam susunan yang terorganisir dan menarik.

[Result the picture](images\03.mp4)