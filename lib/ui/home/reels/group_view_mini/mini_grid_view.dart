import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

import '../../../../data/model/event/event_details_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/viewmodel/user_view_model.dart';

class MiniGroupGridView extends HookConsumerWidget {
  const MiniGroupGridView({this.item, super.key});
  final EventDetailsModel? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;

    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          60,
        ),
        color: const Color.fromRGBO(
          32,
          198,
          165,
          .08,
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
