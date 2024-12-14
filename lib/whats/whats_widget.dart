import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/instancias_widget.dart';
import '/components/item_conversa_widget.dart';
import '/components/item_mensagem_widget.dart';
import '/components/menu_lateral_widget.dart';
import '/components/menu_media_widget.dart';
import '/components/usuarios_widget.dart';
import '/components/visualizar_media_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'whats_model.dart';
export 'whats_model.dart';

class WhatsWidget extends StatefulWidget {
  const WhatsWidget({super.key});

  @override
  State<WhatsWidget> createState() => _WhatsWidgetState();
}

class _WhatsWidgetState extends State<WhatsWidget>
    with TickerProviderStateMixin {
  late WhatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhatsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {}),
        Future(() async {
          await actions.realtime(
            (linha) async {
              _model.tempMessage = ConversasStruct.maybeFromMap(linha);
              _model.contador = 0;
              safeSetState(() {});
              if (_model.tempMessage?.connectedPhone ==
                  _model.instancia?.ownerJid) {
                if (_model.tempMessage?.evento == 'messages.upsert') {
                  // Atualiza Messges
                  _model.addToMessages(_model.tempMessage!);
                  safeSetState(() {});
                } else {
                  if (_model.tempMessage?.messagetype == 'conversation') {
                    while (_model.contador! < _model.messages.length) {
                      if (_model.messages
                              .elementAtOrNull(_model.contador!)
                              ?.metadado ==
                          _model.tempMessage?.conversation) {
                        // Remove mensagem temporaria
                        _model.removeAtIndexFromMessages(_model.contador!);
                        safeSetState(() {});
                        _model.addToMessages(_model.tempMessage!);
                        safeSetState(() {});
                        break;
                      } else {
                        _model.contador = _model.contador! + 1;
                        safeSetState(() {});
                      }
                    }
                  } else {
                    _model.addToMessages(_model.tempMessage!);
                    safeSetState(() {});
                  }

                  _model.contador = 0;
                  safeSetState(() {});
                }

                while (_model.contador! < FFAppState().appConversas.length) {
                  if (FFAppState()
                          .appConversas
                          .elementAtOrNull(_model.contador!)
                          ?.remotejid ==
                      _model.tempMessage?.remotejid) {
                    // Atualiza appConversa
                    FFAppState().updateAppConversasAtIndex(
                      _model.contador!,
                      (e) => e
                        ..messagetimestamp =
                            _model.tempMessage?.messagetimestamp
                        ..conversation = _model.tempMessage?.conversation
                        ..messagetype = _model.tempMessage?.messagetype,
                    );
                    safeSetState(() {});
                    break;
                  } else {
                    _model.contador = _model.contador! + 1;
                    safeSetState(() {});
                  }
                }
                if (_model.contador == FFAppState().appConversas.length) {
                  FFAppState().addToAppConversas(_model.tempMessage!);
                  safeSetState(() {});
                }
              } else {
                return;
              }
            },
            'evo_messages',
          );
        }),
        Future(() async {
          _model.outUser = await SupabaseGroup.getUsersCall.call(
            userId: 'eq.$currentUserUid',
            jwt: currentJwtToken,
          );

          if ((_model.outUser?.succeeded ?? true)) {
            FFAppState().appNome = valueOrDefault<String>(
              SupabaseGroup.getUsersCall.nome(
                (_model.outUser?.jsonBody ?? ''),
              ),
              '-',
            );
            FFAppState().appAdmin = SupabaseGroup.getUsersCall.admin(
              (_model.outUser?.jsonBody ?? ''),
            )!;
            safeSetState(() {});
          }
        }),
      ]);
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.txtMensagemTextController ??= TextEditingController();
    _model.txtMensagemFocusNode ??= FocusNode();

    animationsMap.addAll({
      'itemConversaOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'itemMensagemOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Shortcuts(
      shortcuts: {
        const SingleActivator(
          LogicalKeyboardKey.enter,
        ): VoidCallbackIntent(() async {
          unawaited(
            () async {
              _model.outSend = await InstancesGroup.sendPlainTextCall.call(
                number: _model.remoteJid,
                text: functions.formatWhatsAppMessage(FFAppState().appNome,
                    _model.txtMensagemTextController.text),
                token: _model.instancia?.token,
                instance: _model.instancia?.name,
              );
            }(),
          );
          _model.addToMessages(ConversasStruct(
            remotejid: _model.remoteJid,
            messagetype: 'conversation',
            connectedPhone: _model.instancia?.ownerJid,
            metadado: functions.formatWhatsAppMessage(
                FFAppState().appNome, _model.txtMensagemTextController.text),
            conversation: functions.formatWhatsAppMessage(
                FFAppState().appNome, _model.txtMensagemTextController.text),
            messagetimestamp: valueOrDefault<int>(
              getCurrentTimestamp.secondsSinceEpoch,
              0,
            ),
            fromme: true,
            messageid: random_data.randomString(
              5,
              5,
              true,
              true,
              true,
            ),
          ));
          safeSetState(() {});
          safeSetState(() {
            _model.txtMensagemTextController?.text = '';
            _model.txtMensagemFocusNode?.requestFocus();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _model.txtMensagemTextController?.selection =
                  TextSelection.collapsed(
                offset: _model.txtMensagemTextController!.text.length,
              );
            });
          });

          safeSetState(() {});
        }),
      },
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
            autofocus: isShortcutsSupported,
            focusNode: _model.shortcutsFocusNode,
            child: GestureDetector(
              onTap: () {
                if (isShortcutsSupported &&
                    _model.shortcutsFocusNode.canRequestFocus) {
                  FocusScope.of(context)
                      .requestFocus(_model.shortcutsFocusNode);
                } else {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).zAPcinza,
                body: SafeArea(
                  top: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.menuLateralModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuLateralWidget(
                          acao: (varMenu) async {
                            _model.menu = varMenu;
                            safeSetState(() {});
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.menu == 1) {
                            return Container(
                              width: 434.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 64.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFAppState().appNome,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons
                                                        .create_new_folder_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.more_vert,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 18.0, 0.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Pesquisar',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .zAPcinza,
                                          prefixIcon: const Icon(
                                            Icons.search,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final itensConversa = FFAppState()
                                            .appConversas
                                            .sortedList(
                                                keyOf: (e) =>
                                                    e.messagetimestamp,
                                                desc: true)
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: itensConversa.length,
                                          itemBuilder:
                                              (context, itensConversaIndex) {
                                            final itensConversaItem =
                                                itensConversa[
                                                    itensConversaIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var shouldSetState = false;
                                                _model.remoteJid =
                                                    itensConversaItem.remotejid;
                                                _model.nome =
                                                    valueOrDefault<String>(
                                                  itensConversaItem.titulo,
                                                  '-',
                                                );
                                                _model.foto =
                                                    valueOrDefault<String>(
                                                  itensConversaItem.foto,
                                                  '-',
                                                );
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model.txtMensagemTextController
                                                          ?.text =
                                                      _model
                                                          .txtMensagemTextController
                                                          .text;
                                                  _model.txtMensagemFocusNode
                                                      ?.requestFocus();
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    _model.txtMensagemTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                      offset: _model
                                                          .txtMensagemTextController!
                                                          .text
                                                          .length,
                                                    );
                                                  });
                                                });
                                                if (itensConversaItem.clicado) {
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                }

                                                _model.outMessages =
                                                    await SupabaseGroup
                                                        .getMessagesCall
                                                        .call(
                                                  remotejid:
                                                      'eq.${itensConversaItem.remotejid}',
                                                  connectedPhone:
                                                      'eq.${_model.instancia?.ownerJid}',
                                                );

                                                shouldSetState = true;
                                                if ((_model.outMessages
                                                        ?.succeeded ??
                                                    true)) {
                                                  // Reseta contador
                                                  _model.contador = 0;
                                                  _model.numero =
                                                      valueOrDefault<double>(
                                                    ((_model.outMessages?.jsonBody ??
                                                                    '')
                                                                .toList()
                                                                .map<ConversasStruct?>(
                                                                    ConversasStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ConversasStruct?>)
                                                        .withoutNulls
                                                        .length
                                                        .toDouble(),
                                                    0.0,
                                                  );
                                                  safeSetState(() {});
                                                  while (_model.contador! <
                                                      ((_model.outMessages?.jsonBody ??
                                                                      '')
                                                                  .toList()
                                                                  .map<ConversasStruct?>(
                                                                      ConversasStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  ConversasStruct?>)
                                                          .withoutNulls
                                                          .length) {
                                                    // Adiciona na lista Messages
                                                    _model.addToMessages(((_model
                                                                        .outMessages
                                                                        ?.jsonBody ??
                                                                    '')
                                                                .toList()
                                                                .map<ConversasStruct?>(
                                                                    ConversasStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ConversasStruct?>)
                                                        .withoutNulls
                                                        .elementAtOrNull(
                                                            _model.contador!)!);
                                                    _model.contador =
                                                        _model.contador! + 1;
                                                    safeSetState(() {});
                                                  }
                                                  // Reseta Contador
                                                  _model.contador = 0;
                                                  safeSetState(() {});
                                                  while (_model.contador! <
                                                      FFAppState()
                                                          .appConversas
                                                          .length) {
                                                    if (FFAppState()
                                                            .appConversas
                                                            .elementAtOrNull(
                                                                _model
                                                                    .contador!)
                                                            ?.remotejid ==
                                                        itensConversaItem
                                                            .remotejid) {
                                                      FFAppState()
                                                          .updateAppConversasAtIndex(
                                                        _model.contador!,
                                                        (e) =>
                                                            e..clicado = true,
                                                      );
                                                      safeSetState(() {});
                                                      break;
                                                    } else {
                                                      _model.contador =
                                                          _model.contador! + 1;
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Houve um erro ao buscar mensagens: ${(_model.outMessages?.jsonBody ?? '').toString()}',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                }

                                                if (shouldSetState) {
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: wrapWithModel(
                                                model: _model.itemConversaModels
                                                    .getModel(
                                                  itensConversaItem.remotejid,
                                                  itensConversaIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemConversaWidget(
                                                  key: Key(
                                                    'Keyph4_${itensConversaItem.remotejid}',
                                                  ),
                                                  conversa: itensConversaItem,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'itemConversaOnPageLoadAnimation']!);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            );
                          } else if (_model.menu == 2) {
                            return wrapWithModel(
                              model: _model.instanciasModel,
                              updateCallback: () => safeSetState(() {}),
                              child: InstanciasWidget(
                                acao: (token, nome) async {
                                  _model.contador = 0;
                                  _model.remoteJid = '-';
                                  _model.nome = '-';
                                  _model.foto = '-';
                                  _model.tempMessage = null;
                                  _model.chatAtivo = true;
                                  _model.file = null;
                                  _model.tipoMedia = 1;
                                  _model.menu = 1;
                                  safeSetState(() {});
                                  _model.outInstancia = await InstancesGroup
                                      .instanceFetchCall
                                      .call(
                                    token: token,
                                    instance: nome,
                                  );

                                  if ((_model.outInstancia?.succeeded ??
                                      true)) {
                                    _model.instancia =
                                        ((_model.outInstancia?.jsonBody ?? '')
                                                    .toList()
                                                    .map<InstanciaStruct?>(
                                                        InstanciaStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<InstanciaStruct?>)
                                            .withoutNulls
                                            .firstOrNull;
                                    safeSetState(() {});
                                    await _model.getConversas(context);
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Erro ao buscar instancia: ${(_model.outInstancia?.jsonBody ?? '').toString()}',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.usuariosModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const UsuariosWidget(),
                            );
                          }
                        },
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 64.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).zAPcinza,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 48.0,
                                      height: 48.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        _model.foto,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.nome,
                                        'Nome usuário',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (_model.chatAtivo) {
                                    return Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .zapAmarelo,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 12.0, 0.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final itensMessages = _model
                                                      .messages
                                                      .where((e) =>
                                                          e.remotejid ==
                                                          _model.remoteJid)
                                                      .toList()
                                                      .sortedList(
                                                          keyOf: (e) => e
                                                              .messagetimestamp,
                                                          desc: true)
                                                      .unique(
                                                          (e) => e.messageid)
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    reverse: true,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        itensMessages.length,
                                                    itemBuilder: (context,
                                                        itensMessagesIndex) {
                                                      final itensMessagesItem =
                                                          itensMessages[
                                                              itensMessagesIndex];
                                                      return Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      25.0,
                                                                      0.0),
                                                          child:
                                                              ItemMensagemWidget(
                                                            key: Key(
                                                                'Keybuo_${itensMessagesIndex}_of_${itensMessages.length}'),
                                                            message:
                                                                itensMessagesItem,
                                                            fotoMe:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.instancia
                                                                  ?.profilePicUrl,
                                                              '-',
                                                            ),
                                                            fotoSender:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.foto,
                                                              '-',
                                                            ),
                                                          ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'itemMensagemOnPageLoadAnimation']!),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return wrapWithModel(
                                      model: _model.visualizarMediaModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: VisualizarMediaWidget(
                                        remoteJid: _model.remoteJid,
                                        instancia: _model.instancia!,
                                        file: _model.file,
                                        tipoMedia: _model.tipoMedia,
                                        acao: () async {
                                          _model.chatAtivo = true;
                                          safeSetState(() {});
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: 150.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).zAPcinza,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showAlignedDialog(
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: false,
                                            targetAnchor: const AlignmentDirectional(
                                                    0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                const AlignmentDirectional(0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: MenuMediaWidget(
                                                    acao: (varChatAtivo, file,
                                                        tipoMedia) async {
                                                      _model.chatAtivo =
                                                          varChatAtivo;
                                                      safeSetState(() {});
                                                      _model.file = file;
                                                      _model.tipoMedia =
                                                          tipoMedia;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: SizedBox(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model
                                                .txtMensagemTextController,
                                            focusNode:
                                                _model.txtMensagemFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Digite uma mensagem',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: null,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .txtMensagemTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
