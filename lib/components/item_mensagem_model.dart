import '/components/item_audio_widget.dart';
import '/components/item_documento_widget.dart';
import '/components/item_imagem_widget.dart';
import '/components/item_texto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_mensagem_widget.dart' show ItemMensagemWidget;
import 'package:flutter/material.dart';

class ItemMensagemModel extends FlutterFlowModel<ItemMensagemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for itemTexto component.
  late ItemTextoModel itemTextoModel1;
  // Model for itemAudio component.
  late ItemAudioModel itemAudioModel1;
  // Model for itemImagem component.
  late ItemImagemModel itemImagemModel1;
  // Model for itemDocumento component.
  late ItemDocumentoModel itemDocumentoModel1;
  // Model for itemTexto component.
  late ItemTextoModel itemTextoModel2;
  // Model for itemAudio component.
  late ItemAudioModel itemAudioModel2;
  // Model for itemImagem component.
  late ItemImagemModel itemImagemModel2;
  // Model for itemDocumento component.
  late ItemDocumentoModel itemDocumentoModel2;

  @override
  void initState(BuildContext context) {
    itemTextoModel1 = createModel(context, () => ItemTextoModel());
    itemAudioModel1 = createModel(context, () => ItemAudioModel());
    itemImagemModel1 = createModel(context, () => ItemImagemModel());
    itemDocumentoModel1 = createModel(context, () => ItemDocumentoModel());
    itemTextoModel2 = createModel(context, () => ItemTextoModel());
    itemAudioModel2 = createModel(context, () => ItemAudioModel());
    itemImagemModel2 = createModel(context, () => ItemImagemModel());
    itemDocumentoModel2 = createModel(context, () => ItemDocumentoModel());
  }

  @override
  void dispose() {
    itemTextoModel1.dispose();
    itemAudioModel1.dispose();
    itemImagemModel1.dispose();
    itemDocumentoModel1.dispose();
    itemTextoModel2.dispose();
    itemAudioModel2.dispose();
    itemImagemModel2.dispose();
    itemDocumentoModel2.dispose();
  }
}
