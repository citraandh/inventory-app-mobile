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

- Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat.
  ```
![ph2](https://i.postimg.cc/rs89zbMJ/lihat-Item.jpg)
- Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Produk pada halaman utama atau drawer.

### Tampilan
![ph1](https://i.postimg.cc/Wz6fHgb9/tugas8-home.jpg)
![4](https://i.postimg.cc/59wGydqw/tambah-Item.jpg)
![ph4](https://i.postimg.cc/J4x23NF0/tambah-Iteminvalid.jpg)
![ph3](https://i.postimg.cc/Bndc2tJt/drawertugas8.jpg)

## Tugas 9
### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
  Ya, di Flutter, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Ini disebut dengan pendekatan "dynamic parsing" atau "manual parsing". Saat menggunakan pendekatan ini, kita mengambil data JSON sebagai objek Dart tanpa menggunakan model yang terdefinisi sebelumnya.
  Namun, ada beberapa keuntungan dari pendekatan membuat model sebelumnya:

  Type Safety: Dengan membuat model, kita mendefinisikan struktur data secara eksplisit, yang dapat memberikan keamanan tipe. Jika kita membuat model, Flutter akan memberi tahu kita tentang kesalahan tipe selama waktu kompilasi jika terdapat ketidakcocokan tipe.

  Code Readability: Membuat model memungkinkan kita mendokumentasikan struktur data dengan lebih baik dan membuat kode lebih mudah dibaca. Dengan melihat model, seseorang dapat dengan cepat memahami bagaimana data seharusnya terlihat.

  IntelliSense dan Autocompletion: Saat bekerja dengan model, editor akan menyediakan intelijen dan autocompletion yang lebih baik, membantu kita menavigasi dan menggunakan data dengan lebih efisien.

  Pilihan antara pendekatan dinamis dan statis tergantung pada kebutuhan proyek kita. Jika proyek kita kecil atau struktur data sederhana, pendekatan dinamis mungkin cukup. Namun, untuk proyek yang lebih besar atau yang melibatkan struktur data yang kompleks, membuat model sebelumnya dapat membantu mencegah kesalahan dan membuat kode lebih mudah dipelihara.


### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
  - Fungsi CookieRequest
    Pengelolaan Sesi: CookieRequest digunakan untuk mengelola sesi pengguna dengan memungkinkan aplikasi untuk mengirim dan menerima cookie dari server. Ini membantu dalam mengidentifikasi dan mengelola sesi pengguna dengan efektif.

    Otentikasi: Dalam konteks banyak aplikasi, CookieRequest berperan dalam pengiriman informasi otentikasi melalui cookie kepada server. Ini membantu dalam menjalankan proses otentikasi pengguna dengan lebih efisien.

    Keamanan: CookieRequest berkontribusi pada keamanan dengan memastikan bahwa data sensitif, seperti token atau informasi keamanan lainnya, dapat disimpan dan ditangani secara aman selama pertukaran antara klien dan server.

    Preferensi Pengguna: CookieRequest memfasilitasi penyimpanan dan pengambilan preferensi pengguna. Dengan menggunakan cookie, aplikasi dapat menyimpan dan memperbarui preferensi pengguna secara efektif.

  - Mengapa instance CookieRequest perlu dibagikan di Semua Komponen Aplikasi Flutter
    Konsistensi: Berbagi instance CookieRequest di seluruh aplikasi memastikan konsistensi dalam pengelolaan sesi dan data pengguna. Semua komponen memiliki akses ke informasi cookie yang sama, menciptakan pengalaman pengguna yang seragam.

    Efisiensi: Menggunakan satu instance CookieRequest di seluruh aplikasi meningkatkan efisiensi karena menghindari pembuatan instance baru setiap kali cookie perlu diakses. Hal ini tidak hanya menghemat sumber daya, tetapi juga meningkatkan respons aplikasi.

    Pemeliharaan: Berbagi instance CookieRequest menciptakan titik pusat untuk pengelolaan cookie. Perubahan atau pembaruan terkait cookie hanya perlu dilakukan di satu tempat, menyederhanakan proses pemeliharaan.

    Keamanan: Mengelola cookie secara terpusat membantu menjaga keamanan karena memastikan bahwa semua komponen aplikasi mengikuti praktek terbaik yang sama dalam penanganan data sensitif. Ini mengurangi risiko kesalahan atau inkonsistensi dalam implementasi keamanan.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
  - Menambahkan dependensi http ke proyek; dependensi ini digunakan untuk bertukar HTTP request.
  - Membuat model sesuai dengan respons dari data yang berasal dari web service tersebut.
  - Membuat http request ke web service menggunakan dependensi http untuk mendapatkan data json.
  - Mengkonversikan objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.
  - Menampilkan data yang telah dikonversi ke aplikasi dengan FutureBuilder.

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  Proses autentikasi dari penggunaan input data akun di Flutter ke Django melibatkan beberapa tahapan. Ini termasuk mengirimkan data akun dari aplikasi Flutter ke backend Django, menjalankan proses autentikasi di Django, dan mengembalikan hasil autentikasi ke aplikasi Flutter. Berikut adalah langkah-langkah umumnya:
  - Input Data Akun di Flutter:
  Desain antarmuka pengguna (UI) di aplikasi Flutter untuk menerima input data akun seperti nama pengguna dan kata sandi.
  Lakukan validasi terhadap input pengguna sebelum mengirimkannya ke backend.
  
  - Pengiriman Data Akun ke Django:
  Gunakan paket HTTP di Flutter (contohnya, paket http) untuk membuat permintaan HTTP POST ke backend Django.
  Kirimkan data akun dalam format yang diinginkan oleh API Django, umumnya dalam format JSON.

  - Proses Autentikasi di Django:
  Desain dan implementasikan view di Django yang akan menangani permintaan autentikasi.
  Periksa data akun yang diterima dari aplikasi Flutter di dalam view.
  Gunakan sistem autentikasi Django atau pustaka pihak ketiga (seperti Django REST Framework JWT) untuk memverifikasi keaslian pengguna.
  Jika autentikasi berhasil, kirimkan respons ke aplikasi Flutter, misalnya, dalam bentuk token akses.
  Jika autentikasi gagal, berikan respons dengan kode atau pesan kesalahan yang sesuai.

  - Penanganan Respons di Aplikasi Flutter:
  Di aplikasi Flutter, tanggapi respons dari backend setelah permintaan autentikasi.
  Jika autentikasi berhasil, simpan token akses atau informasi pengguna yang diperlukan di dalam aplikasi.
  Navigasikan pengguna ke halaman atau menu yang sesuai dengan status autentikasi, seperti menu utama atau profil pengguna.
  Jika autentikasi gagal, berikan pemberitahuan atau tindakan yang sesuai kepada pengguna.

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
  - Pada ItemPage:
      Scaffold: Merupakan kerangka dasar untuk tata letak aplikasi.
      AppBar: Menampilkan bar atas dengan judul "Item".
      LeftDrawer: Widget khusus yang dibuat untuk menampilkan drawer (menu sisi kiri).
      FutureBuilder: Membangun widget berdasarkan hasil dari suatu Future.
      Center: Widget untuk menempatkan child di tengah-tengah layar.
      CircularProgressIndicator: Indikator loading yang menunjukkan bahwa data sedang diambil.
      Column: Mengatur child-widget dalam kolom vertikal.
      ListView.builder: Membangun daftar item dengan memanfaatkan data yang diperoleh dari FutureBuilder.
      Container: Membungkus elemen-elemen dalam daftar item.
      Text: Menampilkan nama, harga, dan deskripsi item.
      SizedBox: Memberikan spasi vertikal antar elemen dalam daftar item.

  - Pada LoginApp dan LoginPage:
      MaterialApp: Widget yang menyediakan beberapa parameter tema dan membangun aplikasi dengan menggunakan material design.
      Scaffold: Menyediakan struktur dasar untuk tata letak halaman.
      AppBar: Menampilkan bar atas dengan judul "Login".
      Container: Membungkus elemen-elemen dalam tata letak halaman login.
      TextField: Widget input untuk menerima username dan password.
      SizedBox: Memberikan spasi vertikal antar elemen dalam halaman login.
      ElevatedButton: Tombol tinggi dengan latar belakang diwarnai.
      SnackBar: Menampilkan pesan sementara di bagian bawah layar.
      AlertDialog: Menampilkan dialog dengan pesan.
      Navigator: Bertanggung jawab untuk navigasi antar halaman.
    
  - Pada LeftDrawer:
      Drawer: Menampilkan drawer sisi kiri dengan daftar opsi.
      DrawerHeader: Bagian atas drawer dengan judul dan deskripsi.
      ListView: Menampilkan daftar item di dalam drawer.
      ListTile: Menampilkan opsi navigasi dalam drawer.
      Icon: Menampilkan ikon di sebelah kiri judul opsi navigasi.
      Text: Menampilkan teks judul dan deskripsi dalam DrawerHeader.
      Padding: Memberikan ruang antara elemen dalam DrawerHeader.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
  - Membuat halaman login pada proyek tugas Flutter.
      Buatlah file baru bernama login.dart pada folder screen. Lalu pada file main.dart, ubah bagian home menjadi home: LoginPage() (sesuaikan kode)
      Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
  #### Setup Autentikasi pada Django untuk Flutter
    - Buatlah django-app bernama authentication pada project Django yang telah dibuat sebelumnya.
    - Tambahkan authentication ke INSTALLED_APPS pada main project settings.py aplikasi Django kamu.
    - Jalankan perintah pip install django-cors-headers untuk menginstall library yang dibutuhkan.
    - Tambahkan corsheaders ke INSTALLED_APPS pada main project settings.py aplikasi Django.
    - Tambahkan corsheaders.middleware.CorsMiddleware pada main project settings.py aplikasi Django.
    - Tambahkan beberapa variabel berikut ini pada main project settings.py aplikasi Django.
      ```
      CORS_ALLOW_ALL_ORIGINS = True
      CORS_ALLOW_CREDENTIALS = True
      CSRF_COOKIE_SECURE = True
      SESSION_COOKIE_SECURE = True
      CSRF_COOKIE_SAMESITE = 'None'
      SESSION_COOKIE_SAMESITE = 'None'
      ```
    - Buatlah sebuah metode view untuk login pada authentication/views.py.
      ```
      from django.shortcuts import render
      from django.contrib.auth import authenticate, login as auth_login
      from django.http import JsonResponse
      from django.views.decorators.csrf import csrf_exempt

      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  # Status login sukses.
                  return JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login sukses!"
                      # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                  }, status=200)
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login gagal, akun dinonaktifkan."
                  }, status=401)

          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, periksa kembali email atau kata sandi."
              }, status=401)
      ```
    - Buat file urls.py pada folder authentication dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint login/.
    ```
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
  - Terakhir, tambahkan path('auth/', include('authentication.urls')), pada file shopping_list/urls.py.
  #### Integrasi Sistem Autentikasi pada Flutter
    - Menjalankan perintah berikut di Terminal.
      ```
        flutter pub add provider
        flutter pub add pbp_django_auth
      ```
        Untuk menggunakan package tersebut, modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider.
      ```
        class MyApp extends StatelessWidget {
            const MyApp({Key? key}) : super(key: key);

            @override
            Widget build(BuildContext context) {
                return Provider(
                    create: (_) {
                        CookieRequest request = CookieRequest();
                        return request;
                    },
                    child: MaterialApp(
                        title: 'Flutter App',
                        theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                            useMaterial3: true,
                        ),
                        home: MyHomePage()),
                    ),
                );
            }
        }
      ```
    - Buatlah file baru pada folder screens dengan nama login.dart.
      ```
        import 'package:shopping_list/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        void main() {
            runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
            ),
            home: const LoginPage(),
            );
            }
        }

        class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Login'),
                    ),
                    body: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                    ),
                                    obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        // Cek kredensial
                                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                        // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                        // gunakan URL http://10.0.2.2/
                                        final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                        'username': username,
                                        'password': password,
                                        });
                            
                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                    SnackBar(content: Text("$message Selamat datang, $uname.")));
                                            } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: const Text('Login Gagal'),
                                                    content:
                                                        Text(response['message']),
                                                    actions: [
                                                        TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            );
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                            ],
                        ),
                    ),
                );
            }
        }
      ```
    - Pada file main.dart, pada Widget MaterialApp(...), ubah home: MyHomePage() menjadi home: LoginPage()
  #### Membuat model kustom sesuai dengan proyek aplikasi Django.
      Untuk melakukan kustom, gunakan website quicktypoe agar mengkonversi model JSON dari projek django menjadi model di dart. Lalu, buatlah folder baru bernama model. Kemudian, buat file bernama item.dart untuk menyimpan model yang telah dibuat.
      ```
        // To parse this JSON data, do
        //
        //     final item = itemFromJson(jsonString);

        import 'dart:convert';

        List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

        String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

        class Item {
            Model model;
            int pk;
            Fields fields;

            Item({
                required this.model,
                required this.pk,
                required this.fields,
            });

            factory Item.fromJson(Map<String, dynamic> json) => Item(
                model: modelValues.map[json["model"]]!,
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

            Map<String, dynamic> toJson() => {
                "model": modelValues.reverse[model],
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
            int user;
            String name;
            int price;
            int amount;
            String description;
            DateTime dateAdded;

            Fields({
                required this.user,
                required this.name,
                required this.price,
                required this.amount,
                required this.description,
                required this.dateAdded,
            });

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                price: json["price"],
                amount: json["amount"],
                description: json["description"],
                dateAdded: DateTime.parse(json["date_added"]),
            );

            Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "price": price,
                "amount": amount,
                "description": description,
                "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
            };
        }

        enum Model {
            MAIN_ITEM
        }

        final modelValues = EnumValues({
            "main.item": Model.MAIN_ITEM
        });

        class EnumValues<T> {
            Map<String, T> map;
            late Map<T, String> reverseMap;

            EnumValues(this.map);

            Map<T, String> get reverse {
                reverseMap = map.map((k, v) => MapEntry(v, k));
                return reverseMap;
            }
        }
      ```
  - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  - Buatlah file baru pada folder lib/screens dengan nama list_item.dart.
  - Pada file list_item.dart, impor library yang dibutuhkan dan kode yang dibutuhkan juga.
  - Salinlah potongan kode berikut pada screen/list_item.dart.
  - Tambahkan halaman list_item.dart ke widgets/left_drawer.dart dengan menambahkan kode yang sesuai.
  - Tambahkan tombol Daftar Item pada halaman utama agar mengarahkan ke halaman ItemPage dengan melakukan redirection dengan menambahkan else if setelah kode if(...){...} di bagian akhir onTap: () { } yang ada pada file widgets/shop_card.dart
  - Impor file yang dibutuhkan saat menambahkan ItemPage ke left_drawer.dart dan shop_card.dart.
  - Membuat halaman detail untuk setiap item yang terdapat pada halaman Daftar Item.
  #### Integrasi Form Flutter Dengan Django
    - Buatlah sebuah fungsi view baru pada main/views.py
      ```
      @csrf_exempt
      def create_product_flutter(request):
          if request.method == 'POST':
              
              data = json.loads(request.body)

              new_product = Product.objects.create(
                  user = request.user,
                  name = data["name"],
                  price = int(data["price"]),
                  description = data["description"]
              )

              new_product.save()

              return JsonResponse({"status": "success"}, status=200)
          else:
              return JsonResponse({"status": "error"}, status=401)
      ```
    - Tambahkan path baru pada main/urls.py dengan kode berikut.
      ```
      path('create-flutter/', create_product_flutter, name='create_product_flutter'),
      ```
    - Hubungkan halaman inventory_form.dart dengan CookieRequest
    - Ubahlah perintah pada onPressed: () button
  #### Implementasi Fitur Logout
    Dalam Django
      - Buat method logout dalam authentication/views.py
      - Tambahkan path baru pada authentication/urls.py
        ```
        path('logout/', logout, name='logout'),
        ```
    Dalam Flutter
      - Buka file lib/widgets/shop_card.dart
        ```
        ...
        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Material(
        ...
        ```
      - Ubahlah perintah onTap: () {...} pada widget Inkwell menjadi onTap: () async {...} agar widget Inkwell dapat melakukan proses logout secara asinkronus.
      - Dalam async {...}, tambahkan
        ```
        ...
        // statement if sebelumnya
        // tambahkan else if baru seperti di bawah ini
        else if (item.name == "Logout") {
                final response = await request.logout(
                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                    "http://<APP_URL_KAMU>/auth/logout/");
                String message = response["message"];
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message"),
                  ));
                }
              }
        ...
        ```
  #### Git add, commit, push