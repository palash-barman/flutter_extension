import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.6),
        highlightColor: Colors.grey.withOpacity(0.3),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        Images.placeholder,
        height: height,
        width: width,
        fit: fit,
      ),
     
    );
  }
}
