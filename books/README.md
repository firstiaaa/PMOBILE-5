# books

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Nama  : Firstia Aulia Wida Azizah
Kelas : TI - 3H / 11 / 2241720135

# PRAKTIKUM 1

(Soal 1) : Menambahkan tittle app dengan nama
![Screenshot Soal 1](images\prak1.1.jpg)

(Soal 2) : Mencari judul buku di Google Books lalu mengganti ID buku pada variabel path.
![Screenshot Soal 2](images\prak1.2.1.jpg)
![Screenshot Soal 2](images\prak1.2.jpg)

(Soal 3) : Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!

Jawab : 

Substring pada bagian getData().then((value) { ... }), kode tersebut menangani respons yang berhasil diterima dari pemanggilan API. Saat data berhasil dimuat, nilai value.body akan berisi keseluruhan data yang diterima. Namun, untuk menjaga tampilan UI tetap ringkas, kode melakukan substring(0, 450) untuk mengambil hanya 450 karakter pertama dari data tersebut dan menyimpannya ke dalam variabel result.

Sementara pada bagian catchError((_) { ... }), kode tersebut menangani jika terjadi kesalahan saat memanggil API. Jika terjadi masalah, seperti koneksi yang terputus atau API yang tidak tersedia, maka blok catchError akan dijalankan. Di dalam blok ini, kode mengubah nilai result menjadi pesan "An error occured" agar pengguna dapat mengetahui jika terjadi kesalahan saat memuat data.

![Screenshot Soal 2](images\prak1.3.jpg)

# PRAKTIKUM 2

(Soal 4) : Jelaskan maksud kode langkah 1 dan 2 tersebut!

Jawab :

- returnOneAsync() : Metode ini mengembalikan nilai integer 1 setelah menunda eksekusinya selama 3 detik menggunakan Future.delayed(). Tujuannya sendiri yakni untuk mensimulasikan pengambilan data asinkron yang memerlukan waktu untuk menyelesaikannya.
- returnTwoAsync() : Metode ini mengembalikan nilai integer 2 setelah menunda eksekusinya selama 3 detik menggunakan Future.delayed() juga.
- returnThreeAsync() : Metode ini mengembalikan nilai integer 3 setelah menunda eksekusinya selama 3 detik.

- Pada langkah kedua, kode yang ditambahkan adalah sebuah metode baru bernama count() yang bersifat asinkron. Metode ini akan menggabungkan hasil dari tiga metode sebelumnya (returnOneAsync(), returnTwoAsync(), dan returnThreeAsync()) untuk mendapatkan jumlah total. Dalam metode count(), pertama-tama inisialisasi variabel total dengan nilai 0. Kemudian, nilai total akan diperbarui dengan memanggil ketiga metode asinkron tersebut secara berurutan menggunakan await. Setelah semua nilai diperoleh, total akan dikonversi menjadi string dan disimpan dalam variabel result, yang kemudian akan digunakan untuk memperbarui tampilan aplikasi.

Berikut adalah hasil percobaannya : 

![Screenshot Soal 4.1](images\prak2.1.jpg)
![Screenshot Soal 4.2](images\prak2.2.jpg)


# PRAKTIKUM 3

(Soal 5) : Jelaskan maksud kode langkah 2 tersebut!
 
Jawab : 

Pada langkah 2 ini menggunakan Completer dari package async untuk menangani pengambilan data secara asinkron. 

- Late completer completer; = Deklarasi variabel completer yang bertipe Completer<int>. Completer adalah kelas yang menyediakan cara untuk menyelesaikan sebuah Future secara manual.
- Future getNumber()  = akan mengembalikan sebuah Future<int>. Dalam metode ini sebuah Completer akan dibuat dan disimpan dalam variabel completer. Llau akhirnya completer.future akan dikembalikan sebagai hasil dari getNumber().
- Future calculate() async = Metode calculate() akan menjalankan sebuah operasi asinkron. Operasi tersebut akan menunda eksekusi selama 5 detik menggunakan Future.delayed(). Lalu setelah penundaan , nilai 42 akan dikirim ke completer.complete(42), yang akan menyelesaikan Future yang dikembalikan oleh getNumber().

![Screenshot Soal 5](images\prak3.1.jpg)

(Soal 6) : Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

Jawab : 

Perbedaan utamanya adalah pada cara penanganan hasil asinkron. Pada langkah 2 , Completer digunakan untuk menyelesaikan Future yang dikembalikan oleh getNumber(). Pada langkah 5, Completer digunakan untuk menyelesaikan Future secara manual, sedangkan pada langkah 6, .then() dan .catchError() digunakan untuk menangani hasil asinkron. Lalu lokasi penanganan hasil asinkron yaitu pada langkah 2 dilakukan dalam metode getNumber() dan calculate() sedangkan langkah 5-6 dilakukan di dalam onPressed()event handler.

