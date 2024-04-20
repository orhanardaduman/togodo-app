import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/screens/chat_user_search_page.dart';

class ImageSelectOptions extends StatelessWidget {
  const ImageSelectOptions({required this.onTap, super.key});
  final void Function(ImageSource source) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    leading: CustomBorderedButton(
                      icon: Icons.photo,
                      radius: 25,
                      theme: AppTheme.light(),
                    ),
                    title: const Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => onTap(ImageSource.gallery),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    leading: CustomBorderedButton(
                      theme: AppTheme.light(),
                      icon: Icons.camera_alt,
                      radius: 25,
                    ),
                    title: const Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => onTap(ImageSource.camera),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
