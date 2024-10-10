import 'package:togodo/core/network/api/app_dio.dart';

import '../model/group_model.dart';

class GroupNetwork {
  Future<GroupModel?> getGroup(
    String groupId,
  ) async {
    final dio = AppDio.getInstance();
    final response = await dio
        .get("Event/EventGroup", queryParameters: {"groupId": groupId});
    if (response.statusCode == 200) {
      return GroupModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}
