import '../../../../data/model/event/event_details_model.dart';
import '../../../../data/model/event/event_model.dart';

class UserGroupsModel {
  late String? id;
  late EventDetailsModel? eventDetailsModel;
  late EventGroups? groups;

  UserGroupsModel(
    this.id,
    this.eventDetailsModel,
    this.groups,
  );

  factory UserGroupsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      UserGroupsModel(
        (json['id'] ?? '') as String,
        EventDetailsModel.fromJson(
          (json["event"] ?? {}) as Map<String, dynamic>,
        ),
        json["eventGroups"] != null
            ? EventGroups.fromJson(
                (json["eventGroups"]) as Map<String, dynamic>,
              )
            : null,
      );
}

class UserGroupsListModel {
  late List<UserGroupsModel> matches;
  UserGroupsListModel(this.matches);

  factory UserGroupsListModel.fromJson(
    List<dynamic> json,
  ) =>
      UserGroupsListModel(
        json
            .map((e) => UserGroupsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
