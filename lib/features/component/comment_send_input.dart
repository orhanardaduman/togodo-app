import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';

class CommenSendInput extends HookConsumerWidget {
  const CommenSendInput({
    required TextEditingController textEditingController,
    required this.label,
    this.onSuffixTap,
    this.isFillColor = false,
    super.key,
    this.onTap,
    this.focusNode,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final void Function()? onSuffixTap;
  final String label;
  final FocusNode? focusNode;
  final bool isFillColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userViewModelProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomAvatarImage(
          borderRadius: 100,
          imageUrl: user.profileImageUrl,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: label,
            controller: _textEditingController,
            isFillColor: isFillColor,
            suffixIcon: Assets.icons.bulk.send.path,
            onSuffixTap: onSuffixTap,
            onTap: onTap,
            onFieldSubmitted: (value) {
              onSuffixTap?.call();
            },
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}
