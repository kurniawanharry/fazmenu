import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.list_outlined,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+62812341234',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Nijika Ijichi',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      formatCurrency(100000),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '12/20/2023 12:15:00',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            HistoryChip(orderType: OrderType.ongoing),
          ],
        ),
      ),
    );
  }
}

class HistoryChip extends StatelessWidget {
  const HistoryChip({
    super.key,
    this.orderType,
  });

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      side: BorderSide.none,
      backgroundColor: orderType == OrderType.ongoing
          ? FazColors.emerald[100]
          : orderType == OrderType.cancel
              ? FazColors.pink[100]
              : FazColors.orange[100],
      labelPadding: EdgeInsets.zero,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      label: Text(
        orderTypeHistory(orderType!),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: orderType == OrderType.ongoing
                  ? FazColors.emerald[600]
                  : orderType == OrderType.cancel
                      ? FazColors.pink[600]
                      : FazColors.orange[600],
            ),
      ),
    );
  }
}
