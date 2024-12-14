import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Global Instances Group Code

class GlobalInstancesGroup {
  static String getBaseUrl() =>
      'https://evolution-evolution.hf8n6w.easypanel.host';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey':
        'a0f2854fa3afdbe38d9c9bb47153a749c0c0b717d82928f8b9dacabbf21fb8ec',
  };
  static CreateInstanceCall createInstanceCall = CreateInstanceCall();
  static FetchInstancesCall fetchInstancesCall = FetchInstancesCall();
}

class CreateInstanceCall {
  Future<ApiCallResponse> call({
    String? instanceName = 'israel32',
    String? token = '',
    bool? qrcode = false,
    String? integration = 'WHATSAPP-BAILEYS',
    bool? groupsIgnore = true,
  }) async {
    final baseUrl = GlobalInstancesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "instanceName": "${escapeStringForJson(instanceName)}",
  "token": "${escapeStringForJson(token)}",
  "qrcode": $qrcode,
  "integration": "${escapeStringForJson(integration)}",
  "groupsIgnore": $groupsIgnore,
  "rejectCall": true,
  "alwaysOnline": false,
  "readMessages": false,
  "readStatus": false,
  "syncFullHistory": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Instance',
      apiUrl: '$baseUrl/instance/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'a0f2854fa3afdbe38d9c9bb47153a749c0c0b717d82928f8b9dacabbf21fb8ec',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hash''',
      ));
}

class FetchInstancesCall {
  Future<ApiCallResponse> call({
    String? instanceName = '',
  }) async {
    final baseUrl = GlobalInstancesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Instances',
      apiUrl: '$baseUrl/instance/fetchInstances',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'a0f2854fa3afdbe38d9c9bb47153a749c0c0b717d82928f8b9dacabbf21fb8ec',
      },
      params: {
        'instanceName': instanceName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Global Instances Group Code

/// Start Instances Group Code

class InstancesGroup {
  static String getBaseUrl({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) =>
      'https://evolution-evolution.hf8n6w.easypanel.host';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey': '[token]',
  };
  static GetInformationCall getInformationCall = GetInformationCall();
  static InstanceConnectCall instanceConnectCall = InstanceConnectCall();
  static InstanceFetchCall instanceFetchCall = InstanceFetchCall();
  static InstanceRestartCall instanceRestartCall = InstanceRestartCall();
  static InstanceConnectionStateCall instanceConnectionStateCall =
      InstanceConnectionStateCall();
  static InstanceLogoutCall instanceLogoutCall = InstanceLogoutCall();
  static InstanceDeleteCall instanceDeleteCall = InstanceDeleteCall();
  static WebhookSetCall webhookSetCall = WebhookSetCall();
  static WebhookFindCall webhookFindCall = WebhookFindCall();
  static SettingsSetCall settingsSetCall = SettingsSetCall();
  static SettingsFindCall settingsFindCall = SettingsFindCall();
  static SendPlainTextCall sendPlainTextCall = SendPlainTextCall();
  static SendMediaCall sendMediaCall = SendMediaCall();
  static CheckIsWhatsAppCall checkIsWhatsAppCall = CheckIsWhatsAppCall();
  static ChatFetchProfilePictureURLCall chatFetchProfilePictureURLCall =
      ChatFetchProfilePictureURLCall();
  static ChatFindContactsCall chatFindContactsCall = ChatFindContactsCall();
  static FindChatsCall findChatsCall = FindChatsCall();
  static FindMessagesCall findMessagesCall = FindMessagesCall();
  static SendPresenceCall sendPresenceCall = SendPresenceCall();
  static GroupFindMembersCall groupFindMembersCall = GroupFindMembersCall();
  static GroupFindByJIDCall groupFindByJIDCall = GroupFindByJIDCall();
  static FetchProfileCall fetchProfileCall = FetchProfileCall();
  static FetchAllGroupsCall fetchAllGroupsCall = FetchAllGroupsCall();
}

class GetInformationCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Information',
      apiUrl: '$baseUrl/?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? version(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.version''',
      ));
  String? manager(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.manager''',
      ));
  String? documentation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.documentation''',
      ));
}

class InstanceConnectCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Connect',
      apiUrl: '$baseUrl/instance/connect/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {
        'number': number,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? qrcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? codigo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pairingCode''',
      ));
}

class InstanceFetchCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Fetch',
      apiUrl: '$baseUrl/instance/fetchInstances',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {
        'instanceName': instance,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InstanceRestartCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Restart',
      apiUrl: '$baseUrl/instance/restart/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InstanceConnectionStateCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Connection State',
      apiUrl: '$baseUrl/instance/connectionState/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.instance.state''',
      ));
}

class InstanceLogoutCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Logout',
      apiUrl: '$baseUrl/instance/logout/$instance',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InstanceDeleteCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Instance Delete',
      apiUrl: '$baseUrl/instance/delete/$instance',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WebhookSetCall {
  Future<ApiCallResponse> call({
    String? url =
        'https://primary-production-84ba.up.railway.app/webhook/evolution2',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "webhook": {
    "enabled": true,
    "url": "${escapeStringForJson(url)}",
    "byEvents": false,
    "base64": false,
    "events": [
      "MESSAGES_UPSERT",
      "SEND_MESSAGE"
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Webhook Set',
      apiUrl: '$baseUrl/webhook/set/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WebhookFindCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Webhook Find',
      apiUrl: '$baseUrl/webhook/find/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SettingsSetCall {
  Future<ApiCallResponse> call({
    bool? groupsIgnore = true,
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "rejectCall": true,
  "msgCall": "Não estamos disponíveis no momento!",
  "groupsIgnore": $groupsIgnore,
  "alwaysOnline": false,
  "readMessages": false,
  "syncFullHistory": false,
  "readStatus": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Settings Set',
      apiUrl: '$baseUrl/settings/set/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SettingsFindCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Settings Find',
      apiUrl: '$baseUrl/settings/find/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? rejectCall(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.rejectCall''',
      ));
  bool? groupsIgnore(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.groupsIgnore''',
      ));
  String? msgCall(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.msgCall''',
      ));
  bool? alwaysOnline(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.alwaysOnline''',
      ));
  bool? readMessages(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.readMessages''',
      ));
  bool? readStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.readStatus''',
      ));
  bool? syncFullHistory(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.syncFullHistory''',
      ));
}

class SendPlainTextCall {
  Future<ApiCallResponse> call({
    String? number = '554191338055@s.whatsapp.net',
    String? text = 'Teste',
    int? delay = 0,
    bool? mentionsEveryOne,
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "number": "${escapeStringForJson(number)}",
  "text": "${escapeStringForJson(text)}",
  "delay": $delay,
  "mentionsEveryOne": $mentionsEveryOne,
  "mentioned": [
    "551199998888"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Plain Text',
      apiUrl: '$baseUrl/message/sendText/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? remoteJid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key.remoteJid''',
      ));
  String? messageId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key.id''',
      ));
  String? messageType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.messageType''',
      ));
  int? messageTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.messageTimestamp''',
      ));
  String? conversation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.conversation''',
      ));
}

class SendMediaCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? mediatype = '',
    int? delay = 0,
    bool? mentionsEveryOne,
    String? media = '',
    String? fileName = '',
    String? caption = '',
    String? mimetype = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "number": "${escapeStringForJson(number)}",
  "mediatype": "${escapeStringForJson(mediatype)}",
  "media": "${escapeStringForJson(media)}",
  "mimetype": "${escapeStringForJson(mimetype)}",
  "caption": "${escapeStringForJson(caption)}",
  "fileName": "${escapeStringForJson(fileName)}",
  "delay": $delay,
  "mentionsEveryOne": $mentionsEveryOne,
  "mentioned": [
    "5541999998888"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Media',
      apiUrl: '$baseUrl/message/sendmedia/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? remoteJid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key.remoteJid''',
      ));
  String? messageId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key.id''',
      ));
  String? messageType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.messageType''',
      ));
  int? messageTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.messageTimestamp''',
      ));
  String? conversation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.conversation''',
      ));
}

class CheckIsWhatsAppCall {
  Future<ApiCallResponse> call({
    List<String>? numbersList,
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );
    final numbers = _serializeList(numbersList);

    const ffApiRequestBody = '''
{
  "numbers": ["5541991338055"]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check is WhatsApp',
      apiUrl: '$baseUrl/chat/whatsappNumbers/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatFetchProfilePictureURLCall {
  Future<ApiCallResponse> call({
    String? number = '554191480924@s.whatsapp.net',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "number": "${escapeStringForJson(number)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Fetch Profile Picture URL',
      apiUrl: '$baseUrl/chat/fetchProfilePictureUrl/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? foto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profilePictureUrl''',
      ));
}

