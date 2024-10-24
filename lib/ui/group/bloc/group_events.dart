abstract class GroupEvents {}

class GetGroup extends GroupEvents {
  final String? id;
  GetGroup(this.id);
}
