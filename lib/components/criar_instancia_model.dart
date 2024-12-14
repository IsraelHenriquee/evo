import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'criar_instancia_widget.dart' show CriarInstanciaWidget;
import 'package:flutter/material.dart';

class CriarInstanciaModel extends FlutterFlowModel<CriarInstanciaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Create Instance)] action in IconButton widget.
  ApiCallResponse? outInstancia;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  InstanciasRow? outSupaInstancia;
  // Stores action output result for [Backend Call - API (Webhook Set)] action in IconButton widget.
  ApiCallResponse? outWebhook;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
