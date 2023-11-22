import 'package:flutter/material.dart';
import 'package:inventory_mobile/models/itemb.dart';
import 'package:inventory_mobile/widgets/left_drawer.dart';

// Bonus Tugas 8 Page
class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Item'),
        backgroundColor: Colors.deepPurple.shade200,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: Itemb.items.length,
        itemBuilder: (context, index) {
          Itemb currentItem = Itemb.items[index];
          return Card(
            elevation: 4.0, // Menambahkan efek bayangan pada Card
            margin: const EdgeInsets.all(8.0), // Menambahkan margin pada Card
            child: ListTile(
              title: Text(currentItem.name),
              subtitle: Text('Jumlah: ${currentItem.amount}'),
              isThreeLine: true,
              onTap: () {
                // Implementasi logika untuk menangani ketika item di-tap
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Detail Item'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama: ${currentItem.name}'),
                            Text('Harga Item: ${currentItem.price}'),
                            Text('Jumlah Item: ${currentItem.amount}'),
                            Text('Deskripsi: ${currentItem.description}'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}