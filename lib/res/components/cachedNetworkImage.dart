import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetwork extends StatelessWidget {
   CachedNetwork({super.key,required this.imgUrl,this.height, this.shimmerRadius=false,required this.width});
  String imgUrl;
  double? height;
  bool shimmerRadius;
  double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,  // Shimmer base color
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
            shape: shimmerRadius?BoxShape.circle:BoxShape.rectangle
          ),

        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      cacheKey: imgUrl,
    );
  }
}
