import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/discovery_map_model.dart';
import 'package:togodo/data/model/event/discovery_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/remote/api/create_event_source.dart';
import 'package:togodo/data/repository/create_event_repository.dart';

final createEventRepositoryProvider = Provider(CreateEventRepositoryImpl.new);

class CreateEventRepositoryImpl implements CreateEventRepository {
  CreateEventRepositoryImpl(this._reader);

  final ProviderRef<dynamic> _reader;

  late final CreateEventSource _dataSource =
      _reader.read(createEventSourceProvider);

  @override
  Future<Result<List<EventModel>>> getCreateEvent({
    int? pagination,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getCreateEvent(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<ReadyTemplateModel>>> getTemplateList() {
    return Result.guardFuture(
      () async => _dataSource.getTemplateList(),
    );
  }

  @override
  Future<Result<List<DiscoveryModel>>> getDiscoverEvents({
    int? tagId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getDiscoverEvents(
        tagId: tagId,
      ),
    );
  }

  @override
  Future<Result<List<DiscoveryMapModel>>> getDiscoverEventsMap({
    String? city,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getDiscoverEventsMap(
        city: city,
      ),
    );
  }

  @override
  Future<Result<void>> saveSearch({
    String? userId,
    String? eventId,
    String? keyword,
  }) {
    return Result.guardFuture(
      () async => _dataSource.saveSearch(
        {
          'userId': userId,
          'eventId': eventId,
          'keyword': keyword,
        },
      ),
    );
  }

  @override
  Future<Result<List<UserSearchWithEvents>>> getUserSearchWithEvents(
    String? keyword,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserSearchWithEvents(
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<void>> removeSearchHistory() {
    return Result.guardFuture(
      () async => _dataSource.removeSearchHistory(
        {},
      ),
    );
  }
}
