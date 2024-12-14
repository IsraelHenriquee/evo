// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstanciaStruct extends BaseStruct {
  InstanciaStruct({
    String? id,
    String? name,
    String? connectionStatus,
    String? ownerJid,
    String? profileName,
    String? profilePicUrl,
    String? integration,
    String? number,
    String? token,
  })  : _id = id,
        _name = name,
        _connectionStatus = connectionStatus,
        _ownerJid = ownerJid,
        _profileName = profileName,
        _profilePicUrl = profilePicUrl,
        _integration = integration,
        _number = number,
        _token = token;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "connectionStatus" field.
  String? _connectionStatus;
  String get connectionStatus => _connectionStatus ?? '';
  set connectionStatus(String? val) => _connectionStatus = val;

  bool hasConnectionStatus() => _connectionStatus != null;

  // "ownerJid" field.
  String? _ownerJid;
  String get ownerJid => _ownerJid ?? '';
  set ownerJid(String? val) => _ownerJid = val;

  bool hasOwnerJid() => _ownerJid != null;

  // "profileName" field.
  String? _profileName;
  String get profileName => _profileName ?? '';
  set profileName(String? val) => _profileName = val;

  bool hasProfileName() => _profileName != null;

  // "profilePicUrl" field.
  String? _profilePicUrl;
  String get profilePicUrl => _profilePicUrl ?? '';
  set profilePicUrl(String? val) => _profilePicUrl = val;

  bool hasProfilePicUrl() => _profilePicUrl != null;

  // "integration" field.
  String? _integration;
  String get integration => _integration ?? '';
  set integration(String? val) => _integration = val;

  bool hasIntegration() => _integration != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  static InstanciaStruct fromMap(Map<String, dynamic> data) => InstanciaStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        connectionStatus: data['connectionStatus'] as String?,
        ownerJid: data['ownerJid'] as String?,
        profileName: data['profileName'] as String?,
        profilePicUrl: data['profilePicUrl'] as String?,
        integration: data['integration'] as String?,
        number: data['number'] as String?,
        token: data['token'] as String?,
      );

  static InstanciaStruct? maybeFromMap(dynamic data) => data is Map
      ? InstanciaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'connectionStatus': _connectionStatus,
        'ownerJid': _ownerJid,
        'profileName': _profileName,
        'profilePicUrl': _profilePicUrl,
        'integration': _integration,
        'number': _number,
        'token': _token,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'connectionStatus': serializeParam(
          _connectionStatus,
          ParamType.String,
        ),
        'ownerJid': serializeParam(
          _ownerJid,
          ParamType.String,
        ),
        'profileName': serializeParam(
          _profileName,
          ParamType.String,
        ),
        'profilePicUrl': serializeParam(
          _profilePicUrl,
          ParamType.String,
        ),
        'integration': serializeParam(
          _integration,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
      }.withoutNulls;

  static InstanciaStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstanciaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        connectionStatus: deserializeParam(
          data['connectionStatus'],
          ParamType.String,
          false,
        ),
        ownerJid: deserializeParam(
          data['ownerJid'],
          ParamType.String,
          false,
        ),
        profileName: deserializeParam(
          data['profileName'],
          ParamType.String,
          false,
        ),
        profilePicUrl: deserializeParam(
          data['profilePicUrl'],
          ParamType.String,
          false,
        ),
        integration: deserializeParam(
          data['integration'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InstanciaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstanciaStruct &&
        id == other.id &&
        name == other.name &&
        connectionStatus == other.connectionStatus &&
        ownerJid == other.ownerJid &&
        profileName == other.profileName &&
        profilePicUrl == other.profilePicUrl &&
        integration == other.integration &&
        number == other.number &&
        token == other.token;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        connectionStatus,
        ownerJid,
        profileName,
        profilePicUrl,
        integration,
        number,
        token
      ]);
}

InstanciaStruct createInstanciaStruct({
  String? id,
  String? name,
  String? connectionStatus,
  String? ownerJid,
  String? profileName,
  String? profilePicUrl,
  String? integration,
  String? number,
  String? token,
}) =>
    InstanciaStruct(
      id: id,
      name: name,
      connectionStatus: connectionStatus,
      ownerJid: ownerJid,
      profileName: profileName,
      profilePicUrl: profilePicUrl,
      integration: integration,
      number: number,
      token: token,
    );