class ChatFindContactsCall {
  Future<ApiCallResponse> call({
    String? remoteJid = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "where": {
    "remoteJid": "${escapeStringForJson(remoteJid)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Find Contacts',
      apiUrl: '$baseUrl/chat/findContacts/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].pushName''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profilePicUrl''',
      ));
}

class FindChatsCall {
  Future<ApiCallResponse> call({
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Chats',
      apiUrl: '$baseUrl/chat/findChats/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindMessagesCall {
  Future<ApiCallResponse> call({
    String? remoteJid = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "where": {
    "key": {
      "remoteJid": "${escapeStringForJson(remoteJid)}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Find Messages',
      apiUrl: '$baseUrl/chat/findMessages/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendPresenceCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? presence = 'recording',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "number": "${escapeStringForJson(number)}",
  "delay": 3000,
  "presence": "${escapeStringForJson(presence)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Presence',
      apiUrl: '$baseUrl/chat/sendPresence/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroupFindMembersCall {
  Future<ApiCallResponse> call({
    String? groupJid = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Group Find  Members',
      apiUrl: '$baseUrl/group/participants/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {
        'groupJid': groupJid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroupFindByJIDCall {
  Future<ApiCallResponse> call({
    String? groupJid = '120363212392926405@g.us',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Group Find by JID',
      apiUrl: '$baseUrl/group/findGroupInfos/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {
        'groupJid': groupJid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? nomeGrupo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.subject''',
      ));
  String? foto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pictureUrl''',
      ));
}

class FetchProfileCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    final ffApiRequestBody = '''
{
  "number": "${escapeStringForJson(number)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Profile',
      apiUrl: '$baseUrl/chat/fetchProfile/$instance',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchAllGroupsCall {
  Future<ApiCallResponse> call({
    bool? getParticipants,
    String? token = '815541D9-A4D4-4D53-904A-272764A91CA0',
    String? instance = 'teste',
  }) async {
    final baseUrl = InstancesGroup.getBaseUrl(
      token: token,
      instance: instance,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Groups',
      apiUrl: '$baseUrl/group/fetchAllGroups/$instance',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '$token',
      },
      params: {
        'getParticipants': getParticipants,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Instances Group Code

/// Start Supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() =>
      'https://qvectrqtuumoicdeedci.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
  };
  static GetConversasCall getConversasCall = GetConversasCall();
  static GetPushNameCall getPushNameCall = GetPushNameCall();
  static GetMessagesCall getMessagesCall = GetMessagesCall();
  static GetUsersCall getUsersCall = GetUsersCall();
}

class GetConversasCall {
  Future<ApiCallResponse> call({
    String? connectedPhone = 'eq.554191480924@s.whatsapp.net',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Conversas',
      apiUrl: '$baseUrl/evo_conversas',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
      },
      params: {
        'connected_phone': connectedPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPushNameCall {
  Future<ApiCallResponse> call({
    String? connectedPhone = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get PushName',
      apiUrl: '$baseUrl/evo_lastsender',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
      },
      params: {
        'connected_phone': connectedPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMessagesCall {
  Future<ApiCallResponse> call({
    String? remotejid = '',
    String? connectedPhone = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Messages',
      apiUrl: '$baseUrl/evo_messages',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
      },
      params: {
        'remotejid': remotejid,
        'connected_phone': connectedPhone,
        'limit': 100,
        'order': "id.desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUsersCall {
  Future<ApiCallResponse> call({
    String? userId = 'eq.4ed5abe8-4a60-441a-959d-01108eef5877',
    String? jwt =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6IjBXS0ZKT25TL29uQ0U3by8iLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3F2ZWN0cnF0dXVtb2ljZGVlZGNpLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI0ZWQ1YWJlOC00YTYwLTQ0MWEtOTU5ZC0wMTEwOGVlZjU4NzciLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzMzNjI4NTYzLCJpYXQiOjE3MzM2MjQ5NjMsImVtYWlsIjoidGVzdGUyQHRlc3RlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJ0ZXN0ZTJAdGVzdGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInN1YiI6IjRlZDVhYmU4LTRhNjAtNDQxYS05NTlkLTAxMTA4ZWVmNTg3NyJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzMzNjI0OTYzfV0sInNlc3Npb25faWQiOiJiNjlkMTA0Zi05ZjNjLTQyNDEtOWFkOS1lNTQ3ZTliNjcyYmUiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.wXETbFfaInojEoi90ujsaL6Ef788HRO87onZUWqL0ms',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Users',
      apiUrl: '$baseUrl/usuarios',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
        'Authorization': 'bearer $jwt',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nome''',
      ));
  bool? admin(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].admin''',
      ));
}

/// End Supabase Group Code

class CriarUsuarioCall {
  static Future<ApiCallResponse> call({
    String? email = 'teste3@teste.com',
    String? password = '123456',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Usuario',
      apiUrl: 'https://qvectrqtuumoicdeedci.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2ZWN0cnF0dXVtb2ljZGVlZGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1NzM4NzUsImV4cCI6MjA0NjE0OTg3NX0.JlvxwkgZS3UG663CC3Q6vWLGrIbkegZlrV-z_X5Wlds',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class CriarUsuarioCopyCall {
  static Future<ApiCallResponse> call({
    String? email = 'joao@gmail.com',
    String? password = '123456',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Usuario Copy',
      apiUrl: 'https://supabase.automatiza-ai.com/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE1MDUwODAwLAogICJleHAiOiAxODcyODE3MjAwCn0.yhMCVujjlzBSRb8d_TsglooxRKeQG-LT8dms_qXv7Uw',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE1MDUwODAwLAogICJleHAiOiAxODcyODE3MjAwCn0.yhMCVujjlzBSRb8d_TsglooxRKeQG-LT8dms_qXv7Uw',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
