import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/ui/group/bloc/group_bloc.dart';
import 'package:togodo/ui/group/bloc/group_events.dart';
import 'package:togodo/ui/group/bloc/group_states.dart';
import 'package:togodo/ui/group/view_model/event_group_detail_view_model.dart';

import '../../../core/component/custom_app_bar.dart';
import '../../../core/component/loading/loading.dart';
import '../../../data/model/event/event_details_model.dart';
import '../widgets/empty_group_view.dart';
import '../widgets/group_widget.dart';

@RoutePage()
class GroupPage extends StatefulHookConsumerWidget {
  const GroupPage({required this.id, this.eventModel, super.key});
  final String id;
  final EventDetailsModel? eventModel;

  @override
  ConsumerState<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends ConsumerState<GroupPage> {
  late GroupBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<GroupBloc>();
    print("event group id : " + widget.id);

    if (widget.id != '') {
      bloc.add(GetGroup(widget.id));
      SchedulerBinding.instance.addPostFrameCallback((_) {
        listenMessage();
      });
    }
  }

  Future<void> listenMessage() async {
    final readModel = ref.read(eventGroupDetailsProvider(widget.id).notifier);

    await readModel.connect();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: l10n.groupDetails),
        body: widget.id == ""
            ? EmptyGroupView(
                eventModel: widget.eventModel,
              )
            : BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GroupLoaded) {
                    return SafeArea(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GroupWidget(
                          model: state.model,
                        ),
                      ),
                    );
                  } else if (state is GroupFailed) {
                    return const Expanded(child: Loading());
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
      ),
    );
  }
}
