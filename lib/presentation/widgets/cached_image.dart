import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String)? placeholderBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.placeholderBuilder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPlaceholder = Container(
      color: Colors.grey[200],
      child: const Center(child: CircularProgressIndicator()),
    );

    final defaultError = Container(
      color: Colors.grey[200],
      child: const Center(child: Icon(Icons.image_not_supported, size: 50)),
    );

    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) =>
          placeholderBuilder?.call(context, url) ?? defaultPlaceholder,
      errorWidget: (context, url, error) =>
          errorBuilder?.call(context, url, error) ?? defaultError,
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}

// Variants for common use cases
class CircularCachedImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Widget Function(BuildContext, String)? placeholderBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;

  const CircularCachedImage({
    super.key,
    required this.imageUrl,
    required this.size,
    this.placeholderBuilder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholderBuilder: placeholderBuilder,
        errorBuilder: errorBuilder,
      ),
    );
  }
}

class AspectRatioCachedImage extends StatelessWidget {
  final String imageUrl;
  final double aspectRatio;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String)? placeholderBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;

  const AspectRatioCachedImage({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
    this.fit,
    this.borderRadius,
    this.placeholderBuilder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedImage(
        imageUrl: imageUrl,
        fit: fit,
        borderRadius: borderRadius,
        placeholderBuilder: placeholderBuilder,
        errorBuilder: errorBuilder,
      ),
    );
  }
}
