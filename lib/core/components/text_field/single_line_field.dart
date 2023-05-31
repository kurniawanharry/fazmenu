import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleLineField extends StatelessWidget {
  final AutovalidateMode autovalidateMode;
  final EdgeInsetsGeometry contentPadding;
  final FieldTheme fieldTheme;
  final FocusNode? focusNode;
  final void Function()? onComplete;
  final Function(String)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final String hint;
  final String? initialValue;
  final SmartDashesType? smartDashesType;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? suffixText;
  final String? prefixText;
  final TextStyle? suffixTextStyle;
  final TextStyle? prefixTextStyle;
  final bool readOnly;
  final bool visible;
  final bool obscureText;
  final int? length;
  final int maxLine;
  final int? maxLength;
  final double borderRadius;
  final bool showCursor;
  final int? minLine;
  final TextStyle? style;
  final bool autoFocus;
  final bool enabled;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? boxConstraints;
  final String? helperText;
  final Color? fillColor;

  const SingleLineField({
    Key? key,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    this.fieldTheme = FieldTheme.light,
    this.focusNode,
    this.onComplete,
    this.onChanged,
    this.onTap,
    this.inputFormatters = const [],
    this.validator,
    this.hint = "",
    this.initialValue,
    this.smartDashesType,
    this.textAlign,
    this.controller,
    this.inputAction = TextInputAction.done,
    this.inputType = TextInputType.visiblePassword,
    this.textStyle,
    this.hintStyle,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText,
    this.prefixText,
    this.suffixTextStyle,
    this.prefixTextStyle,
    this.visible = true,
    this.obscureText = false,
    this.length,
    this.maxLine = 1,
    this.borderRadius = 5.0,
    this.showCursor = true,
    this.minLine,
    this.style,
    this.autoFocus = false,
    this.enabled = true,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.maxLength,
    this.helperText,
    this.fillColor,
    this.boxConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> allInputFormatters = [
      LengthLimitingTextInputFormatter(length),
      FilteringTextInputFormatter.deny(RegExp(
          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
    ];
    allInputFormatters.addAll(inputFormatters);
    return Visibility(
      visible: visible,
      child: TextFormField(
        key: key,
        focusNode: focusNode,
        controller: controller,
        autocorrect: false,
        enabled: enabled,
        showCursor: showCursor,
        autofocus: autoFocus,
        readOnly: readOnly,
        initialValue: initialValue,
        maxLines: maxLine,
        obscureText: obscureText,
        minLines: minLine,
        autovalidateMode: autovalidateMode,
        keyboardType: inputType,
        textInputAction: inputAction,
        inputFormatters: allInputFormatters,
        onEditingComplete: onComplete,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        maxLength: maxLength,
        smartDashesType: smartDashesType,
        textAlign: textAlign ?? TextAlign.left,
        style: textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: FazColors.slate[600],
                  fontSize: 14,
                ),
        decoration: fieldTheme == FieldTheme.dark
            ? InputDecoration(
                hintText: hint,
                isDense: true,
                filled: true,
                fillColor: FazColors.slate[50]!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.slate[50]!,
                  ),
                ),
                contentPadding: contentPadding,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.slate[50]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.slate[50]!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.slate[50]!,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.slate[50]!,
                  ),
                ),
                hintStyle: textStyle?.copyWith(color: FazColors.slate[400]) ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: FazColors.slate[400]),
                suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
                prefixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: suffixIcon,
                      )
                    : null,
                prefixIcon: prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: prefixIcon,
                      )
                    : null,
                suffixText: suffixText,
                prefixText: prefixText,
                suffixStyle: suffixTextStyle ??
                    textStyle ??
                    Theme.of(context).textTheme.bodyMedium!.copyWith(color: FazColors.black),
                prefixStyle: prefixTextStyle ??
                    textStyle ??
                    Theme.of(context).textTheme.bodyMedium!.copyWith(color: FazColors.black),
              )
            : InputDecoration(
                isDense: true,
                contentPadding: contentPadding,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.blue[500]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.blue[500]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: FazColors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: FazColors.blue[500]!,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: FazColors.white,
                  ),
                ),
                hintText: hint,
                hintStyle: hintStyle ??
                    textStyle?.copyWith(color: FazColors.slate[400]) ??
                    Theme.of(context).textTheme.bodySmall?.copyWith(color: FazColors.slate[400]),
                filled: true,
                fillColor: fillColor ?? FazColors.slate[50],
                suffixIconConstraints: suffixIconConstraints,
                prefixIconConstraints: prefixIconConstraints,
                constraints: boxConstraints,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                suffixText: suffixText,
                prefixText: prefixText,
                helperText: helperText,
                suffixStyle: suffixTextStyle ??
                    textStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: FazColors.slate[600], fontSize: 14),
                prefixStyle: prefixTextStyle ??
                    textStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: FazColors.slate[600], fontSize: 14),
              ),
      ),
    );
  }
}
