import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/data/repository/create_event_repository.dart';
import 'package:togodo/data/repository/create_event_repository_impl.dart';

import '../../../data/model/profil/profil_model.dart';

part 'ready_template_view_model.freezed.dart';

final readyTemplateViewModelProvider = StateNotifierProvider.autoDispose<
    ReadyTemplateViewModel, ReadyTemplateState>(
  ReadyTemplateViewModel.new,
);

@freezed
class ReadyTemplateState with _$ReadyTemplateState {
  const factory ReadyTemplateState({
    @Default([]) List<ReadyTemplateModel> data,
    @Default(null) Map<int, List<ReadyTemplateModel>>? groupedData,
    @Default(0) int pagination,
    @Default(false) bool loading,
    @Default(false) bool dataLoading,
  }) = _ReadyTemplateState;
}

class ReadyTemplateViewModel extends StateNotifier<ReadyTemplateState> {
  ReadyTemplateViewModel(this._ref) : super(const ReadyTemplateState()) {
    fetchTemplate();
  }

  bool _isDisposed = false;
  // ignore: unused_field
  final Ref _ref;
  late final CreateEventRepository _repository =
      _ref.read(createEventRepositoryProvider);
  String getTagName(int id, List<TagsModel> tags) {
    var name = '';
    for (final i in tags) {
      if (i.id == id) {
        name = i.name ?? '';
        break;
      } else {
        if (true == i.subTags?.isNotEmpty) {
          for (final k in i.subTags!) {
            if (k.id == id) {
              name = k.name ?? '';
              break;
            }
          }
        }
      }
    }
    return name;
  }

  Future<void> fetchTemplate() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getTemplateList();
    if (result.isSuccess) {
      if (_isDisposed) return;
      final templates = result.dataOrThrow;
      final groupedData = groupTemplatesByTags(templates);
      state = state.copyWith(
        data: result.dataOrThrow,
        groupedData: groupedData,
        pagination: 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

// Tags modelinin 'name' özelliğine göre gruplama yapar ve sonuçları döndürür
  Map<int, List<ReadyTemplateModel>> groupTemplatesByTags(
    List<ReadyTemplateModel> templates,
  ) {
    final groupedTemplates = <int, List<ReadyTemplateModel>>{};
    groupedTemplates[204] = [];
    groupedTemplates[1] = [];
    groupedTemplates[18] = [];
    groupedTemplates[12] = [];
    groupedTemplates[13] = [];

    for (final template in templates) {
      final tagName = template.sortTag ?? 0;
      if (groupedTemplates.containsKey(tagName)) {
        groupedTemplates[tagName]!.add(template);
      } else {
        groupedTemplates[tagName] = [template];
      }
    }

    return groupedTemplates;
  }

  void loading() {
    state = state.copyWith(
      dataLoading: !state.dataLoading,
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
