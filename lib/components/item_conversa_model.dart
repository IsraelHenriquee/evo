import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_conversa_widget.dart' show ItemConversaWidget;
import 'package:flutter/material.dart';

class ItemConversaModel extends FlutterFlowModel<ItemConversaWidget> {
  ///  Local state fields for this component.

  String titulo = '-';

  String foto = '-';

  int? contador = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Group Find by JID)] action in itemConversa widget.
  ApiCallResponse? outGrupo;
  // Stores action output result for [Backend Call - API (Chat Fetch Profile Picture URL)] action in itemConversa widget.
  ApiCallResponse? outFoto;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
