import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text('Produk'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://leosigh.com/wp-content/uploads/2022/09/Nijika-Ijichi-in-Bocchi-the-Rock.jpg',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Text text text'),
                                      Text('Text text text'),
                                      Text('Rp 100'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text('Stok Ada'),
                                  Switch(value: false, onChanged: (value) {}),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Text('Tersedia'),
                                  Switch(value: false, onChanged: (value) {}),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {}, icon: Icon(Icons.add), label: Text('Tambah Stok')),
                  TextButton.icon(
                      onPressed: () {}, icon: Icon(Icons.add), label: Text('Tambah Produk')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
