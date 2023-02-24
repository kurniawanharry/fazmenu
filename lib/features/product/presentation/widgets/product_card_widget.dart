import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    child: const ImageUrl(
                      url:
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
                        Text(
                          'Nijika Ichiji',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Kessoku Band',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          formatCurrency(10000),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
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
                    Text(
                      'Stok Ada',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Transform.scale(scale: 0.9, child: Switch(value: false, onChanged: (value) {})),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text('Tersedia', style: Theme.of(context).textTheme.bodyMedium),
                    Transform.scale(scale: 0.9, child: Switch(value: true, onChanged: (value) {})),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
