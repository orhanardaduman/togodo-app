import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/group_network.dart';
import 'group_events.dart';
import 'group_states.dart';

class GroupBloc extends Bloc<GroupEvents, GroupStates> {
  var api = GroupNetwork();

  GroupBloc() : super(GroupLoading()) {
    on<GetGroup>(
      (event, emit) async {
        emit(GroupLoading());
        // try {
        if(event.id != null){
          final response = await api.getGroup(event.id!);
          if (response != null) {
            emit(GroupLoaded(response));
          } else {
            emit(GroupFailed("Beklenmedik bir hata ile karşılaşıldı"));
          }
        }

        //} catch (e) {
        //  emit(GroupFailed("Beklenmedik bir hata ile karşılaşıldı"));
        //}
      },
    );
  }
}
