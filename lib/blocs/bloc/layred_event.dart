// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'layred_bloc.dart';

abstract class LayredEvent {
  const LayredEvent();
}

class all_layers extends LayredEvent {
  final List<LayeredWidget> layredList;

  all_layers({required this.layredList});
}

class add_layer extends LayredEvent {
  final LayeredWidget layer;

  add_layer({required this.layer});
}

class delete_layer extends LayredEvent {
  final int layer_id;

  delete_layer({required this.layer_id});
}

class modified_layer extends LayredEvent {
  final LayeredWidget layer;
  modified_layer({required this.layer});
}

class layer_up extends LayredEvent {
  final int id;
  layer_up({
    required this.id,
  });
  
}
class layer_down extends LayredEvent {
  final int id;
  layer_down({
    required this.id,
  });
  
}