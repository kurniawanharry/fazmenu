import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    this.changeOrder,
    this.categoryName,
    this.productImage,
  });

  final bool? changeOrder;
  final String? categoryName;
  final List<String>? productImage;

  @override
  Widget build(BuildContext context) {
    return changeOrder!
        ? Row(
            children: [
              Expanded(child: _card(context)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.drag_handle_outlined,
                  size: 20,
                ),
              )
            ],
          )
        : _card(context);
  }

  Card _card(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 3,
      color: FazColors.slate[100],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ButtonEdit(
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productImage?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var image = productImage?[index];
                  if (index < 5) {
                    return Visibility(
                      visible: image?.isNotEmpty ?? false,
                      replacement: const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: NoImageProduct(
                          size: 50,
                        ),
                      ),
                      child: ImageUrl(
                        url: image ?? '',
                        height: 50,
                        width: 50,
                      ),
                    );
                  } else {
                    return Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: FazColors.slate[900]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.more_horiz_outlined,
                        size: 20,
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child:
            //   Wrap(
            //     spacing: 10,
            //     children: [
            //       ...List.generate(
            //         4,
            //         (index) => const
            // Padding(
            //           padding: EdgeInsets.only(top: 5),
            //           child: NoImageProduct(
            //             size: 50,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: 50,
            //         width: 50,
            //         margin: const EdgeInsets.only(top: 5),
            //         decoration: BoxDecoration(
            //           color: FazColors.slate[900]?.withOpacity(0.2),
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         alignment: Alignment.center,
            //         child: const Icon(
            //           Icons.more_horiz_outlined,
            //           size: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('/categoryView');
                    },
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          const TextSpan(
                            text: 'Lihat',
                          ),
                          TextSpan(
                            text: ' ${productImage?.length} ',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: FazColors.amber[400],
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const TextSpan(
                            text: 'produk',
                          ),
                          const WidgetSpan(child: Icon(Icons.arrow_forward_ios, size: 14))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
