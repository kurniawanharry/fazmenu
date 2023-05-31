import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  const CustomCheckboxTile({
    super.key,
    this.title,
    this.value,
    this.onChanged,
    this.subTitle,
  });

  final String? title;
  final bool? value;
  final String? subTitle;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: 5),
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: FazColors.slate[600],
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        Visibility(
          visible: subTitle?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 5),
            child: Text(
              subTitle ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
