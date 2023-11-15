import 'package:flutter/material.dart';
import 'package:inventory_mobile/screens/menu.dart';
import 'package:inventory_mobile/screens/inventory_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Bagian drawer header
            decoration: BoxDecoration(
              color:  Colors.deepPurple,
            ),
            child: Column(
              children: [
                Text('Inventory App',
                textAlign: TextAlign.center ,
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
          // Bagian routing
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ShopFormPage(),
                  ));
              },
            ),
                    ],
                  ),
                );
              }
            }