![Screenshot hasil praktikum 3](images\prak3.2.jpg)

# PRAKTIKUM 4 (Memanggil Future secara paralel)

(Soal 7) : Hasil dari Running

![Screenshot run soal 7](images\prak4.1.jpg)

(Soal 8) : Jelaskan maksud perbedaan kode langkah 1 dan 4!

Jawab : 

Perbedaan antara kedua kode tersebut terletak pada penggunaan FutureGroup di kode pertama dan Future.wait() di kode kedua; kode pertama memerlukan penambahan setiap Future secara manual dan menutup grup, sedangkan kode kedua menyederhanakan proses dengan langsung menyediakan daftar Future untuk dikumpulkan hasilnya. Selain itu, kode kedua juga mencakup penanganan kesalahan menggunakan catchError(), menjadikannya lebih ringkas dan mudah dipahami.

![Screenshot soal 8](images\prak4.2.jpg)


# PRAKTIKUM 5 (Menangani Respon Error pada Async Code)

(Soal 9) : Hasil capture dari running menghasilkan String 'Something terrible happened!' dan pada debug console terdapat teks 'Complete'.Hasil capture adalah sebagai berikut :

![Screenshot soal 9](images\prak5.1.jpg)

(Soal 10) : Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

Jawab : 

- returnError() : melemparkan exception setelah delay atau mengalami penundaan selama 2 detik serta tidak ada mekanisme untuk menangani errornya.
- handleError() : Memanggil return error dan menangkap error menggunakan blok try-catch. Lalu menyimpan pesan error ke variabel result melalui setState. Selanjutnya menjalankan blok finaally untuk mencetak 'Complete' setelah error selesai ditangani , terlepas ada error atau pun tidak.

![Screenshot soal 10](images\prak5.2.jpg)

# PRAKTIKUM 6 (Mengggunakan Future dengan StatefulWidget)

(Soal 11) : Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

![Screenshot soal 11](images\prak6.1.jpg)

(Soal 12) : 
- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));
- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

Jawab :

Ketika menggunakan Flutter di platform web (Flutter Web) tidak akan mendapatkan koordinat GPS secara langsung seperti pada perangkat mobile. Akan tetapi Platform Web ini mengandalkan API Geolocation yang disediakan oleh browser, yang umumnya bergantung pada informsi jaringan untuk memperkirakan lokasi pengguna sehingga hasil yang diperoleh cenderung kurang akurat dibandingkan dengan data GPS. Selain itu browser juga akan meminta izin akses lokasi dari pengguna jika tidak di 'allow' maka aplikasi tidak akan mendapatkan koordinat.

- Capture hasil praktikum
![Screenshot ](images\prak6.2.jpg)
![Screenshot ](images\prak6.3.jpg)


# PRAKTIKUM 7 (Manajemen Future dengan FutureBuilder)

(Soal 13) : Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

Jawab : Iya terdapat perbedaan UI nya , dengan desain UI yang lebih clean dan terintegrasi dengan baik maka aplikasi akan lebih polished dan memeberikan pengalaman yang mulus bagi pengguna. Serta pengguna akan mendapatkan umpan balik yang jelas selama proses pengambilan posisi , dan informasi yang disajikan akan terlihat lebih terstruktur dan mudah dipahami.

![Screenshot ](images\prak7.1.jpg)
![Screenshot ](images\prak7.2.jpg)
![Screenshot ](images\prak7.3.jpg)

(Soal 14) : Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?

Jawab : Pada langkah ini tidak begitu banyak perubahan hanya ditambahkan dengan handling error saaj , ketika izin akses untuk menentukan titik koordinat tidak di 'allow' maka akan muncul pesan error yang telah didefinisikan di dalam handling error , contoh tampilannya adalah sebagai berikut :

![Screenshot ](images\prak7.4.jpg)
![Screenshot ](images\prak7.5.jpg)
![Screenshot ](images\prak7.6.jpg)


# PRAKTIKUM 8 (Navigation route dengan Future Function)

(Soal 15) : Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.
Silakan ganti dengan warna tema favorit Anda.

![Screenshot ](images\prak8.1.jpg)
![Screenshot ](images\prak8.2.jpg)

(Soal 16) : Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!

![Screenshot ](images\prak8.3.jpg)
![Screenshot ](images\prak8.4.jpg)
![Screenshot ](images\prak8.5.jpg)


# PRAKTIKUM 9 (Memanfaatkan async/await dengan Widget Dialog)

 (Soal 17) : 

![Screenshot ](images\prak9.1.jpg)
![Screenshot ](images\prak9.2.jpg)
![Screenshot ](images\prak9.3.jpg)