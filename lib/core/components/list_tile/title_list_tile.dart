import 'package:fazmenu/core/components/button/custom_icon_button.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({
    super.key,
    this.title,
    this.subTitle,
    this.isNeeded = false,
    this.icon,
    this.iconTitle,
    this.trailing,
  });

  final String? title;
  final String? subTitle;
  final bool? isNeeded;
  final IconData? icon;
  final IconData? iconTitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Visibility(
                    visible: isNeeded!,
                    child: Text(
                      ' *',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600, color: FazColors.red),
                    ),
                  ),
                  Visibility(
                    visible: iconTitle != null,
                    child: CustomIconButton(
                      icon: iconTitle,
                      size: 18,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              Visibility(
                visible: subTitle?.isNotEmpty ?? false,
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: FazColors.slate[400],
                        ),
                    text: subTitle,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: trailing != null,
            child: trailing ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
