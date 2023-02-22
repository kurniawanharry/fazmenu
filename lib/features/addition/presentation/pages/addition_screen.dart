import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class AdditionScreen extends StatelessWidget {
  const AdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahan'),
      ),
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Text 1'),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            size: 16,
                          ),
                          label: const Text('Ganti'),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        ...List.generate(10, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Chip(
                              label: Text('Text $index'),
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('Tambah Modifikasi Baru'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
