import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/util/extension.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class OptionCardWidget extends StatelessWidget {
  const OptionCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: FazColors.slate[100],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(width: 15),
          Expanded(
            child: SizedBox(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Visibility(
                    child: NoImageProduct(size: 55),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              'test'.toUpperCamelCase(),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: FazColors.slate[600],
                                    fontWeight: FontWeight.w600,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            formatCurrency(10000),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: FazColors.slate[600],
                                  fontWeight: FontWeight.w600,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
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
    );
  }
}
