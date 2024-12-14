import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'criar_usuario_model.dart';
export 'criar_usuario_model.dart';

class CriarUsuarioWidget extends StatefulWidget {
  const CriarUsuarioWidget({super.key});

  @override
  State<CriarUsuarioWidget> createState() => _CriarUsuarioWidgetState();
}

class _CriarUsuarioWidgetState extends State<CriarUsuarioWidget> {
  late CriarUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarUsuarioModel());

    _model.txtNomeTextController ??= TextEditingController();
    _model.txtNomeFocusNode ??= FocusNode();

    _model.txtEmailTextController ??= TextEditingController();
    _model.txtEmailFocusNode ??= FocusNode();

    _model.txtSenhaTextController ??= TextEditingController();
    _model.txtSenhaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 341.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Cria usuario',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txtNomeTextController,
                focusNode: _model.txtNomeFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: false,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Nome do usuário..',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator:
                    _model.txtNomeTextControllerValidator.asValidator(context),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txtEmailTextController,
                focusNode: _model.txtEmailFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: false,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Email do usuário',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator:
                    _model.txtEmailTextControllerValidator.asValidator(context),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txtSenhaTextController,
                focusNode: _model.txtSenhaFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: false,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Senha do usuário',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).zapBotao,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator:
                    _model.txtSenhaTextControllerValidator.asValidator(context),
              ),
            ),
            FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<String>(null),
              options: const ['Financeiro', 'Vendas', 'Marketing'],
              onChanged: (val) =>
                  safeSetState(() => _model.dropDownValue = val),
              width: double.infinity,
              height: 45.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              hintText: 'Selecione o departamento',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              elevation: 2.0,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              borderRadius: 8.0,
              margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              isOverButton: false,
              isSearchable: false,
              isMultiSelect: false,
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).zapBotao,
              icon: Icon(
                Icons.check_sharp,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                var shouldSetState = false;
                if ((_model.txtNomeTextController.text == '') ||
                    (_model.txtEmailTextController.text == '') ||
                    (_model.txtSenhaTextController.text == '') ||
                    (_model.dropDownValue == null ||
                        _model.dropDownValue == '')) {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Atencao'),
                        content: const Text('Preencha todos os campos!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  _model.outUser = await CriarUsuarioCall.call(
                    email: _model.txtEmailTextController.text,
                    password: _model.txtSenhaTextController.text,
                  );

                  shouldSetState = true;
                  if ((_model.outUser?.succeeded ?? true)) {
                    await UsuariosTable().insert({
                      'user_id': CriarUsuarioCall.userid(
                        (_model.outUser?.jsonBody ?? ''),
                      ),
                      'nome': _model.txtNomeTextController.text,
                      'admin': false,
                      'departamento': _model.dropDownValue,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Usuário criado',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Houve um erro: ${(_model.outUser?.jsonBody ?? '').toString()}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }
                }

                if (shouldSetState) safeSetState(() {});
              },
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
