// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_edit_view_model.dart';

class CommunityImage extends HookConsumerWidget {
  const CommunityImage({
    super.key,
    this.image,
  });

  final Images? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(profilEditViewModelProvider.notifier);
    final modelView = ref.watch(profilEditViewModelProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: context.sized.dynamicWidth(0.9),
          height: context.sized.dynamicWidth(0.9),
          decoration: BoxDecoration(
            image: image == null && modelView.mediaList.firstOrNull == null
                ? null
                : DecorationImage(
                    image: image == null || modelView.mediaList.isNotEmpty
                        ? FileImage(modelView.mediaList.first!.url!)
                        : NetworkImage(image!.downloadUrl!) as ImageProvider,
                    fit: BoxFit.fill,
                  ),
            borderRadius: BorderRadius.circular(40),
            color: MainColors.transparentBlue,
          ),
        ),
        if (image == null)
          InkWell(
            onTap: () async {
              await model.pickImage(0, context: context);
            },
            child: Assets.icons.bold.plus.svg(
              color: MainColors.primary,
              width: 37.5,
              height: 37.5,
            ),
          )
        else
          Positioned(
            child: InkWell(
              radius: 12.5,
              onTap: () async {
                await model.pickImage(0, context: context);
              },
              child: Container(
                width: 37.5,
                height: 37.5,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: MainColors.dark3,
                ),
                child: Assets.icons.light.editSquare.svg(
                  color: MainColors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
