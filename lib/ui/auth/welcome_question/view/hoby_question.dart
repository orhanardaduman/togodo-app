import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/ui/auth/welcome_question/welcome_question_modelview.dart';
import 'package:togodo/ui/auth/welcome_question/widget/hoby_multi_select.dart';
import 'package:togodo/ui/auth/welcome_question/widget/question_base.dart';

@RoutePage()
class HobyQuestionPage extends StatefulHookConsumerWidget {
  const HobyQuestionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HobyQuestionPageState();
}

class _HobyQuestionPageState extends ConsumerState<HobyQuestionPage> {
  int index = 0;
  @override
  void initState() {
    initIndex();
    super.initState();
  }

  Future<void> initIndex() async {
    index = await CacheItems.signType.readSecureData() == 'authOtp' ? 0 : 1;
    if (index == 0) {
      await ref.read(welcomeQuestionModelProvider.notifier).init();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final model = ref.watch(welcomeQuestionModelProvider);
    final modelNot = ref.read(welcomeQuestionModelProvider.notifier);

    final ln10 = useL10n();
    return QuestionBase(
      title: ln10.hoby_title,
      index: index,
      subtitle: ln10.hoby_sub,
      buttonWidget: CustomButton(
        text: ln10.go,
        onPressed: model.hobyList.isEmpty
            ? null
            : () async {
                await router.push(const UserImageQuestionRoute());
              },
      ),
      child: HobyPositionMultiSelect(
        onTap: modelNot.updateHoby,
      ),
    );
  }
}
