# Inventory Mobile
Nama    : Citra Andini Hermawan
NPM     : 2206830012
Kelas   : PBP D
Repository : 

## Tugas 6
### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Dalam pengembangan aplikasi Flutter, perbedaan utama antara widget stateless dan stateful adalah cara widget tersebut menangani dan mengubah data. Widget stateless adalah jenis widget yang tidak memiliki status internal, artinya widget tidak dapat mengubah tampilan atau propertinya setelah dibuat. Widget stateless digunakan untuk elemen tampilan yang tidak perlu diperbarui berdasarkan perubahan data saat aplikasi sedang berjalan, seperti teks statis, ikon, gambar, atau tombol yang tidak perlu diubah sepanjang masa aplikasi.

Selain itu, widget stateful adalah jenis widget yang status internalnya dapat berubah selama siklus hidup aplikasi. Hal ini memungkinkan widget untuk memperbarui ketika data terkait berubah. Widget status digunakan ketika kita ingin memantau perubahan data dan mengubah tampilan berdasarkan perubahan tersebut. Contoh penggunaan widget status mencakup pembuatan formulir atau catatan yang memerlukan perubahan dinamis. Widget status juga memiliki metode 'setState' yang memungkinkan kita memperbarui status widget dan memicu pembaruan tampilan baru.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- MyApp (StatelessWidget)
  Ini adalah widget utama yang bertindak sebagai akar dari aplikasi.
  Digunakan untuk mengonfigurasi pengaturan awal aplikasi, seperti judul, tema, dan halaman beranda (home).

- Scaffold (Widget)
  Merupakan kerangka dasar untuk tata letak aplikasi. Berisi AppBar dan Body (badan konten aplikasi).

- AppBar (Widget)
  Menampilkan bagian atas aplikasi dengan judul.Kita dapat menyesuaikan properti seperti title, backgroundColor, dan foregroundColor untuk mengatur penampilan AppBar.

- SingleChildScrollView (Widget)
  Mengizinkan konten halaman agar dapat discroll jika melebihi layar.
  Berguna ketika terdapat banyak konten yang mungkin melebihi tinggi layar.

- Column (Widget)
  Digunakan untuk menampilkan widget-child secara vertikal dalam satu kolom dan digunakan untuk mengelompokkan elemen-elemen tampilan di bawah AppBar.

- GridView.count (Widget)
  Menampilkan elemen dalam tata letak grid dengan jumlah baris dan kolom yang ditentukan.
  Digunakan untuk membuat grid dari daftar ShopItem.

- ShopCard (StatelessWidget):
  Widget yang menampilkan kartu yang merepresentasikan item dalam grid. Menggunakan properti ShopItem untuk menentukan tampilan kartu, termasuk icon, teks, dan warna latar belakang. Diaktifkan ketika item dalam grid ditekan untuk menampilkan Snackbar.

- Material (Widget)
  Mengatur latar belakang kartu dengan warna sesuai dengan item. Digunakan untuk memberikan latar belakang dengan warna yang berbeda untuk setiap kartu.

- InkWell (Widget)
  Membungkus kartu dan membuatnya responsif terhadap sentuhan. Digunakan untuk menangani ketika kartu ditekan.

- SnackBar (Widget)
  Menampilkan pesan snack yang muncul saat kartu ditekan. Menggunakan ScaffoldMessenger untuk menampilkan pesan.

- Text (Widget)
  Menampilkan teks pada tampilan. Digunakan untuk menampilkan judul toko dan nama item di dalam kartu.

- Icon (Widget)
  Menampilkan icon berdasarkan icon yang diberikan. Digunakan untuk menampilkan icon yang sesuai dengan setiap item di dalam kartu.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

##### Merapihkan Struktur
  - Membuka Command Prompt dan masuk ke direktori yang diinginkan untuk menempatkan proyek flutter
  - Membuat proyek Flutter baru dengan nama `inventory_mobile`, dan masuk ke direktori itu.
      ```
      flutter create inventory_mobile
      cd inventory_mobile
      ```
  - Membuat file baru `menu.dart` pada direktori inventory_mobile/lib. Tambahkan baris dibawah:
      ```
      import 'package:flutter/material.dart';
      ```
  - Pindahkan baris ke-39 hingga akhir dalam `main.dart` ke `menu.dart`
  - Tambahkan baris dibawah pada `main.dart`:
      ```
      import 'package:inventory_mobile/menu.dart';
      ```

##### Membuat Widget
  - Buka `main.dart`
  - Ubah warna tema aplikasi menjadi tipe Material Color
      ```
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade200),
      ```
  - Selanjutnya, mengubah sifat widget menjadi stateless
  - Pada file `main.dart`, hapus `MyHomePage(title: 'Flutter Demo Home Page')` sehingga menjadi:
      ```
      MyHomePage()
      ```
  - Pada `menu.dart`, ubah bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key)`
  - Hapus final String title dan hapus fungsi State
  - Buat Card dan Teks untuk menampilkan barang
  - Define tipe list yang akan digunakan
      ```
      class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
      }
      ```
  - Tambahkan barang yang akan ditampilkan
      ```
      final List<ShopItem> items = [
          ShopItem("Lihat Produk", Icons.checklist),
          ShopItem("Tambah Produk", Icons.add_shopping_cart),
          ShopItem("Logout", Icons.logout),
      ];
      ```
  - Dalam widget Build, tambahkan kode dibawah ini:
      ```
      return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Inventory App',
              ),
              backgroundColor: Colors.deepPurple.shade200,// deepPurple background color
              foregroundColor: Colors.white,// White 'Inventory App' text
            ),
            body: SingleChildScrollView(
              // Widget wrapper yang dapat discroll
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                  // Widget untuk menampilkan children secara vertikal
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                      child: Text(
                        'PBP Shop', // Text yang menandakan toko
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Grid layout
                    GridView.count(
                      // Container pada card kita.
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ShopItem item) {
                        // Iterasi untuk setiap item
                        return ShopCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        ```
  - Buatlah widget stateless
      ```
      class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
          return Material(
            color: Colors.deepPurple.shade200),
            child: InkWell(
              // Area responsive terhadap sentuhan
              onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text("Kamu telah menekan tombol ${item.name}")));
              },
              child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
      ```

#### [Bonus] Mengubah Warna Tombol
  - Tambahkan atribut color ke class ShopItem
      ``` 
      final Color color;
      ShopItem(this.name, this.icon, this.color);
      ```
  - Atur warna sesuai yang dinginkan pada bagian List `<ShopItem>` items
      ```
      final List<ShopItem> items = [
          ShopItem("Lihat Item", Icons.checklist, Colors.deepPurple.shade200),
          ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.teal.shade50),
          ShopItem("Logout", Icons.logout, Colors.red.shade300),
      ];
      ```
  - Ubah bagian color dalam Widget build
      ``` 
      color: item.color,
      ``` 

#### Add, Commit, dan Push ke Github
```
git add .
git commit -m ""
git push
