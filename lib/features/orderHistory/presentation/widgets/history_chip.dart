import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';

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
