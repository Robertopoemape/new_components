import 'dart:io';

import 'package:flutter/material.dart';

enum ImageType {
  placeholder,
  asset,
  network,
  file,
}

class ImageBuild extends StatelessWidget {
  const ImageBuild({
    this.pathImage = 'https://via.placeholder.com/280',
    super.key,
  });
  final String? pathImage;

  ImageType get imageType {
    if (pathImage == null) {
      return ImageType.placeholder;
    } else if (pathImage!.contains('http')) {
      return ImageType.network;
    } else if (pathImage!.contains('assets')) {
      return ImageType.asset;
    } else if (pathImage!.contains('file') ||
        pathImage!.contains('.svg') ||
        pathImage!.contains('.png')) {
      return ImageType.file;
    } else {
      return ImageType.placeholder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage(
      pathImage!,
      imageType,
    );
  }

  Widget _buildImage(String pathImage, ImageType imageType) {
    switch (imageType) {
      case ImageType.placeholder:
        return Image.asset(
          pathImage,
          fit: BoxFit.cover,
        );

      case ImageType.asset:
        return Image.asset(
          pathImage,
          fit: BoxFit.cover,
        );

      case ImageType.network:
        return Image.network(
          pathImage,
          fit: BoxFit.cover,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder: (
            BuildContext context,
            Object exception,
            StackTrace? stackTrace,
          ) {
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          },
        );

      case ImageType.file:
        return Image.file(
          File(pathImage),
          fit: BoxFit.cover,
        );
    }
  }
}
