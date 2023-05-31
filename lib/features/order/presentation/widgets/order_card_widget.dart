import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: FazColors.slate[50],
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: FazColors.slate[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        'assets/icons/payments/ewallet/gopay.png',
                        width: 50,
                      ),
                    ),
                    orderStatus(100),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      orderType(100),
                      Text(
                        'RT1',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: FazColors.slate[100],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Column(
              children: [
                ...List.generate(2, (index) {
                  return ListTile(
                    leading: Text(
                      '100x',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                    ),
                    title: Text(
                      'Steak',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      'Harga Satuan',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Text(
                      formatCurrency(10000),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('Detail'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Terima'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
