import 'package:flutter/material.dart';
import 'package:togodo/ui/profile/user_groups/model/user_groups_model.dart';
import 'package:togodo/ui/profile/user_groups/widgets/user_gorups_list_item_view.dart';

class UserGroupsWidget extends StatelessWidget {
  const UserGroupsWidget({required this.models, super.key});
  final UserGroupsListModel? models;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: models?.matches.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Yan yana iki öğe olacak
        crossAxisSpacing: 18, // Yatay aralık
        mainAxisSpacing: 16, // Dikey aralık
        childAspectRatio: 189 / 302, // Öğelerin genişlik/yükseklik oranı
      ),
      itemBuilder: (c, i) {
        return UserGorupsListItemView(
          model: models?.matches[i],
        );
      },
    );
  }
}
