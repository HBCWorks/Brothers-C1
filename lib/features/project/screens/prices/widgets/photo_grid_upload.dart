import 'dart:io';

import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/features/project/controllers/ask_price_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UploadPhotosWidget extends StatelessWidget {
  UploadPhotosWidget({
    super.key,
  });

  final controller = AskPriceController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            // height:
            //     (controller.choozenMedia.length / 2) *
            //         200,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.choozenMedia.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Image.file(
                        File(controller.choozenMedia[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () =>
                              controller.choozenMedia.removeAt(index),
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Row(
                  children: [
                    const Icon(
                      Iconsax.add_circle,
                      size: 30,
                      color: TColors.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.addImages,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                onPressed: () {
                  controller.selectImages();
                },
              ),
              Visibility(
                visible: controller.choozenMedia.isNotEmpty,
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.totalImages,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: TColors.darkerGray),
                    ),
                    TRoundedContainer(
                      showBorder: true,
                      radius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: Text(
                            " ${controller.choozenMedia.length}",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: TColors.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Visibility(
            visible: controller.choozenMedia.isNotEmpty,
            child: Column(
              children: [
                IconButton(
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.uploadImages),
                      const SizedBox(width: TSizes.spaceBtWItems),
                      const Icon(Iconsax.document_upload)
                    ],
                  ),
                  onPressed: () {
                    for (var image in controller.choozenMedia) {
                      controller.uploadFile(image as PlatformFile);
                    }
                  },
                ),
                controller.buildProgress()
              ],
            ),
          )
        ],
      ),
    );
  }
}
