import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:flutter/material.dart';

class ItemOfProdect extends StatelessWidget {
  const ItemOfProdect({
    super.key,
    required this.prodects,
    required this.onTap,
  });

  final Prodects prodects;
  final void Function()? onTap;

  Future<File?> _getCachedImage(String imageUrl) async {
    final fileInfo = await DefaultCacheManager().getFileFromCache(imageUrl);
    return fileInfo?.file;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF979797).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FutureBuilder<File?>(
                      future: _getCachedImage(prodects.image!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData && snapshot.data != null) {
                          return Image.file(
                            snapshot.data!,
                            // fit: BoxFit.cover,
                          );
                        } else {
                          return CachedNetworkImage(
                            imageUrl: prodects.image!,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${prodects.title}",
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                ),
                Text(
                  "\$${prodects.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColor.splashColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColor.priomaryColorApp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
