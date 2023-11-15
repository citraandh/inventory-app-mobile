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
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- Navigator.push()
  Digunakan untuk menambahkan halaman baru di atas halaman saat ini di tumpukan navigasi.
  Memungkinkan pengguna untuk kembali ke halaman sebelumnya.
  Contoh penggunaan:
    ``` 
    // Navigasi ke halaman baru/ berikutnya
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NextPage()),
    );
    ```
- Navigator.pushReplacement():
  Digunakan untuk menggantikan halaman saat ini dengan halaman baru.
  Berguna untuk kasus seperti login dan logout, di mana halaman sebelumnya tidak boleh diakses lagi.
  Contoh penggunaan:
    ```
    // Navigasi ke halaman baru dan menggantikan halaman saat ini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
    ```
  Perbedaan utama:
  - push() menambah halaman baru di atas halaman saat ini.
  - pushReplacement() menggantikan halaman saat ini dengan halaman baru.

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- ListView
  Ideal untuk membuat daftar elemen yang dapat digulir. Sangat berguna ketika memiliki banyak data atau widget anak yang perlu ditampilkan dalam satu tampilan yang dapat digulir.

- Stack
  Cocok digunakan ketika perlu menumpuk beberapa widget di atas satu sama lain. Berguna dalam membuat tata letak yang kompleks, seperti menempatkan elemen-elemen terpisah di atas gambar latar belakang.

- Align
  Berguna ketika perlu menyesuaikan posisi widget anak di dalam widget parent berdasarkan alignment dan faktor-faktor lainnya. Misalnya, untuk menempatkan sebuah ikon di sudut kanan atas.

- Column
  Digunakan untuk menata widget anak secara vertikal dari atas ke bawah. Berguna dalam membuat tata letak vertikal seperti menu atau daftar yang perlu ditampilkan secara berurutan.

- Row
  Mengatur widget anak secara horizontal dari kiri ke kanan. Berguna ketika ingin menyusun elemen-elemen secara berdampingan secara horizontal, seperti tombol atau ikon.

- Container
  Merupakan wadah serbaguna yang dapat menampung widget lainnya. Cocok digunakan untuk memberikan kontrol terhadap properti seperti margin, padding, dan dekorasi. Memungkinkan desain yang kreatif dan penataan yang tepat.

- Baseline
  Berguna ketika perlu menyelaraskan elemen-elemen teks di antara beberapa widget. Misalnya, saat menampilkan teks yang harus selaras di antara beberapa widget berbeda.

- Center
  Menempatkan widget anaknya di tengah-tengah widget parent. Digunakan ketika ingin menempatkan teks, gambar, atau widget lainnya secara sentral di dalam widget parent.

- AspectRatio
  Ideal untuk menentukan rasio aspek widget. Berguna ketika ingin menjaga perbandingan lebar dan tinggi tertentu, seperti menampilkan gambar dengan rasio aspek yang spesifik.

- Expanded
  Digunakan untuk memberikan widget anak lebih banyak ruang dalam arah tertentu di dalam widget parent. Cocok digunakan dalam situasi di mana ingin memberikan lebih banyak ruang untuk satu atau beberapa widget dalam baris atau kolom.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- TextFormField  untuk Nama Item
  Tujuan: Berfungsi untuk mendapatkan informasi nama item.
  Alasan: Nama item menjadi identifikasi utama untuk membedakan satu item dengan yang lain.

- TextFormField  untuk Harga Item:
  Tujuan: Digunakan untuk mengumpulkan informasi harga item.
  Alasan: Harga item merupakan data numerik yang sangat penting untuk menetapkan nilai moneternya. Pemilihan TextFormField memberikan fasilitas validasi agar hanya angka yang diterima.

- TextFormField  untuk Jumlah Item:
  Tujuan: Berfungsi untuk mengumpulkan jumlah item.
  Alasan: Informasi mengenai jumlah item berperan dalam menunjukkan ketersediaan barang. Penggunaan TextFormField di sini memberikan validasi agar hanya angka yang dapat dimasukkan.

- TextFormField  untuk Deskripsi:
  Tujuan: Dimanfaatkan untuk mendapatkan deskripsi item.
  Alasan: Deskripsi memberikan gambaran rinci tentang item yang dapat membantu pengguna memahaminya secara lebih mendalam. Penggunaan TextFormField memungkinkan input berupa teks deskripsi.

