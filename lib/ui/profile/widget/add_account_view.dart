import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/component/button/custom_button.dart';
import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/hook/use_router.dart';
import '../../../core/route/app_route.gr.dart';
import '../../../core/theme/app_text_theme.dart';

class AddAccountView extends StatefulHookConsumerWidget {
  const AddAccountView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends ConsumerState<AddAccountView> {
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final router = useRouter();

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.3,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 38,
                height: 3,
                color: Color(0xFFFE0E0E0),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryText(
                l10n.addAccount,
                style: AppTextTheme().h4.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 1,
                color: Color(0xFFF35383F),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: CustomButton(
                  maxWidthTextContainer: MediaQuery.of(context).size.width * .9,
                  onPressed: () {
                    Navigator.pop(context);
                    router.push(
                      const SigninRoute(),
                    );
                  },
                  text: l10n.signinWithAccount,
                  style: AppTextTheme().bodyXLarge.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      router.push(
                        const SignupRoute(),
                      );
                    },
                    child: PrimaryText(
                      l10n.createNewAccount,
                      style: AppTextTheme().bodyXLarge.copyWith(
                            color: MainColors.primary,
                          ),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
