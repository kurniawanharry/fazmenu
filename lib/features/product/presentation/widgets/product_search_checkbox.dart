import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/util/extension.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class ProductSearchBox extends StatelessWidget {
  const ProductSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Visibility(
                      child: NoImageProduct(size: 50),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'test'.toUpperCamelCase(),
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: FazColors.slate[600],
                                            fontWeight: FontWeight.w600,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      formatCurrency(1000),
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: FazColors.slate[600], fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
