import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_instancia_widget.dart' show MenuInstanciaWidget;
import 'package:flutter/material.dart';

class MenuInstanciaModel extends FlutterFlowModel<MenuInstanciaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Stores action output result for [Backend Call - API (Instance Logout)] action in Container widget.
  ApiCallResponse? outDesconect;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // Stores action output result for [Backend Call - API (Instance Delete)] action in Container widget.
  ApiCallResponse? outDelete;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Container widget.
  List<InstanciasRow>? outSupaDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
