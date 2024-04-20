import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

class ContainerWithLoading extends ConsumerWidget {
  const ContainerWithLoading({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loadingStateProvider);
    return Stack(
      children: [
        child,
        if (state.isLoading) const Loading() else const SizedBox(),
      ],
    );
  }
}
