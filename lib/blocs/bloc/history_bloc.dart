import 'package:bloc/bloc.dart';

import '../../model/history_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState(histroyList: [])) {
    on<add_history>((event, emit) {
      emit(HistoryState(histroyList: state.histroyList..add(event.history)));
    });
   
  }
}
