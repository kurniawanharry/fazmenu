import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({
    super.key,
    this.ontap,
    this.text,
    this.iconData,
  });

  final Function()? ontap;
  final String? text;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton.icon(
            onPressed: null,
            icon: Icon(iconData),
            label: Text(
              text ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
