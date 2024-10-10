import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/pexels_model.dart';
import 'package:togodo/gen/assets.gen.dart';

class PexelsApiClient {
  PexelsApiClient() {
    _dio.options.baseUrl = 'https://api.pexels.com/v1';
    _dio.options.headers = {
      // 'Authorization': 'Bearer ${dotenv.env['PEXELS_API_KEY']}',
      'Authorization':
          'jC05uuhZk4YcVNYAAEytPif95oLXgmyU5LnmXLC1ulp7O0NTUXlQmRA3',
    };
  }
  final Dio _dio = Dio();

  Future<PexelsModel?> searchSinger(String query) async {
    try {
      if (query.isEmpty) {
        return null;
      }
      final response = await _dio.get<dynamic>(
        '/search',
        queryParameters: {
          'query': query,
          'locale': 'tr-TR',
        },
      );
      if (response.statusCode == 200) {
        return PexelsModel.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    return null;
  }
}

final pexelSearchProvider = FutureProvider.autoDispose
    .family<PexelsModel?, String>((ref, keyword) async {
  final model = ref.read(pexelsApiClientProvider);
  return model.searchSinger(keyword);
});

final pexelsApiClientProvider = Provider<PexelsApiClient>((ref) {
  return PexelsApiClient();
});

class PexelsFindEvent extends StatefulHookConsumerWidget {
  const PexelsFindEvent({
    this.userId,
    super.key,
    this.isRoute = false,
  });
  final bool isRoute; // false = Chat, true = User Profile
  final String? userId;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _PexelsFindEventState();
}

class _PexelsFindEventState extends ConsumerState<PexelsFindEvent> {
  final keywordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    keywordController.addListener(onKeywordChanged);
  }

  void onKeywordChanged() {
    if (keywordController.text.isNotEmpty) {
      setState(() {});
    }
  }

  void clearTextField() {
    keywordController.clear();
  }

  @override
  void dispose() {
    keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: l10n.search,
          controller: keywordController,
          prefixIcon: Assets.icons.light.search.path,
        ),
        const SizedBox(height: 17.5),
        usersContent(router, theme),
      ],
    );
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture =
            ref.watch(pexelSearchProvider(keywordController.text));

        return userSearchFuture.when(
          data: (users) {
            return users != null && users.photos!.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: users.photos!.map(
                        (element) {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  height: 165.3,
                                  width: 107.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.6),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        element.src!.portrait!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.sized.dynamicWidth(0.6),
                          child: PrimaryText(
                            'Arama yaptıkça burada kişileri ve etkinlikleri bulabilirsin',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              color: MainColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
          loading: SizedBox.fromSize,
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}
