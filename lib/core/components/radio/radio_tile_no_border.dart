import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class RadioTileNoBorder extends StatelessWidget {
  const RadioTileNoBorder({
    Key? key,
    required this.isSelected,
    this.onTap,
    required this.title,
    this.subTitle,
    this.textStyle,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback? onTap;
  final String title;
  final String? subTitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.check_circle,
                  size: 20,
                  color: isSelected ? FazColors.blue[600] : FazColors.slate[200],
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  style: textStyle ?? Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
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
                style: textStyle ?? Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                overflow: TextOverflow.fade,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
