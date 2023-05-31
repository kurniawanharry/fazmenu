import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key? key,
    required this.isSelected,
    this.onTap,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback? onTap;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? FazColors.blue[100] : FazColors.white,
          border: Border.all(width: 0.5, color: FazColors.slate[300]!),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
                color: isSelected ? FazColors.blue[600] : FazColors.slate[200],
              ),
            ),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.fade,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
