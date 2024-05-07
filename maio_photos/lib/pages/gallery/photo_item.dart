import 'package:flutter/material.dart';

import '../../model/db/entity/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;

  const PhotoItem({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width ~/ 4;
    return Stack(
      children: [
        Image.network(
          '${photo.url}',
          cacheHeight: itemWidth,
          cacheWidth: itemWidth,
        ),
        Column(
          children: [
            Text('${photo.id ?? 0}'),
            Text(
              '${photo.title}',
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}
