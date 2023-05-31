import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class ButtonRadio<T> extends StatelessWidget {
  const ButtonRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  final T? value;
  final T? groupValue;
  final String label;
  final ValueChanged<T?>? onChanged;

  Widget _buildLabel(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => onChanged!(groupValue),
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.teal.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: isSelected ? FazColors.blue[400] : Colors.white,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isSelected ? Colors.white : FazColors.slate[400],
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLabel(context);
  }
}
