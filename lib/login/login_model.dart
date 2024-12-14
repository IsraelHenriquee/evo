import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  // State field(s) for txtCriarNome widget.
  FocusNode? txtCriarNomeFocusNode;
  TextEditingController? txtCriarNomeTextController;
  String? Function(BuildContext, String?)? txtCriarNomeTextControllerValidator;
  // State field(s) for txtCriarEmail widget.
  FocusNode? txtCriarEmailFocusNode;
  TextEditingController? txtCriarEmailTextController;
  String? Function(BuildContext, String?)? txtCriarEmailTextControllerValidator;
  // State field(s) for txtCriarsenha widget.
  FocusNode? txtCriarsenhaFocusNode;
  TextEditingController? txtCriarsenhaTextController;
  late bool txtCriarsenhaVisibility;
  String? Function(BuildContext, String?)? txtCriarsenhaTextControllerValidator;
  // State field(s) for txtConfSenha widget.
  FocusNode? txtConfSenhaFocusNode;
  TextEditingController? txtConfSenhaTextController;
  late bool txtConfSenhaVisibility;
  String? Function(BuildContext, String?)? txtConfSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtCriarsenhaVisibility = false;
    txtConfSenhaVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtCriarNomeFocusNode?.dispose();
    txtCriarNomeTextController?.dispose();

    txtCriarEmailFocusNode?.dispose();
    txtCriarEmailTextController?.dispose();

    txtCriarsenhaFocusNode?.dispose();
    txtCriarsenhaTextController?.dispose();

    txtConfSenhaFocusNode?.dispose();
    txtConfSenhaTextController?.dispose();
  }
}
