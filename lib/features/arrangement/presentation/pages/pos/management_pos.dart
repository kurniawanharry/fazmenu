
import 'package:fazmenu/core/components/response_handler/illustration_loader.dart';
import 'package:flutter/material.dart';

class ManagementPos extends StatelessWidget {
  const ManagementPos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen POS'),
      ),
      body: SafeArea(
          child: Column(
        children: const [
          IllustrationLoader(
            height: 200,
            title: 'Anda tidak memiliki integrasi',
            description:
                'Untuk mengintegrasikan POS dapat dilakukan melalui PC atau Anda dapat menghubungi tim Fazmenu',
          )
        ],
      )),
    );
  }
}
