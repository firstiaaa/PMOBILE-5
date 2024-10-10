# layout_flutter

A new Flutter project.

Nama : Firstia Aulia Wida Azizah


Kelas : TI3H / 2241720135 / 11


# PRAKTIKUM 1 
- Membuat Project Baru bernama layout_flutter
Langkah pertama yaitu membuat project baru flutter dengan nama layout_flutter , Lalu mengatur file main.dart dengan membuka file lib/main.dart dan mengganti dengan konten yang telah disediakan. Sebelum memulainya kita harus menganalisis tata letak aplikasi yang akan dibuat seeprti tata letak menjadi baris dan kolom , menggunakan grid , mempertimbangkan elemen yang tumpang tindih dan sebagainya. Lalu mengimplementasikan bagian judul yang terdiri dari bberapa eleemn : Widget Container , Widget row , Widget Column , Icon dan Text.
- Hasil dari praktikum 1 
    ![Screenshot](images\prak1-6.jpg)

# PRAKTIKUM 2
- Implementasi Button Row
## Langkah 1 
Membuat method Column _buildButtonColumn :
Bagian tombol berisi 3 kolom yang menggunakan tata letak yang sama—sebuah ikon di atas baris teks.
    ![Screenshot](images\prak1.2-6.jpg)

## Langkah 2 
Buat Widget buttonSection :
Membuat fungsi untuk menambahkan ikon langsung ke kolom. Teks berada di dalam Container dengan margin hanya di bagian atas, yang memisahkan teks dari ikon.
    ![Screenshot](images\prak2.2-6.jpg)

## Langkah 3 
Menambah button section ke body :
    ![Screenshot](images\prak2.3-6.jpg)



# PRAKTIKUM 3
- Implementasi textSection
Yang pertama membuat widget textSection dan memasukannya ke dalam container dan menambahkan padding di setiap tepinya. Dengan memberi nilai softWrap = true, baris teks akan memenuhi lebar kolom sebelum membungkusnya pada batas kata. Lalu langkah 2 menambahkan variabel textsection ke body.
    ![Screenshot](images\prak3-6.jpg)

# PRAKTIKUM 4
- Implementasi imageSection
Langkah pertama menyiapkan asset gambar yakni mencari gambar yang diinginkan lalu membuat folder images di root project layout_flutter. Lalu masukkan file tersebut ke folder image lalu set nama file tersebut ke file pubspec.yaml. Langkah berikutnya menambahkan gambar ke body. Langkah terakhir yaitu mengubah body : Column menjadi body : ListView karena mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.
     ![Screenshot](images\prak4-6.jpg)