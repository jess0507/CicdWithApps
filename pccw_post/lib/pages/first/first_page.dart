import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pccw_post/pages/first/first_page_view_model.dart';
import 'package:pccw_post/util/extensions.dart';
import 'package:pccw_post/util/lokalise_key.dart';
import 'package:flutter/material.dart';

class FirstPage extends ConsumerWidget {
  static const routeName = '/';

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LokaliseKey.firstPage),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final path = ref.watch(
                      firstPageViewmodel.select((value) => value.filePath));
                  return path.isNullOrEmpty()
                      ? const Text('No image selected.')
                      : Column(
                          children: [
                            Image.file(
                              File(path),
                              width: double.infinity,
                              height: 100,
                            ),
                            Text('File: $path'),
                          ],
                        );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(firstPageViewmodel.notifier).clear();
                    },
                    child: const Text('Clear Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(firstPageViewmodel.notifier).upload();
                    },
                    child: const Text('Upload Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(firstPageViewmodel.notifier).loadImages();
                    },
                    child: const Text('Reload'),
                  ),
                ],
              ),
              // Consumer(
              //   builder: (context, ref, child) {
              //     final link = ref
              //         .watch(firstPageViewmodel.select((value) => value.link));
              //     return link.isNullOrEmpty()
              //         ? const SizedBox.shrink()
              //         : InkWell(
              //             onTap: () async {
              //               final result = await launchUrl(Uri.parse(link));
              //               if (!result) {
              //                 BotToast.showText(text: 'Unable to open link.');
              //               }
              //             },
              //             child: Text('Open Link: $link'),
              //           );
              //   },
              // ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final mediaList = ref
                  .watch(firstPageViewmodel.select((value) => value.mediaList));
              return Flexible(
                child: GridView.builder(
                  itemCount: mediaList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return FutureBuilder<Uint8List?>(
                      future: mediaList[index].thumbnailData,
                      builder: (context, snapshot) {
                        final bytes = snapshot.data;
                        if (bytes == null) {
                          return const CircularProgressIndicator();
                        }
                        return InkWell(
                          onTap: () {
                            ref
                                .read(firstPageViewmodel.notifier)
                                .select(index: index);
                          },
                          child: Image.memory(bytes),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
