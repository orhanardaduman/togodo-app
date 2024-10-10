import '../model/group_model.dart';

abstract class GroupStates {}

class GroupLoading extends GroupStates {}

class GroupLoaded extends GroupStates {
  final GroupModel? model;
  GroupLoaded(this.model);
}

class GroupFailed extends GroupStates {
  final String text;
  GroupFailed(this.text);
}
