import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/user_groups_network.dart';
import 'user_groups_events.dart';
import 'user_groups_states.dart';

class UserGroupsBloc extends Bloc<UserGroupsEvents, UserGroupsStates> {
  UserGroupsBloc() : super(UserGroupsLoading()) {
    on<GetUserGroups>(
      (event, emit) async {
        emit(UserGroupsLoading());
        //  try {
        final response = await api.getUserGroups(
          event.id,
        );
        if (response != null) {
          emit(UserGroupsLoaded(response));
        } else {
          emit(UserGroupsFailed("Beklenmedik bir hata ile karşılaşıldı"));
        }
        //} catch (e) {
        //  emit(UserGroupsFailed("Beklenmedik bir hata ile karşılaşıldı"));
        //}
      },
    );
  }
  var api = UserGroupsNetwork();
}
