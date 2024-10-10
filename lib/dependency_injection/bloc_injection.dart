import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:togodo/ui/group/bloc/group_bloc.dart';
import 'package:togodo/ui/profile/user_groups/bloc/user_groups_bloc.dart';

class BlocInjection {
  List<SingleChildWidget> blocs = [
    BlocProvider(
      create: (_) => GroupBloc(),
    ),
    BlocProvider(
      create: (_) => UserGroupsBloc(),
    ),
  ];
}
