import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'qrcode_widget.dart' show QrcodeWidget;
import 'package:flutter/material.dart';

class QrcodeModel extends FlutterFlowModel<QrcodeWidget> {
  ///  Local state fields for this component.

  String qrcode = '-';

  bool buscou = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Instance Connect)] action in qrcode widget.
  ApiCallResponse? outQrcode;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 20000;
  int timerMilliseconds = 20000;
  String timerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
