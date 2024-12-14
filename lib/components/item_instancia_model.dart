import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_instancia_widget.dart' show ItemInstanciaWidget;
import 'package:flutter/material.dart';

class ItemInstanciaModel extends FlutterFlowModel<ItemInstanciaWidget> {
  ///  Local state fields for this component.

  InstanciaStruct? instancia;
  void updateInstanciaStruct(Function(InstanciaStruct) updateFn) {
    updateFn(instancia ??= InstanciaStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future buscarInstancia(BuildContext context) async {
    ApiCallResponse? outInstanca;

    outInstanca = await InstancesGroup.instanceFetchCall.call(
      token: valueOrDefault<String>(
        widget!.token,
        '-',
      ),
      instance: valueOrDefault<String>(
        widget!.nome,
        '-',
      ),
    );

    if ((outInstanca.succeeded ?? true)) {
      instancia = ((outInstanca.jsonBody ?? '')
              .toList()
              .map<InstanciaStruct?>(InstanciaStruct.maybeFromMap)
              .toList() as Iterable<InstanciaStruct?>)
          .withoutNulls
          .firstOrNull;
    }
  }
}
