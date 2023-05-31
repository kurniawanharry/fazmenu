import 'package:fazmenu/core/components/button/buttom_buttom.dart';
import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Visibility(
                            visible: false,
                            replacement: const NoImageProduct(size: 60),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: const ImageUrl(
                                url:
                                    'https://leosigh.com/wp-content/uploads/2022/09/Nijika-Ijichi-in-Bocchi-the-Rock.jpg',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Test',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  formatCurrency(10000),
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtomButton(
                iconData: MdiIcons.sort,
                ontap: () {},
                text: 'Ubah Urutan',
              ),
            ],
          ),
        ],
      )),
    );
  }
}
