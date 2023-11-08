# Inventory Mobile
Nama    : Citra Andini Hermawan
NPM     : 2206830012
Kelas   : PBP D
Repository : 

## Tugas 6
### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Dalam pengembangan aplikasi Flutter, perbedaan utama antara widget stateless dan stateful adalah cara widget tersebut menangani dan mengubah data. Widget stateless adalah jenis widget yang tidak memiliki status internal, artinya widget tidak dapat mengubah tampilan atau propertinya setelah dibuat. Widget stateless digunakan untuk elemen tampilan yang tidak perlu diperbarui berdasarkan perubahan data saat aplikasi sedang berjalan, seperti teks statis, ikon, gambar, atau tombol yang tidak perlu diubah sepanjang masa aplikasi.

Selain itu, widget stateful adalah jenis widget yang status internalnya dapat berubah selama siklus hidup aplikasi. Hal ini memungkinkan widget untuk memperbarui ketika data terkait berubah. Widget status digunakan ketika kita ingin memantau perubahan data dan mengubah tampilan berdasarkan perubahan tersebut. Contoh penggunaan widget status mencakup pembuatan formulir atau catatan yang memerlukan perubahan dinamis. Widget status juga memiliki metode 'setState' yang memungkinkan Anda memperbarui status widget dan memicu pembaruan tampilan baru.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Membuat folder baru di file manager dengan nama 'inventory_mobile'
- Membuka Command Prompt dan masuk ke direktori 'inventory_mobile'
- Membuat proyek Flutter baru dengan nama 'inventory_app_mobile', dan masuk ke direktori itu.
    flutter create <APP_NAME>
    cd <APP_NAME>