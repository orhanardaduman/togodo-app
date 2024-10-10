import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/model/event/event_model.dart';

class GroupModel {
  GroupModel(
    this.detailModel,
    this.users,
  );

  factory GroupModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupModel(
        GroupDetailModel.fromJson(
          (json['detail']) as Map<String, Object?>,
        ),
        (json['users'] as List<dynamic>)
            .map(
              (e) => GroupUsersModel.fromJson(e as Map<String, Object?>),
            )
            .toList(),
      );
  late GroupDetailModel detailModel;
  List<GroupUsersModel>? users;
}

class GroupDetailModel {
  GroupDetailModel(
    this.id,
    this.eventModel,
  );

  factory GroupDetailModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupDetailModel(
        (json['id'] ?? '') as String,
        EventDetailsModel.fromJson(
          (json['event'] ?? {}) as Map<String, Object?>,
        ),
      );
  late String id;
  late EventDetailsModel eventModel;
}

class GroupUsersModel {
  GroupUsersModel(
    this.isFriend,
    this.userModel,
  );

  factory GroupUsersModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupUsersModel(
        (json['isFriend'] ?? false) as bool,
        GroupRequestDetail.fromJson(
          (json['data']) as Map<String, Object?>,
        ),
      );
  late bool isFriend;
  late GroupRequestDetail userModel;
}

class GroupDetailModelForDialog {
  GroupDetailModelForDialog(
    this.id,
    this.eventGroupsId,
    this.eventModel,
    this.users,
  );

  factory GroupDetailModelForDialog.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupDetailModelForDialog(
        (json['id'] ?? '') as String,
        (json['eventGroupsId'] ?? '') as String,
        EventDetailsModel.fromJson(
          (json['event'] ?? {}) as Map<String, Object?>,
        ),
        (json['eventGroups']["requests"] as List<dynamic>)
            .map(
              (e) => GroupRequestDetail.fromJson(e as Map<String, Object?>),
            )
            .toList(),
      );
  late String id, eventGroupsId;
  late EventDetailsModel eventModel;
  late List<GroupRequestDetail> users;
}
