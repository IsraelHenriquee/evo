import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'qrcode_model.dart';
export 'qrcode_model.dart';

class QrcodeWidget extends StatefulWidget {
  const QrcodeWidget({
    super.key,
    String? token,
    String? instance,
  })  : token = token ?? '-',
        instance = instance ?? '-';

  final String token;
  final String instance;

  @override
  State<QrcodeWidget> createState() => _QrcodeWidgetState();
}

class _QrcodeWidgetState extends State<QrcodeWidget> {
  late QrcodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrcodeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outQrcode = await InstancesGroup.instanceConnectCall.call(
        token: widget.token,
        instance: widget.instance,
      );

      if ((_model.outQrcode?.succeeded ?? true)) {
        _model.qrcode = InstancesGroup.instanceConnectCall.qrcode(
          (_model.outQrcode?.jsonBody ?? ''),
        )!;
        _model.buscou = true;
        safeSetState(() {});
        _model.timerController.onStartTimer();
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Atencao'),
              content: Text(
                  'Houve um erro: ${(_model.outQrcode?.jsonBody ?? '').toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        Navigator.pop(context);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      width: 300.0,
      height: _model.buscou ? 350.0 : 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_model.buscou)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: BarcodeWidget(
                        data: _model.qrcode,
                        barcode: Barcode.qrCode(),
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (context, error) => const SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        drawText: false,
                      ),
                    ),
                    FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: const Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) safeSetState(() {});
                      },
                      onEnded: () async {
                        Navigator.pop(context);
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            if (!_model.buscou)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buscando....',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
