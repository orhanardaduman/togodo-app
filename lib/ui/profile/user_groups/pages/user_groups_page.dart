import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togodo/ui/profile/user_groups/bloc/user_groups_events.dart';

import '../../../../core/component/loading/loading.dart';
import '../bloc/user_groups_bloc.dart';
import '../bloc/user_groups_states.dart';
import '../widgets/user_groups_widget.dart';

class UserGroupsPage extends StatefulWidget {
  const UserGroupsPage({required this.id, super.key});
  final String? id;

  @override
  State<UserGroupsPage> createState() => _UserGroupsPageState();
}

class _UserGroupsPageState extends State<UserGroupsPage> {
  late UserGroupsBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<UserGroupsBloc>();
    bloc.add(
      GetUserGroups(
        widget.id ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is UserGroupsLoaded) {
          return UserGroupsWidget(
            models: state.model,
          );
        } else if (state is UserGroupsLoading) {
          return const Center(child: Loading());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
