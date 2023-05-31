import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/components/shimmer/shimmer_box.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class IllustrationLoader extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? imageLocal;
  final bool scroll;
  final double height;
  final double width;
  final Widget? button;
  const IllustrationLoader({
    Key? key,
    @required this.title,
    this.description,
    this.imageUrl,
    this.imageLocal,
    this.scroll = false,
    this.height = double.infinity,
    this.width = double.infinity,
    this.button,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: !scroll
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: height / 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _contentImage(),
            const SizedBox(height: 20),
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: FazColors.slate[800],
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 5),
            Visibility(
              visible: description != null,
              child: Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: FazColors.slate[800],
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Visibility(
                visible: button is Widget && button != null,
                child: button ?? const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentImage() {
    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, imageProvider) => Container(
          height: height / 2,
          width: height / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => ShimmerBox(height: height / 2),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    } else if (imageLocal != null) {
      return Image.asset(
        imageLocal!,
        height: height / 3,
        width: height / 3,
      );
    } else {
      return const SizedBox();
    }
  }
}
