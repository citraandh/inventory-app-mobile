# Inventory Mobile
Nama    : Citra Andini Hermawan\
NPM     : 2206830012\
Kelas   : PBP D

## Tugas 7
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
 ```

### Tampilan
![user1](https://i.postimg.cc/vm4WbLkc/Whats-App-Image-2023-11-08-at-11-39-33-9929c86a.jpg)

## Tugas 8
 Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas).
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
 push: next page biasa
 pushReplacement : Login Logout
### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
### Bagaimana penerapan clean architecture pada aplikasi Flutter?
### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
  #### Menambahkan Form Tambah Item dan elemen input
    - Buat file baru pada direktori lib dengan nama `inventory_form.dart`. Tambahkan kode berikut ke dalam file `inventory_form.dart`
      ```
      import 'package:flutter/material.dart';
      // TODO: Impor drawer yang sudah dibuat sebelumnya

      class ShopFormPage extends StatefulWidget {
          const ShopFormPage({super.key});

          @override
          State<ShopFormPage> createState() => _ShopFormPageState();
      }

      class _ShopFormPageState extends State<ShopFormPage> {
          @override
          Widget build(BuildContext context) {
              return Placeholder();
          }
      }
      ```
    - Ubah widget `Placeholder` dengan kode dibawah
      ```
          Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Produk',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        // TODO: Tambahkan drawer yang sudah dibuat di sini
        body: Form(
          child: SingleChildScrollView(),
        ),
      );
      ```
    - Buat variabel baru bernama _formKey lalu tambahkan _formKey tersebut ke dalam atribut key milik widget Form. Atribut key akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form.
      ```
      class _ShopFormPageState extends State<ShopFormPage> {
          final _formKey = GlobalKey<FormState>();

      body: Form(
          key: _formKey,
          child: SingleChildScrollView(),
      ),
  
      ```
    - Selanjutnya, kita akan mulai mengisi widget Form dengan field. Buatlah beberapa variabel untuk menyimpan input dari masing-masing field yang akan dibuat.
      ```
        class _ShopFormPageState extends State<ShopFormPage> {
          final _formKey = GlobalKey<FormState>();
          String _name = "";
          int _price = 0;
          int _amount = 0;
          String _description = "";
      ```
    - Buatlah widget Column sebagai child dari SingleChildScrollView.
      ```
      body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column()
            ),
      ```
    - Buatlah widget TextFormField yang dibungkus oleh Padding sebagai salah satu children dari widget Column. Setelah itu, tambahkan atribut crossAxisAlignment untuk mengatur alignment children dari Column.
      ```
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
      ```   
    - Buatlah tiga TextFormField yang dibungkus dengan Padding sebagai child selanjutnya dari Column seperti sebelumnya untuk field price, amount, dan description. Berikan juga validator pada setiap fieldnya
      ```
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                hintText: "Nama Item",
                labelText: "Nama Item",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                onChanged: (String? value) {
                setState(() {
                    _name = value!;
                });
                },
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                }
                return null;
                },
            ),
            ),

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                hintText: "Harga",
                labelText: "Harga",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                // Tambahkan variabel yang sesuai
                onChanged: (String? value) {
                setState(() {
                    _price = int.parse(value!);
                });
                },
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                }
                return null;
                },
            ),
            ),

            
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                hintText: "Jumlah",
                labelText: "Jumlah",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                // Tambahkan variabel yang sesuai
                onChanged: (String? value) {
                setState(() {
                    _amount = int.parse(value!);
                });
                },
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Jumlah tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                    return "Jumlah harus berupa angka!";
                }
                return null;
                },
            ),
            ),

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                hintText: "Deskripsi",
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                onChanged: (String? value) {
                setState(() {
                    // Tambahkan variabel yang sesuai
                    _description = value!;
                });
                },
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                }
                return null;
                },
            ),
            ),
      ```

    - Buatlah tombol sebagai child selanjutnya dari Column. Bungkus tombol ke dalam widget Padding dan Align. Kali ini kita tidak akan menyimpan data ke dalam database, namun kita akan memunculkannya pada pop-up yang akan muncul setelah tombol ditekan.
      ```
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.indigo),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      ```

  #### Menambahkan Fitur Navigasi ke page Tambah Item 
  - Pada widget ShopItem pada berkas menu.dart agar dapat melakukan navigasi ke route lain (tambahkan kode tambahan di bawah kode ScaffoldMessenger yang menampilkan snackbar).
    ```
    // Area responsif terhadap sentuhan
    onTap: () {
      // Memunculkan SnackBar ketika diklik
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));

      // Navigate ke route yang sesuai (tergantung jenis tombol)
      if (item.name == "Tambah Item") {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShopFormPage()));
      }   
    },
    ```

  #### Memunculkan Data
  - Tambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog pada fungsi tersebut. Lalu, tambahkan juga fungsi untuk reset form.
    ```
    child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.indigo),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Produk berhasil tersimpan'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [ 
                              Text('Nama: $_name'),
                              Text('Harga: $_price'),
                              Text('Jumlah: $_amount'),
                              Text('Deskripsi: $_description'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                _formKey.currentState!.reset();
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
    ```

  #### Membuat Drawer opsi Halaman Utama dan Tambah Item yang akan mengarahkan ke page sesuai
    - Buat folder baru dengan nama `widgets` dan buat file baru dengan nama `left_drawer.dart`. Tambahkan kode dibawah ini
      ```
      import 'package:flutter/material.dart';

      class LeftDrawer extends StatelessWidget {
        const LeftDrawer({super.key});

        @override
        Widget build(BuildContext context) {
          return Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  // TODO: Bagian drawer header
                ),
                // TODO: Bagian routing
              ],
            ),
          );
        }
      }
      ```

    - Import halaman-halaman yang ingin dimasukkan navigasinya ke dalam drawer.
      ```
      import 'package:flutter/material.dart';
      import 'package:inventory_mobile/menu.dart';
      import 'package:inventory_mobile/inventory_form.dart';
    - Buatlah routing untuk page yang telah diimpor
        ```            
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Halaman Utama'),
          // Bagian redirection ke MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Tambah Produk'),
          // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ShopFormPage(),
                  ));
              },
        ),
        ```
      - Buat drawer header untuk menghias drawer
        ```
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: Column(
            children: [
              Text(
                'Inventory App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text("Catat seluruh item inventory di sini!",
              textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,)
                ),
            ],
          ),
        ),
        ```
      - Setelah berhasil membuat drawer, masukkan drawer tersebut ke page yang ingin ditambahkan drawer, misalnya `menu.dart`
        ```
        // Impor drawer widget
        import 'package:inventory_mobile/widgets/left_drawer.dart';

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Inventory App',
            ),
            backgroundColor: Colors.deepPurple.shade200,// deepPurple background color
            foregroundColor: Colors.white,// White 'Inventory App' text
          ),
          // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
          drawer: const LeftDrawer(),
          ...
        ```

  #### Menambahkan Fitur Navigasi
  - Pada widget ShopItem pada berkas menu.dart agar dapat melakukan navigasi ke route lain (tambahkan kode tambahan di bawah kode ScaffoldMessenger yang menampilkan snackbar).
    ```
    // Area responsif terhadap sentuhan
    onTap: () {
      // Memunculkan SnackBar ketika diklik
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));

      // Navigate ke route yang sesuai (tergantung jenis tombol)
      if (item.name == "Tambah Item") {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShopFormPage()));
      }   
    },
    ```

  #### Refactoring File
  - Buat file baru bernama `inventory_card.dart` pada direktori `widgets`
  - Pindahkan isi widget ShopItem pada menu.dart ke berkas widgets/shop_card.dart.
  - Pastikan untuk mengimpor halaman inventory_form.dart pada berkas shop_card.dart dan import halaman shop_card.dart pada berkas `menu.dart`
  - Buatlah folder baru bernama screens pada direktori lib
  - Pindahkan file `menu.dart` dan inventory_form.dart` ke dalam folder screens.
 
- Melakukan add-commit-push ke GitHub.