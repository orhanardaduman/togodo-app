import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

import '../../../../data/model/event/event_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/viewmodel/user_view_model.dart';

class GroupGridView extends HookConsumerWidget {
  const GroupGridView({this.item, super.key});
  final EventModel? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;

    return Container(
      width: 225,
      height: 225,
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          87,
        ),
        color: const Color.fromRGBO(
          24,
          28,
          32,
          .5,
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
                border: i == 3
                    ? Border.all(
                        color:
                            item?.eventGroups?.requests?[i].aspNetUsers != null
                                ? MainColors.primary
                                : Colors.white,
                        width: 2,
                      )
                    : null,
                image: item?.eventGroups?.requests?[i].aspNetUsers != null
                    ? DecorationImage(
                        image: NetworkImage(
                          item?.eventGroups?.requests?[i].aspNetUsers
                                  ?.imageUrl ??
                              '',
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
              child:
                  i == 3 || item?.eventGroups?.requests?[i].aspNetUsers != null
                      ? null
                      : Assets.icons.logo.round.svg(),
            );
          },
        ),
      ),
    );
  }
}
