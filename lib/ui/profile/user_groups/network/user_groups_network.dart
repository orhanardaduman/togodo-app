import 'package:togodo/core/network/api/app_dio.dart';

import '../model/user_groups_model.dart';

class UserGroupsNetwork {
  Future<UserGroupsListModel?> getUserGroups(
    String id,
  ) async {
    final dio = AppDio.getInstance();
    final response =
        await dio.get("Event/UserEventGroups", queryParameters: {"userId": id});
    print(response.data);
    if (response.statusCode == 200) {
      return UserGroupsListModel.fromJson(response.data as List<dynamic>);
    } else {
      return null;
    }
  }
}
