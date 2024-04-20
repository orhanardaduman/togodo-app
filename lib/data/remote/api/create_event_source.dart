import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/event/discovery_map_model.dart';
import 'package:togodo/data/model/event/discovery_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';

part 'create_event_source.g.dart';

final createEventSourceProvider = Provider(CreateEventSource.new);

@RestApi()
abstract class CreateEventSource {
  factory CreateEventSource(ProviderRef<dynamic> ref) =>
      _CreateEventSource(ref.read(dioProvider));

  @GET('User/GetUserDraftEvents')
  Future<List<EventModel>> getCreateEvent({
    @Query('pagination') int? pagination,
  });
  @GET('Event/GetTemplateList')
  Future<List<ReadyTemplateModel>> getTemplateList();

  @GET('Discover/GetDiscoverEvents')
  Future<List<DiscoveryModel>> getDiscoverEvents({
    @Query('tagId') int? tagId,
  });
  @GET('Search/GetSearchUserWithEvents')
  Future<List<UserSearchWithEvents>> getUserSearchWithEvents({
    @Query('keyword') String? keyword,
  });
  @GET('Discover/GetDiscoverEventsMap')
  Future<List<DiscoveryMapModel>> getDiscoverEventsMap({
    @Query('city') String? city,
  });
  @POST('Search/SaveSearch')
  Future<dynamic> saveSearch(
    @Body() Map<String, dynamic> data,
  );
  @POST('Setting/RemoveSearchHistory')
  Future<dynamic> removeSearchHistory(
    @Body() Map<String, dynamic> data,
  );
}
