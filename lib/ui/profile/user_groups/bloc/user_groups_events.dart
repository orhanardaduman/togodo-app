abstract class UserGroupsEvents {}

class GetUserGroups extends UserGroupsEvents {
  final String id;
  GetUserGroups(this.id);
}
