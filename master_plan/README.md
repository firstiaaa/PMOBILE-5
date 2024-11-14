# master_plan

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

NAMA    : FIRSTIA AULIA WIDA AZIZAH

KELAS   : TI-3H / 11 / 2241720135


#  Tugas Praktikum 1: Dasar State dengan Model-View


1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.

2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

Jawab : 
- Langkah membuat file data_layer.dart bertujuan untuk menyederhanakan pengelolaan model seperti plan.dart dan task.dart. Dengan mengimpor model dari satu file, kita dapat merapikan kode dan mengurangi jumlah pernyataan impor di seluruh proyek. Hal ini juga memudahkan skala aplikasi, karena jika ada perubahan pada model, kita hanya perlu memperbarui satu tempat. Praktik ini membantu menjaga struktur proyek tetap teratur dan mempermudah pemeliharaan kode di masa mendatang.

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

Jawab :
- Variabel plan sangat penting karena berfungsi sebagai tempat untuk menyimpan daftar rencana atau tugas yang akan ditampilkan dalam aplikasi. Dengan adanya variabel ini di dalam kelas _PlanScreenState, kita dapat dengan mudah mengakses dan mengubah data yang ada.Variabel ini didefinisikan sebagai konstanta (const Plan()) karena data awal yang disimpan bersifat tetap dan tidak perlu diubah pada saat pembuatan. Dengan menggunakan const, kita menjamin bahwa objek tersebut akan tetap stabil. Namun, ketika saatnya tiba untuk memperbarui data, seperti menambahkan tugas baru, kita dapat menghilangkan const agar objek tersebut menjadi dinamis dan dapat diubah sesuai kebutuhan.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

Jawab :

![Screenshoot](images\prak10.1.jpg)
![Screenshoot](images\prak10.2.jpg)

Dalam praktikum ini, berfungsi untuk membuat master plan untuk mengatur dan memantau kemajuan pengerjaan tugas-tugas dalam pengembangan aplikasi Flutter. Pemanfaatan widget ListView memungkinkan penampilan daftar rencana, di mana setiap item rencana direpresentasikan menggunakan CheckboxListTile agar dapat dengan mudah mencentang tugas yang telah selesai dikerjakan. Pembuatan master plan seperti ini sangat bermanfaat, karena memudahkan dalam mengelola dan melacak kemajuan proyek, serta memberikan visibilitas yang jelas tentang status keseluruhan pengembangan aplikasi. 

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

Jawab :
- Method initState() dan dispose() dalam lifecycle state Flutter memiliki peran penting dalam mengelola siklus widget. initState() digunakan untuk melakukan inisialisasi variabel dan pengaturan awal saat widget dibuat, sedangkan dispose() dipanggil untuk membersihkan sumber daya ketika widget dihapus, mencegah kebocoran memori. Dengan demikian, kedua method ini membantu memastikan aplikasi berjalan dengan efisien dan sumber daya dikelola dengan baik.

6. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


#  Tugas Praktikum 2 : Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier

1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.

2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

Jawab :
- InheritedWidget adalah kelas dasar di Flutter yang digunakan untuk membagikan state di antara widget dalam pohon widget, memungkinkan subwidget mengakses data tanpa harus mengoper parameter secara manual. Sementara itu, InheritedNotifier adalah subclass dari InheritedWidget yang berfungsi dengan ValueNotifier, memungkinkan pembaruan otomatis widget yang bergantung saat data berubah. Penggunaan InheritedNotifier menjadikan manajemen state lebih efisien, terutama dalam aplikasi yang memerlukan interaksi dinamis, karena memungkinkan UI diperbarui secara otomatis tanpa memanggil setState secara manual.

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

Jawab :
- Method completedCount dan completenessMessage berfungsi untuk menghitung jumlah tugas yang telah selesai dan menyajikan pesan kemajuan secara dinamis. completedCount menghitung tugas yang selesai dengan memfilter daftar tugas menggunakan where untuk menemukan tugas dengan nilai complete yang bernilai true, kemudian menghitung jumlahnya menggunakan length. Di sisi lain, completenessMessage menyusun pesan kemajuan dalam format "$completedCount out of ${tasks.length} tasks", yang menunjukkan jumlah tugas yang telah diselesaikan dari total tugas yang ada. Pendekatan ini memungkinkan tampilan progres yang selalu terupdate ketika data tugas berubah, sehingga memudahkan pengguna untuk memantau kemajuan tanpa perlu melakukan penghitungan atau penyimpanan tambahan. Hal ini mendukung desain aplikasi yang lebih responsif dan terorganisir.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

![Screenshoot](images\prak10.2.jpg)

5. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


# Tugas Praktikum 3: State di Multiple Screens

1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.

2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!

Jawab : 

Diagram ini menggambarkan struktur dan relasi antara komponen-komponen dalam aplikasi yang dibangun, berdasarkan praktikum 3 yang telah dilakukan.

Pada sisi kiri, terdapat struktur yang terdiri dari

MaterialApp : komponen utama yang menyediakan tema material design dan mengatur struktur aplikasi.

PlanProvider : komponen yang mengelola data rencana (Plan) dan notifier untuk memperbarui UI.

PlanCreatorScreen : komponen yang menyediakan antarmuka untuk membuat rencana baru.

Column : komponen yang menyusun elemen-elemen secara vertikal.

TextField : komponen untuk memasukkan teks.

Expanded : komponen yang memperluas elemen sesuai ruang yang tersedia.

ListView : komponen yang menampilkan daftar elemen yang dapat di-scroll.

Pada sisi kanan, terdapat struktur yang terdiri dari

MaterialApp
PlanScreen : komponen yang menyediakan antarmuka untuk menampilkan rencana.

Scaffold : komponen yang menyediakan struktur dasar aplikasi, seperti AppBar dan Body.

Column
Expanded
ListView : komponen yang menampilkan daftar elemen yang dapat di-scroll.

SafeArea : komponen yang memastikan elemen tidak terhalang oleh sistem operasi.
Text - komponen untuk menampilkan teks.

Panah di tengah menggambarkan "Navigator Push", yang menunjukkan navigasi dari satu layar ke layar lainnya.

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

![Screenshoot](images\prak10.3.jpg)
![Screenshoot](images\prak10.4.jpg)
![Screenshoot](images\prak10.5.jpg)
![Screenshoot](images\prak10.6.jpg)

4. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !