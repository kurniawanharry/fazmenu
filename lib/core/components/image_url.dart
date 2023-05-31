import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer/shimmer_box.dart';

class ImageUrl extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final Alignment position;
  final BoxFit? fit;
  final bool? withBorder;
  const ImageUrl({
    Key? key,
    this.url = '',
    this.width,
    this.height,
    this.position = Alignment.center,
    this.fit = BoxFit.fill,
    this.withBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      alignment: Alignment.center,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? height,
        height: height ?? width,
        decoration: BoxDecoration(
          borderRadius: withBorder! ? BorderRadius.circular(5) : BorderRadius.zero,
          image: DecorationImage(image: imageProvider, fit: fit, alignment: position),
        ),
      ),
      placeholder: (context, url) => ShimmerBox(width: width ?? 35, height: height ?? 14),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
