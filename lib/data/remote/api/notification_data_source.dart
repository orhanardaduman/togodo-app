import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/notification/notification_model.dart';

part 'notification_data_source.g.dart';

final notificationDataSourceProvider = Provider(NotificationDataSource.new);

@RestApi()
abstract class NotificationDataSource {
  factory NotificationDataSource(ProviderRef<dynamic> ref) =>
      _NotificationDataSource(ref.read(dioProvider));

  @GET('User/GetUserNotification')
  Future<List<NotificationModel>> getUserNotification({
    @Query('pagination') int? pagination,
  });
  @POST('Event/AcceptRequest')
  Future<dynamic> acceptRequest(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/DeclineRequest')
  Future<dynamic> declineRequest(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/AcceptInvite')
  Future<dynamic> acceptInvite(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/DeclineInvite')
  Future<dynamic> declineInvite(
    @Body() Map<String, dynamic> data,
  );
}
