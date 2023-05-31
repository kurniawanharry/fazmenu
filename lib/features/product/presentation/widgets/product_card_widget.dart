import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    this.imageUrl,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.stockFunction,
    this.productFunction,
    this.isStockExist,
    this.isProductExist,
  });

  final String? imageUrl;
  final String? productName;
  final String? productDescription;
  final int? productPrice;
  final bool? isStockExist;
  final bool? isProductExist;
  final Function(bool?)? stockFunction;
  final Function(bool?)? productFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
                  Visibility(
                    visible: imageUrl?.isNotEmpty ?? false,
                    replacement: const NoImageProduct(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: ImageUrl(
                        url: imageUrl!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          productDescription ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          formatCurrency(productPrice),
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
                const Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Stok Ada',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isStockExist ?? false,
                          onChanged: stockFunction,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Tersedia',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isProductExist ?? false,
                          onChanged: productFunction,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
