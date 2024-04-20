import 'package:togodo/data/model/event/discovery_map_model.dart';
import 'package:togodo/data/model/event/discovery_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';
import 'package:togodo/data/model/result.dart';

abstract class CreateEventRepository {
  Future<Result<List<EventModel>>> getCreateEvent({
    int? pagination,
  });
  Future<Result<List<ReadyTemplateModel>>> getTemplateList();
  Future<Result<List<DiscoveryModel>>> getDiscoverEvents({
    int? tagId,
  });
  Future<Result<List<DiscoveryMapModel>>> getDiscoverEventsMap({
    String? city,
  });
  Future<Result<List<UserSearchWithEvents>>> getUserSearchWithEvents(
    String? keyword,
  );
  Future<Result<void>> saveSearch({
    String? userId,
    String? eventId,
    String? keyword,
  });
  Future<Result<void>> removeSearchHistory();
}
