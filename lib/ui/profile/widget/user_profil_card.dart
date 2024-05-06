// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/local/token_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/home/widget/tag_chip_widget.dart';
import 'package:togodo/ui/profile/view/profil_edit_page.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/widget/random_user.dart';
import 'package:togodo/ui/profile/widget/user_card_count_widget.dart';

class UserProfileCard extends StatefulHookConsumerWidget {
  const UserProfileCard({this.data, super.key, this.userId});
  final ProfilModel? data;
  final String? userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileCardState();
}

class _UserProfileCardState extends ConsumerState<UserProfileCard> {
  bool _isShowMoreFriends = false;
  int _type = 0;
  @override
  void initState() {
    super.initState();
    _type = widget.data!.type ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final router = useRouter();
    final l10n = useL10n();
    final model = ref.read(profilViewModelProvider(widget.userId).notifier);
    final profilModel = ref.read(profilViewModelProvider(widget.userId));
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    return widget.data == null
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              color: theme.appColors.background,
              borderRadius: BorderRadius.circular(34),
              border: Border.all(
                color: theme.appColors.divider,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 24,
                    right: 24,
                    bottom: widget.userId != null ? 12 : 24,
                  ),
                  child: (widget.data!.isBlockedCurrentUserToUser ?? true)
                      ? blockCard(l10n, theme, context)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserCardCount(
                              data: widget.data!,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                width: 38,
                                height: 3,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  color: Color(0xffe0e0e0),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                PrimaryText(
                                  '${widget.data?.name ?? ''} ${widget.data?.surname ?? ''}',
                                  style: theme.textTheme.h4.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                if (_type == 2) const SizedBox(width: 4),
                                if (_type == 2) Assets.icons.bold.verify.svg(),
                              ],
                            ),
                            if (widget.data?.location != null)
                              const SizedBox(height: 12),
                            if (widget.userId == null)
                              cardContent(
                                theme,
                                router,
                                l10n,
                              )
                            else
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (userModel != null &&
                                          userModel.token != null &&
                                          userModel.token!.titleCompletion !=
                                              null &&
                                          widget.data!.title != null)
                                        buildTitle(
                                          userModel.token!,
                                          theme,
                                          themeMode
                                              ? MainColors.dark3
                                              : MainColors.grey200,
                                        ),
                                      if (userModel != null &&
                                          userModel.token != null &&
                                          userModel.token!.bioCompletion !=
                                              null &&
                                          widget.data!.bio != null)
                                        buildBio(
                                          userModel.token!,
                                          theme,
                                          themeMode
                                              ? MainColors.dark3
                                              : MainColors.grey200,
                                        ),
                                      if (userModel != null &&
                                          userModel.token != null &&
                                          userModel.token!.tagCompletion !=
                                              null &&
                                          widget
                                              .data!.tags.ext.isNotNullOrEmpty)
                                        buildTags(
                                          userModel.token!,
                                          theme,
                                          themeMode
                                              ? MainColors.dark3
                                              : MainColors.grey200,
                                          router,
                                        ),
                                      if (userModel != null &&
                                          userModel.token != null &&
                                          userModel.token!
                                                  .socialMediaCompletion !=
                                              null &&
                                          widget.data!.socialMedias.ext
                                              .isNotNullOrEmpty)
                                        buildSocialMedia(
                                          userModel.token!,
                                          theme,
                                          themeMode
                                              ? MainColors.dark3
                                              : MainColors.grey200,
                                        ),
                                    ],
                                  ),
                                  if (userModel != null &&
                                      userModel.token != null &&
                                      !(userModel.token!.bioCompletion ??
                                          false) &&
                                      widget.data!.bio != null &&
                                      !(userModel.token!.titleCompletion ??
                                          false) &&
                                      widget.data!.title != null)
                                    GestureDetector(
                                      onTap: () => router.push(
                                        ProfilEditRoute(),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: themeMode
                                              ? MainColors.dark2
                                              : Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                        child: PrimaryText(
                                          l10n.addToSee,
                                          style: theme.textTheme.bodyMedium
                                              .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            color: MainColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            if ((_type == 1 || _type == 2) &&
                                (widget.data?.isCurrentUser ?? false))
                              Column(
                                children: [
                                  Divider(
                                    thickness: 1.2,
                                    height: 24,
                                    color: theme.appColors.divider,
                                  ),
                                  currentUserBottom(router, l10n, theme),
                                ],
                              ),
                            if (_type == 0 &&
                                userModel != null &&
                                userModel.token != null &&
                                userModel.token!.userType == 0)
                              Divider(
                                thickness: 1.2,
                                height: 11,
                                color: theme.appColors.divider,
                              ),
                            if (_type == 0) const SizedBox(height: 14),
                            if (userModel != null &&
                                userModel.token != null &&
                                userModel.token!.userType == 1)
                              const SizedBox(height: 12)
                            else if (_type == 1 || _type == 2)
                              (widget.data?.isFollowed ?? false) ||
                                      (widget.data?.isCurrentUser ?? false)
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        Divider(
                                          thickness: 1.2,
                                          height: 11,
                                          color: theme.appColors.divider,
                                        ),
                                        const SizedBox(height: 14),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: context.sized.dynamicWidth(
                                                0.8,
                                              ),
                                              height: 45,
                                              child: CustomButton(
                                                text: l10n.follow,
                                                onPressed: model.addFollow,
                                                radius: 100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                            else if (widget.userId == null)
                              currentUserBottom(router, l10n, theme)
                            else if (widget.data!.isFriend!)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  showLargeMoreButton(
                                    context,
                                    theme,
                                    l10n,
                                    model,
                                  ),
                                  messageButton(theme, router),
                                ],
                              )
                            else if (widget
                                .data!.friendRequestUserToCurrentUser!)
                              Column(
                                children: [
                                  PrimaryText(
                                    l10n.acceptFriendsInfo(
                                      widget.data!.name ?? '',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium.copyWith(
                                      color: MainColors.grey600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 45,
                                        width: context.isSmallScrn ? 110 : 129,
                                        child: CustomButton(
                                          radius: 100,
                                          text: l10n.reject,
                                          onPressed: () {
                                            model.declineRequest(
                                              widget.data!.id!,
                                            );
                                          },
                                          mode: ButtonMode.dark,
                                          style: theme.textTheme.bodyMedium
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: MainColors.grey500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.isSmallScrn ? 110 : 129,
                                        height: 45,
                                        child: CustomButton(
                                          text: l10n.accept,
                                          radius: 100,
                                          onPressed: () {
                                            model
                                                .acceptRequest(widget.data!.id!)
                                                .then((value) {
                                              if (value) {
                                                ref
                                                    .watch(
                                                      profilViewModelProvider(
                                                        null,
                                                      ).notifier,
                                                    )
                                                    .incrementAcceptRequest(
                                                      widget.data!.id!,
                                                    );
                                                model.fetchProfil();
                                              } else {
                                                showToast(
                                                  context,
                                                  'Hata oluştu. Lütfen tekrar deneyin.',
                                                  type: AlertType.error,
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      messageButton(theme, router),
                                    ],
                                  ),
                                ],
                              )
                            else if (widget
                                .data!.friendRequestCurrentUserToUser!)
                              Wrap(
                                spacing: context.isSmallScrn ? 8 : 12,
                                children: <Widget>[
                                  SizedBox(
                                    width: context.sized.dynamicWidth(
                                      context.isSmallScrn ? 0.38 : 0.43,
                                    ),
                                    height: 45,
                                    child: CustomButton(
                                      text: l10n.requestSent,
                                      mode: ButtonMode.dark,
                                      side: const BorderSide(
                                        color: MainColors.primary,
                                        width: 2,
                                      ),
                                      style:
                                          theme.textTheme.bodyMedium.copyWith(
                                        color: MainColors.primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      onPressed: model.removeRequest,
                                      radius: 100,
                                    ),
                                  ),
                                  messageButton(theme, router),
                                  showMoreButton(theme, model),
                                ],
                              )
                            else
                              Wrap(
                                spacing: context.isSmallScrn ? 6 : 12,
                                runSpacing: context.isSmallScrn ? 6 : 12,
                                children: <Widget>[
                                  newFriendButton(context, model, l10n),
                                  messageButton(theme, router),
                                  showMoreButton(theme, model),
                                ],
                              ),
                          ],
                        ),
                ),
                if (_isShowMoreFriends && profilModel.recommendedData != null)
                  RandomUser(
                    data: profilModel.recommendedData ?? [],
                  ),
                const SizedBox(height: 2),
              ],
            ),
          );
  }

  Column blockCard(L10n l10n, AppTheme theme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            PrimaryText(
              '0 ${l10n.friend} ',
              style: theme.textTheme.bodyLarge.copyWith(),
            ),
            const SizedBox(width: 20),
            PrimaryText(
              '0 ${l10n.event}',
              style: theme.textTheme.bodyLarge.copyWith(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            width: 38,
            height: 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              color: Color(0xffe0e0e0),
            ),
          ),
        ),
        PrimaryText(
          '${widget.data?.name ?? ''} ${widget.data?.surname ?? ''}',
          style: theme.textTheme.h4.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        context.sized.emptySizedHeightBoxLow,
      ],
    );
  }

  Widget buildTitle(Token token, AppTheme theme, Color blurColor) {
    // titleCompletion değerine göre blur uygula veya uygulama
    return token.titleCompletion ?? false
        ? PrimaryText(
            '${widget.data?.title ?? ''}, ${widget.data?.location ?? ''}',
            style:
                theme.textTheme.bodyMedium.copyWith(color: MainColors.grey600),
          )
        : Column(
            children: [
              Blur(
                blur: 2.5,
                blurColor: blurColor,
                child: PrimaryText(
                  '${widget.data?.title ?? ''}, ${widget.data?.location ?? ''}',
                  style: theme.textTheme.bodyMedium
                      .copyWith(color: MainColors.grey600),
                ),
              ),
            ],
          );
  }

  Widget buildBio(Token token, AppTheme theme, Color blurColor) {
    // bioCompletion değerine göre blur uygula veya uygulama
    return PrimaryText(
      widget.data?.bio ?? '',
      style: theme.textTheme.bodyMedium.copyWith(color: MainColors.grey600),
    );
  }

  Widget buildTags(
    Token token,
    AppTheme theme,
    Color blurColor,
    StackRouter router,
  ) {
    // tagCompletion değerine göre blur uygula veya uygulama
    return token.tagCompletion ?? false
        ? TagChipWidget(
            tagList: widget.data!.tags ?? [],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Blur(
                blur: 2.5,
                blurColor: blurColor,
                child: TagChipWidget(
                  tagList: widget.data!.tags ?? [],
                ),
              ),
            ],
          );
  }

  Widget buildSocialMedia(Token token, AppTheme theme, Color blurColor) {
    // socialMediaCompletion değerine göre blur uygula veya uygulama
    return socialMediaLink();
  }

  SizedBox newFriendButton(
    BuildContext context,
    ProfilViewModel model,
    L10n l10n,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(context.isSmallScrn ? 0.40 : 0.43),
      height: 45,
      child: CustomButton(
        text: l10n.addFriend,
        onPressed: () {
          model.addRequest();
        },
        radius: 100,
      ),
    );
  }

  SizedBox showLargeMoreButton(
    BuildContext context,
    AppTheme theme,
    L10n l10n,
    ProfilViewModel model,
  ) {
    return SizedBox(
      width: context.dyWidth(context.isMediumScrn ? 276 : 255),
      height: 45,
      child: CustomButton(
        text: l10n.discoverNewFriends,
        startNull: true,
        bgColor: theme.mode == ThemeMode.dark
            ? MainColors.dark3
            : MainColors.grey200,
        style: theme.textTheme.bodyMedium.copyWith(
          color: _isShowMoreFriends
              ? MainColors.primary
              : (theme.mode == ThemeMode.dark
                  ? MainColors.grey50
                  : MainColors.grey600),
          fontWeight: FontWeight.w700,
        ),
        mode: ButtonMode.dark,
        onPressed: () {
          model.getUserRecommendedUsers();
          setState(() {
            _isShowMoreFriends = !_isShowMoreFriends;
          });
        },
        rightIcon: Assets.icons.light.addUser.path,
        rightIconColor: _isShowMoreFriends
            ? MainColors.primary
            : (theme.mode == ThemeMode.dark
                ? MainColors.grey50
                : MainColors.grey600),
        radius: 100,
      ),
    );
  }

  SizedBox showMoreButton(AppTheme theme, ProfilViewModel model) {
    return SizedBox(
      width: 68,
      height: 45,
      child: CustomCircleButton(
        key: const Key('addUser'),
        backgroundColor: theme.mode == ThemeMode.dark
            ? MainColors.dark3
            : MainColors.grey200,
        iconColor: _isShowMoreFriends
            ? MainColors.primary
            : (theme.mode == ThemeMode.dark
                ? MainColors.grey50
                : MainColors.grey600),
        iconPath: Assets.icons.light.addUser.path,
        onPressed: () {
          model.getUserRecommendedUsers();
          setState(() {
            _isShowMoreFriends = !_isShowMoreFriends;
          });
        },
      ),
    );
  }

  SizedBox messageButton(AppTheme theme, StackRouter router) {
    return SizedBox(
      width: 68,
      height: 45,
      child: CustomCircleButton(
        key: const Key('message'),
        backgroundColor: theme.mode == ThemeMode.dark
            ? MainColors.dark3
            : MainColors.grey200,
        iconColor: theme.mode == ThemeMode.dark
            ? MainColors.grey50
            : MainColors.grey600,
        iconPath: Assets.icons.light.message.path,
        onPressed: () {
          if (widget.data!.id != null) {
            router.push(
              ChatRoute(
                userId: widget.data!.id ?? '',
                name: widget.data!.name ?? '',
                imageUrl: widget.data!.images!.first.downloadUrl!,
                isOnline: false,
              ),
            );
          }
        },
      ),
    );
  }

  Column cardContent(
    AppTheme theme,
    StackRouter router,
    L10n l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.data?.title != null)
          PrimaryText(
            '${widget.data?.title ?? ''}, ${widget.data?.location ?? ''}',
            style:
                theme.textTheme.bodyMedium.copyWith(color: MainColors.grey600),
          ),
        if (widget.data?.title != null) const SizedBox(height: 12),
        if (widget.data?.bio != null)
          PrimaryText(
            widget.data?.bio ?? '',
            style:
                theme.textTheme.bodyMedium.copyWith(color: MainColors.grey600),
          ),
        if (widget.data?.bio != null) const SizedBox(height: 10),
        TagChipWidget(
          tagList: widget.data!.tags ?? [],
        ),
      ],
    );
  }

  Row currentUserBottom(StackRouter router, L10n l10n, AppTheme theme) {
    return Row(
      children: [
        if (widget.data!.socialMedias != null) socialMediaLink(),
        const SizedBox(width: 12),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            router.push(
              ProfilEditRoute(
                profilScrollPosition: ProfilScrollPosition.bottom,
              ),
            );
          },
          child: Assets.icons.curved.plus.svg(
            width: 24,
            height: 24,
            color: MainColors.grey400,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            router.push(ProfilEditRoute());
          },
          child: Container(
            width: 90,
            height: 28,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0x1f757575),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Assets.icons.light.editSquare.svg(
                  width: 16,
                  height: 16,
                  color: MainColors.grey400,
                ),
                const SizedBox(width: 8),
                PrimaryText(
                  l10n.edit,
                  style: theme.textTheme.bodySmall.copyWith(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Wrap socialMediaLink() {
    return Wrap(
      spacing: 12,
      children: widget.data!.socialMedias!
          .map(
            (e) => InkWell(
              onTap: () {
                launchUrls(e.url!);
              },
              child: SvgPicture.asset(
                e.icon!,
                width: 24,
                height: 24,
              ),
            ),
          )
          .toList(),
    );
  }
}
