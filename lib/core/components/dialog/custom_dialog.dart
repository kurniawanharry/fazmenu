import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.actionButton,
    this.buttonColor,
    this.cancelCallback,
    this.cancelLabel,
    this.cancelable = true,
    this.content,
    this.description = "",
    this.header,
    this.nextCallback,
    this.nextLabel,
    this.title = "",
    this.icon = DialogIcon.ok,
  }) : super(key: key);

  final bool cancelable;
  final Color? buttonColor;
  final String title, description;
  final String? cancelLabel, nextLabel;
  final Function(BuildContext)? cancelCallback, nextCallback;
  final Widget? header, content, actionButton;
  final DialogIcon? icon;

  dialogContent(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: dialogIcon(icon!),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: header ??
                Visibility(
                  visible: title.isNotEmpty,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Visibility(
              visible: description.isNotEmpty,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: actionButton ??
                Visibility(
                  visible: cancelable,
                  replacement: ElevatedButton(
                    onPressed: () {
                      Get.back(result: true);
                      if (nextCallback != null) {
                        nextCallback!(context);
                      }
                    },
                    child: const Text('Iya'),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.back(result: false);
                            if (cancelCallback != null) {
                              cancelCallback!(context);
                            }
                          },
                          child: const Text('Tidak'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back(result: true);
                            if (nextCallback != null) {
                              nextCallback!(context);
                            }
                          },
                          child: const Text('Iya'),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
