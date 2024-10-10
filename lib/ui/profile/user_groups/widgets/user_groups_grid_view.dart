import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';

import '../../../../gen/assets.gen.dart';
import '../../../auth/viewmodel/user_view_model.dart';

class UserGroupsGridView extends HookConsumerWidget {
  const UserGroupsGridView({
    super.key,
    this.item,
  });
  final EventGroups? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;

    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(
        5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          87,
        ),
      ),
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.25,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: 4,
          itemBuilder: (c, i) {
            return Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                image: item?.requests?[i].aspNetUsers != null
                    ? DecorationImage(
                        image: NetworkImage(
                          item?.requests?[i].aspNetUsers?.imageUrl ?? '',
                        ),
                      )
                    : i == 3
                        ? DecorationImage(
                            image: NetworkImage(
                              userModel?.profileImageUrl ?? '',
                            ),
                          )
                        : null,
              ),
              child: i == 3 || item?.requests?[i].aspNetUsers != null
                  ? null
                  : Assets.icons.logo.round.svg(),
            );
          },
        ),
      ),
    );
  }
}
