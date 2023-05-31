import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class TabQuantity extends StatelessWidget {
  const TabQuantity({
    super.key,
    this.title,
    this.quantity = 0,
  });

  final String? title;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Tab(
        child: Row(
          children: [
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
            ),
            Visibility(
              visible: quantity != 0,
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: FazColors.blue[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(quantity.toString()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
