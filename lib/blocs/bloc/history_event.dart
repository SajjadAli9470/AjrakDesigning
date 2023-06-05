// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_bloc.dart';

abstract class HistoryEvent {
  const HistoryEvent();
}

class add_history extends HistoryEvent {
  final History history;
  add_history({
    required this.history,
  });


}

class Selected_item extends HistoryEvent{
  final int selected_item;

  Selected_item(this.selected_item);
}

