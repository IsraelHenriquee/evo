import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/instancias_widget.dart';
import '/components/item_conversa_widget.dart';
import '/components/menu_lateral_widget.dart';
import '/components/usuarios_widget.dart';
import '/components/visualizar_media_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'whats_widget.dart' show WhatsWidget;
import 'package:flutter/material.dart';

class WhatsModel extends FlutterFlowModel<WhatsWidget> {
  ///  Local state fields for this page.

  InstanciaStruct? instancia;
  void updateInstanciaStruct(Function(InstanciaStruct) updateFn) {
    updateFn(instancia ??= InstanciaStruct());
  }

  List<ConversasStruct> messages = [];
  void addToMessages(ConversasStruct item) => messages.add(item);
  void removeFromMessages(ConversasStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, ConversasStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(ConversasStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  int? contador = 0;

  String remoteJid = '-';

  String nome = '-';

  String foto = '-';

  ConversasStruct? tempMessage;
  void updateTempMessageStruct(Function(ConversasStruct) updateFn) {
    updateFn(tempMessage ??= ConversasStruct());
  }

  bool chatAtivo = true;

  FFUploadedFile? file;

  int tipoMedia = 1;

  int? menu = 1;

  double? numero = 0.0;

  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Users)] action in whats widget.
  ApiCallResponse? outUser;
  // Stores action output result for [Backend Call - API (Send Plain Text)] action in whats widget.
  ApiCallResponse? outSend;
  // Model for menuLateral component.
  late MenuLateralModel menuLateralModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Models for itemConversa dynamic component.
  late FlutterFlowDynamicModels<ItemConversaModel> itemConversaModels;
  // Stores action output result for [Backend Call - API (Get Messages)] action in itemConversa widget.
  ApiCallResponse? outMessages;
  // Model for instancias component.
  late InstanciasModel instanciasModel;
  // Stores action output result for [Backend Call - API (Instance Fetch)] action in instancias widget.
  ApiCallResponse? outInstancia;
  // Model for usuarios component.
  late UsuariosModel usuariosModel;
  // Model for visualizarMedia component.
  late VisualizarMediaModel visualizarMediaModel;
  // State field(s) for txtMensagem widget.
  FocusNode? txtMensagemFocusNode;
  TextEditingController? txtMensagemTextController;
  String? Function(BuildContext, String?)? txtMensagemTextControllerValidator;

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    menuLateralModel = createModel(context, () => MenuLateralModel());
    itemConversaModels = FlutterFlowDynamicModels(() => ItemConversaModel());
    instanciasModel = createModel(context, () => InstanciasModel());
    usuariosModel = createModel(context, () => UsuariosModel());
    visualizarMediaModel = createModel(context, () => VisualizarMediaModel());
  }

  @override
  void dispose() {
    menuLateralModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    itemConversaModels.dispose();
    instanciasModel.dispose();
    usuariosModel.dispose();
    visualizarMediaModel.dispose();
    txtMensagemFocusNode?.dispose();
    txtMensagemTextController?.dispose();
  }

  /// Action blocks.
  Future getConversas(BuildContext context) async {
    ApiCallResponse? outConversas;
    ApiCallResponse? outPushName;

    await Future.wait([
      Future(() async {
        outConversas = await SupabaseGroup.getConversasCall.call(
          connectedPhone: 'eq.${instancia?.ownerJid}',
        );

        if ((outConversas?.succeeded ?? true)) {
          FFAppState().appConversas = ((outConversas?.jsonBody ?? '')
                  .toList()
                  .map<ConversasStruct?>(ConversasStruct.maybeFromMap)
                  .toList() as Iterable<ConversasStruct?>)
              .withoutNulls
              .toList()
              .cast<ConversasStruct>();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Erro ao buscar conversas: ${(outConversas?.jsonBody ?? '').toString()}',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
      Future(() async {
        outPushName = await SupabaseGroup.getPushNameCall.call(
          connectedPhone: 'eq.${instancia?.ownerJid}',
        );

        if ((outPushName?.succeeded ?? true)) {
          FFAppState().appLastSender = ((outPushName?.jsonBody ?? '')
                  .toList()
                  .map<ConversasStruct?>(ConversasStruct.maybeFromMap)
                  .toList() as Iterable<ConversasStruct?>)
              .withoutNulls
              .toList()
              .cast<ConversasStruct>();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Erro ao buscar PushName: ${(outPushName?.jsonBody ?? '').toString()}',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
    ]);
  }
}
