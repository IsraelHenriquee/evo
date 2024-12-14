import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appNome = prefs.getString('ff_appNome') ?? _appNome;
    });
    _safeInit(() {
      _appAdmin = prefs.getBool('ff_appAdmin') ?? _appAdmin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ConversasStruct> _appConversas = [];
  List<ConversasStruct> get appConversas => _appConversas;
  set appConversas(List<ConversasStruct> value) {
    _appConversas = value;
  }

  void addToAppConversas(ConversasStruct value) {
    appConversas.add(value);
  }

  void removeFromAppConversas(ConversasStruct value) {
    appConversas.remove(value);
  }

  void removeAtIndexFromAppConversas(int index) {
    appConversas.removeAt(index);
  }

  void updateAppConversasAtIndex(
    int index,
    ConversasStruct Function(ConversasStruct) updateFn,
  ) {
    appConversas[index] = updateFn(_appConversas[index]);
  }

  void insertAtIndexInAppConversas(int index, ConversasStruct value) {
    appConversas.insert(index, value);
  }

  List<ConversasStruct> _appLastSender = [];
  List<ConversasStruct> get appLastSender => _appLastSender;
  set appLastSender(List<ConversasStruct> value) {
    _appLastSender = value;
  }

  void addToAppLastSender(ConversasStruct value) {
    appLastSender.add(value);
  }

  void removeFromAppLastSender(ConversasStruct value) {
    appLastSender.remove(value);
  }

  void removeAtIndexFromAppLastSender(int index) {
    appLastSender.removeAt(index);
  }

  void updateAppLastSenderAtIndex(
    int index,
    ConversasStruct Function(ConversasStruct) updateFn,
  ) {
    appLastSender[index] = updateFn(_appLastSender[index]);
  }

  void insertAtIndexInAppLastSender(int index, ConversasStruct value) {
    appLastSender.insert(index, value);
  }

  String _appNome = '';
  String get appNome => _appNome;
  set appNome(String value) {
    _appNome = value;
    prefs.setString('ff_appNome', value);
  }

  bool _appAdmin = false;
  bool get appAdmin => _appAdmin;
  set appAdmin(bool value) {
    _appAdmin = value;
    prefs.setBool('ff_appAdmin', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