Alasan Penggunaan:
- Kemudahan Penggunaan: TextFormField dipilih karena menyajikan interface pengguna yang    intuitif dan sudah terintegrasi dengan baik dalam library Flutter.
- Validasi Data: Setiap elemen input dilengkapi dengan validasi guna memastikan data yang dimasukkan sesuai dengan format yang diinginkan.
- Interaktivitas: Elemen input memungkinkan perubahan data secara langsung melalui fungsi onChanged, memungkinkan nilai diupdate saat pengguna memasukkan atau merubah data.
- Penanganan Kesalahan: TextFormField memberikan kemudahan dalam menangani pesan kesalahan dan memberikan umpan balik yang informatif kepada pengguna ketika data yang dimasukkan tidak memenuhi syarat.

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah sebuah konsep desain perangkat lunak yang memisahkan aplikasi ke dalam beberapa lapisan (layers) agar kode lebih terorganisir, mudah dipelihara, dan terhindar dari ketergantungan siklus hidup framework atau library tertentu. Penerapan Clean Architecture pada aplikasi Flutter melibatkan pemisahan tiga lapisan utama: Domain Layer, Data Layer, dan Presentation Layer.
- Domain Layer
  Merupakan inti dari aplikasi, tempat di mana aturan bisnis atau logika domain didefinisikan. Tidak bergantung pada framework atau library tertentu, sehingga dapat diuji dan dipertahankan secara terpisah.
  Penerapan di Flutter:
  Definisikan model entitas (Entity) yang mewakili objek bisnis murni.
  Tetapkan use case atau interaktif aplikasi yang merepresentasikan aturan bisnis.

- Data Layer
  Bertanggung jawab untuk mengakses dan menyimpan data, termasuk sumber data eksternal seperti API atau database. Dapat dianggap sebagai gateway antara domain layer dan sumber data eksternal.
  Penerapan di Flutter:
  Implementasikan repository sebagai jembatan antara domain layer dan sumber data.
  Gunakan konsep Data Sources untuk memisahkan antara data dari sumber eksternal dan data yang disajikan ke domain layer.

- Presentation Layer
  Menangani tampilan dan interaksi pengguna, serta menghubungkan antara lapisan domain dan data dengan UI. Terdiri dari widget-widget Flutter yang mengatur tampilan dan state UI.
  Penerapan di Flutter:
  Implementasikan widget-widget UI yang bertanggung jawab untuk menampilkan data dan menerima input pengguna. Presenter atau ViewModel berfungsi sebagai perantara antara UI dan domain layer, mengelola state dan logika presentasi.

Langkah-langkah Implementasi Clean Architecture pada Flutter:
- Struktur Proyek: Pisahkan direktori untuk setiap lapisan (domain, data, presentation).
  Gunakan package atau modul untuk membatasi ketergantungan antar lapisan.
- Model Entities: Definisikan model entitas di lapisan domain, mewakili objek bisnis murni.
  Repository Pattern: Implementasikan repository di lapisan data untuk mengakses data dari sumber eksternal.
- Use Cases: Tetapkan use cases di lapisan domain yang mewakili interaksi aplikasi.
- Dependency Injection: Gunakan Dependency Injection (DI) untuk menghubungkan antar lapisan, memastikan bahwa lapisan yang lebih tinggi tidak bergantung pada detail implementasi lapisan yang lebih rendah.
- Presenters or ViewModels: Implementasikan presenter atau view model di lapisan presentation untuk mengelola logika presentasi dan state.
- Widget UI: Buat widget-widget UI di lapisan presentation yang mengonsumsi presenter atau view model untuk menampilkan data dan merespons input pengguna.
- Testability: Pastikan setiap lapisan dapat diuji secara terpisah untuk meningkatkan testabilitas.
- Package Pub dan Dependency Management: Pertimbangkan untuk memisahkan setiap lapisan menjadi package Pub yang terpisah untuk meningkatkan modularitas dan dapat digunakan kembali.

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
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nama Item",
                      labelText: "Nama Item",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  // isi
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Tidak Boleh Kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Item",
                    labelText: "Harga Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Isi
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Item Tidak Boleh Kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga Item Harus Berupa Bilangan";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah Item",
                    labelText: "Jumlah Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Isi
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah Item Tidak Boleh Kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah Item Harus Berupa Bilangan";
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
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi Tidak Boleh Kosong";
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
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade200),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Item Berhasil Disimpan!"),
                                content: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        Text('Harga Item: $_price'),
                                        Text('Jumlah Item: $_amount'),
                                        Text('Deskripsi: $_description'),
                                      ]),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                        _formKey.currentState!.reset();
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
      } else if (item.name == "Lihat Item") {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ItemListPage()));
      }
    },
    ```

  #### Memunculkan Data
  - Tambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog pada fungsi tersebut. Lalu, tambahkan juga fungsi untuk reset form.
    ```
    child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade200),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Add item to items
                        Item content = Item(_name,_price, _amount, _description);
                        Item.items.add(content);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Item Berhasil Disimpan!"),
                                content: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        Text('Harga Item: $_price'),
                                        Text('Jumlah Item: $_amount'),
                                        Text('Deskripsi: $_description'),
                                      ]),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                        _formKey.currentState!.reset();
                      }
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
              title: const Text('Lihat Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ItemListPage(),
                  ));
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
### Bonus
![4](https://i.postimg.cc/59wGydqw/tambah-Item.jpg)
- Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat.
  ```

- Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Produk pada halaman utama atau drawer.

### Tampilan
![ph1](https://i.postimg.cc/Wz6fHgb9/tugas8-home.jpg)

![ph2](https://i.postimg.cc/rs89zbMJ/lihat-Item.jpg)
![ph3](https://i.postimg.cc/Bndc2tJt/drawertugas8.jpg)
![ph4](https://i.postimg.cc/J4x23NF0/tambah-Iteminvalid.jpg)


