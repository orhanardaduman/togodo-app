import '../model/user_groups_model.dart';

abstract class UserGroupsStates {}

class UserGroupsLoading extends UserGroupsStates {}

class UserGroupsLoaded extends UserGroupsStates {
  final UserGroupsListModel? model;
  UserGroupsLoaded(this.model);
}

class UserGroupsFailed extends UserGroupsStates {
  final String text;
  UserGroupsFailed(this.text);
}
