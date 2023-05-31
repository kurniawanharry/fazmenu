import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/arrangement/data/models/payment_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentChannelItem extends StatelessWidget {
  const PaymentChannelItem({
    Key? key,
    required this.title,
    this.subTitle,
    required this.activePayment,
    required this.paymentList,
    required this.paymentChannelName,
    required this.onChanged,
    required this.onChangedActivated,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final bool? activePayment;
  final List<PaymentChannel?>? paymentList;
  final List<String?>? paymentChannelName;
  final Function(String?)? onChanged;
  final Function(bool?)? onChangedActivated;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitchTile(
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
          ),
          subTitle: Text(
            subTitle ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
          ),
          value: activePayment,
          onChanged: (p0) {},
        ),
        ...List.generate(
          paymentList?.length ?? 0,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: paymentChannelName?.contains(paymentList?[index]?.name),
                    onChanged: (value) {
                      onChanged!(paymentList?[index]?.name);
                    },
                  ),
                  const SizedBox(width: 10),
                  ImageUrl(
                    url: paymentList?[index]?.logo ?? '',
                    width: 50,
                    fit: BoxFit.contain,
                    withBorder: false,
                    position: Alignment.center,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
