import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/ui/profile/user_groups/widgets/user_groups_grid_view.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/hook/use_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../features/component/featured_image.dart';
import '../model/user_groups_model.dart';

class UserGorupsListItemView extends HookConsumerWidget {
  const UserGorupsListItemView({required this.model, super.key});
  final UserGroupsModel? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return GestureDetector(
      onTap: () {
        router.push(
          GroupRoute(
            id: model?.groups?.id ?? '',
            eventModel: model?.eventDetailsModel,
          ),
        );
      },
      child: SizedBox(
        width: 250,
        height: 388,
        child: Stack(
          children: [
            FeaturedImageWidget(
              imageUrl: model?.eventDetailsModel?.imageUrl ?? '',
              resolution: model?.eventDetailsModel?.resolution ?? '1200x800',
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            Container(
              padding: const EdgeInsets.all(
                12,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                color: Colors.black.withOpacity(.4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: UserGroupsGridView(
                      item: model?.groups,
                    ),
                  ),
                  const Spacer(),
                  if (model?.groups?.id == null)
                    Container(
                      padding: const EdgeInsets.all(
                        5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        border: Border.all(
                          color: const Color.fromRGBO(
                            255,
                            235,
                            79,
                            1,
                          ),
                          width: 2,
                        ),
                        color: const Color.fromRGBO(
                          255,
                          235,
                          79,
                          .2,
                        ),
                      ),
                      child: PrimaryText(
                        l10n.creatingGroup,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(
                            255,
                            235,
                            79,
                            1,
                          ),
                        ),
                      ),
                    ),
                  PrimaryText(
                    model?.eventDetailsModel?.name ?? '',
                    maxLines: 2,
                    style: theme.textTheme.h5.copyWith(
                      color: MainColors.white,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                    ),
                  ),
                  PrimaryText(
                    model?.eventDetailsModel?.location ?? '',
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: MainColors.white,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
