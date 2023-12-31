import 'package:inventory_mobile/screens/inventory_form.dart';
import 'package:flutter/material.dart';
import 'package:inventory_mobile/screens/inventory_list.dart';
import 'package:inventory_mobile/screens/list_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:inventory_mobile/screens/login.dart';

class ShopItem {
  final String name;
  final IconData icon;
  // Warna
  final Color color;
  String number;

  ShopItem(this.name, this.icon, this.color, this.number);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
                // Navigate ke route yang sesuai (tergantung jenis tombol)
                if (item.name == "Tambah Item") {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShopFormPage()));
                } else if (item.name == "Lihat Item") {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ItemListPage()));
                } else if (item.name == "Daftar Item") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ItemPage()));
                } else if (item.name == "Logout") {
                    final response = await request.logout(
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        "http://127.0.0.1:8000/auth/logout/");
                    String message = response["message"];
                    if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname.")
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
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.number,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white)
                ),
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
      ),
    );
  }
}