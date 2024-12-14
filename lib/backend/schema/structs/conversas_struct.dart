// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversasStruct extends BaseStruct {
  ConversasStruct({
    int? id,
    String? createdAt,
    String? evento,
    String? instance,
    String? remotejid,
    bool? fromme,
    String? messageid,
    String? pushname,
    String? conversation,
    String? messagetype,
    String? connectedPhone,
    String? serverUrl,
    String? apikey,
    String? mediaurl,
    String? caption,
    String? thumb,
    String? latitude,
    String? longitude,
    String? participant,
    bool? isgroup,
    int? messagetimestamp,
    int? height,
    int? width,
    String? title,
    bool? atualizado,
    String? titulo,
    String? foto,
    bool? clicado,
    String? metadado,
  })  : _id = id,
        _createdAt = createdAt,
        _evento = evento,
        _instance = instance,
        _remotejid = remotejid,
        _fromme = fromme,
        _messageid = messageid,
        _pushname = pushname,
        _conversation = conversation,
        _messagetype = messagetype,
        _connectedPhone = connectedPhone,
        _serverUrl = serverUrl,
        _apikey = apikey,
        _mediaurl = mediaurl,
        _caption = caption,
        _thumb = thumb,
        _latitude = latitude,
        _longitude = longitude,
        _participant = participant,
        _isgroup = isgroup,
        _messagetimestamp = messagetimestamp,
        _height = height,
        _width = width,
        _title = title,
        _atualizado = atualizado,
        _titulo = titulo,
        _foto = foto,
        _clicado = clicado,
        _metadado = metadado;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "evento" field.
  String? _evento;
  String get evento => _evento ?? '';
  set evento(String? val) => _evento = val;

  bool hasEvento() => _evento != null;

  // "instance" field.
  String? _instance;
  String get instance => _instance ?? '';
  set instance(String? val) => _instance = val;

  bool hasInstance() => _instance != null;

  // "remotejid" field.
  String? _remotejid;
  String get remotejid => _remotejid ?? '';
  set remotejid(String? val) => _remotejid = val;

  bool hasRemotejid() => _remotejid != null;

  // "fromme" field.
  bool? _fromme;
  bool get fromme => _fromme ?? false;
  set fromme(bool? val) => _fromme = val;

  bool hasFromme() => _fromme != null;

  // "messageid" field.
  String? _messageid;
  String get messageid => _messageid ?? '';
  set messageid(String? val) => _messageid = val;

  bool hasMessageid() => _messageid != null;

  // "pushname" field.
  String? _pushname;
  String get pushname => _pushname ?? '';
  set pushname(String? val) => _pushname = val;

  bool hasPushname() => _pushname != null;

  // "conversation" field.
  String? _conversation;
  String get conversation => _conversation ?? '';
  set conversation(String? val) => _conversation = val;

  bool hasConversation() => _conversation != null;

  // "messagetype" field.
  String? _messagetype;
  String get messagetype => _messagetype ?? '';
  set messagetype(String? val) => _messagetype = val;

  bool hasMessagetype() => _messagetype != null;

  // "connected_phone" field.
  String? _connectedPhone;
  String get connectedPhone => _connectedPhone ?? '';
  set connectedPhone(String? val) => _connectedPhone = val;

  bool hasConnectedPhone() => _connectedPhone != null;

  // "server_url" field.
  String? _serverUrl;
  String get serverUrl => _serverUrl ?? '';
  set serverUrl(String? val) => _serverUrl = val;

  bool hasServerUrl() => _serverUrl != null;

  // "apikey" field.
  String? _apikey;
  String get apikey => _apikey ?? '';
  set apikey(String? val) => _apikey = val;

  bool hasApikey() => _apikey != null;

  // "mediaurl" field.
  String? _mediaurl;
  String get mediaurl => _mediaurl ?? '';
  set mediaurl(String? val) => _mediaurl = val;

  bool hasMediaurl() => _mediaurl != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;

  bool hasCaption() => _caption != null;

  // "thumb" field.
  String? _thumb;
  String get thumb => _thumb ?? '';
  set thumb(String? val) => _thumb = val;

  bool hasThumb() => _thumb != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "participant" field.
  String? _participant;
  String get participant => _participant ?? '';
  set participant(String? val) => _participant = val;

  bool hasParticipant() => _participant != null;

  // "isgroup" field.
  bool? _isgroup;
  bool get isgroup => _isgroup ?? false;
  set isgroup(bool? val) => _isgroup = val;

  bool hasIsgroup() => _isgroup != null;

  // "messagetimestamp" field.
  int? _messagetimestamp;
  int get messagetimestamp => _messagetimestamp ?? 0;
  set messagetimestamp(int? val) => _messagetimestamp = val;

  void incrementMessagetimestamp(int amount) =>
      messagetimestamp = messagetimestamp + amount;

  bool hasMessagetimestamp() => _messagetimestamp != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;

  void incrementWidth(int amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "atualizado" field.
  bool? _atualizado;
  bool get atualizado => _atualizado ?? false;
  set atualizado(bool? val) => _atualizado = val;

  bool hasAtualizado() => _atualizado != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "clicado" field.
  bool? _clicado;
  bool get clicado => _clicado ?? false;
  set clicado(bool? val) => _clicado = val;

  bool hasClicado() => _clicado != null;

  // "metadado" field.
  String? _metadado;
  String get metadado => _metadado ?? '';
  set metadado(String? val) => _metadado = val;

  bool hasMetadado() => _metadado != null;

  static ConversasStruct fromMap(Map<String, dynamic> data) => ConversasStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        evento: data['evento'] as String?,
        instance: data['instance'] as String?,
        remotejid: data['remotejid'] as String?,
        fromme: data['fromme'] as bool?,
        messageid: data['messageid'] as String?,
        pushname: data['pushname'] as String?,
        conversation: data['conversation'] as String?,
        messagetype: data['messagetype'] as String?,
        connectedPhone: data['connected_phone'] as String?,
        serverUrl: data['server_url'] as String?,
        apikey: data['apikey'] as String?,
        mediaurl: data['mediaurl'] as String?,
        caption: data['caption'] as String?,
        thumb: data['thumb'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        participant: data['participant'] as String?,
        isgroup: data['isgroup'] as bool?,
        messagetimestamp: castToType<int>(data['messagetimestamp']),
        height: castToType<int>(data['height']),
        width: castToType<int>(data['width']),
        title: data['title'] as String?,
        atualizado: data['atualizado'] as bool?,
        titulo: data['titulo'] as String?,
        foto: data['foto'] as String?,
        clicado: data['clicado'] as bool?,
        metadado: data['metadado'] as String?,
      );

  static ConversasStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'evento': _evento,
        'instance': _instance,
        'remotejid': _remotejid,
        'fromme': _fromme,
        'messageid': _messageid,
        'pushname': _pushname,
        'conversation': _conversation,
        'messagetype': _messagetype,
        'connected_phone': _connectedPhone,
        'server_url': _serverUrl,
        'apikey': _apikey,
        'mediaurl': _mediaurl,
        'caption': _caption,
        'thumb': _thumb,
        'latitude': _latitude,
        'longitude': _longitude,
        'participant': _participant,
        'isgroup': _isgroup,
        'messagetimestamp': _messagetimestamp,
        'height': _height,
        'width': _width,
        'title': _title,
        'atualizado': _atualizado,
        'titulo': _titulo,
        'foto': _foto,
        'clicado': _clicado,
        'metadado': _metadado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'evento': serializeParam(
          _evento,
          ParamType.String,
        ),
        'instance': serializeParam(
          _instance,
          ParamType.String,
        ),
        'remotejid': serializeParam(
          _remotejid,
          ParamType.String,
        ),
        'fromme': serializeParam(
          _fromme,
          ParamType.bool,
        ),
        'messageid': serializeParam(
          _messageid,
          ParamType.String,
        ),
        'pushname': serializeParam(
          _pushname,
          ParamType.String,
        ),
        'conversation': serializeParam(
          _conversation,
          ParamType.String,
        ),
        'messagetype': serializeParam(
          _messagetype,
          ParamType.String,
        ),
        'connected_phone': serializeParam(
          _connectedPhone,
          ParamType.String,
        ),
        'server_url': serializeParam(
          _serverUrl,
          ParamType.String,
        ),
        'apikey': serializeParam(
          _apikey,
          ParamType.String,
        ),
        'mediaurl': serializeParam(
          _mediaurl,
          ParamType.String,
        ),
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
        'thumb': serializeParam(
          _thumb,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'participant': serializeParam(
          _participant,
          ParamType.String,
        ),
        'isgroup': serializeParam(
          _isgroup,
          ParamType.bool,
        ),
        'messagetimestamp': serializeParam(
          _messagetimestamp,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'atualizado': serializeParam(
          _atualizado,
          ParamType.bool,
        ),
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'clicado': serializeParam(
          _clicado,
          ParamType.bool,
        ),
        'metadado': serializeParam(
          _metadado,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversasStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        evento: deserializeParam(
          data['evento'],
          ParamType.String,
          false,
        ),
        instance: deserializeParam(
          data['instance'],
          ParamType.String,
          false,
        ),
        remotejid: deserializeParam(
          data['remotejid'],
          ParamType.String,
          false,
        ),
        fromme: deserializeParam(
          data['fromme'],
          ParamType.bool,
          false,
        ),
        messageid: deserializeParam(
          data['messageid'],
          ParamType.String,
          false,
        ),
        pushname: deserializeParam(
          data['pushname'],
          ParamType.String,
          false,
        ),
        conversation: deserializeParam(
          data['conversation'],
          ParamType.String,
          false,
        ),
        messagetype: deserializeParam(
          data['messagetype'],
          ParamType.String,
          false,
        ),
        connectedPhone: deserializeParam(
          data['connected_phone'],
          ParamType.String,
          false,
        ),
        serverUrl: deserializeParam(
          data['server_url'],
          ParamType.String,
          false,
        ),
        apikey: deserializeParam(
          data['apikey'],
          ParamType.String,
          false,
        ),
        mediaurl: deserializeParam(
          data['mediaurl'],
          ParamType.String,
          false,
        ),
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        thumb: deserializeParam(
          data['thumb'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        participant: deserializeParam(
          data['participant'],
          ParamType.String,
          false,
        ),
        isgroup: deserializeParam(
          data['isgroup'],
          ParamType.bool,
          false,
        ),
        messagetimestamp: deserializeParam(
          data['messagetimestamp'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        atualizado: deserializeParam(
          data['atualizado'],
          ParamType.bool,
          false,
        ),
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        clicado: deserializeParam(
          data['clicado'],
          ParamType.bool,
          false,
        ),
        metadado: deserializeParam(
          data['metadado'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversasStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        evento == other.evento &&
        instance == other.instance &&
        remotejid == other.remotejid &&
        fromme == other.fromme &&
        messageid == other.messageid &&
        pushname == other.pushname &&
        conversation == other.conversation &&
        messagetype == other.messagetype &&
        connectedPhone == other.connectedPhone &&
        serverUrl == other.serverUrl &&
        apikey == other.apikey &&
        mediaurl == other.mediaurl &&
        caption == other.caption &&
        thumb == other.thumb &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        participant == other.participant &&
        isgroup == other.isgroup &&
        messagetimestamp == other.messagetimestamp &&
        height == other.height &&
        width == other.width &&
        title == other.title &&
        atualizado == other.atualizado &&
        titulo == other.titulo &&
        foto == other.foto &&
        clicado == other.clicado &&
        metadado == other.metadado;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        evento,
        instance,
        remotejid,
        fromme,
        messageid,
        pushname,
        conversation,
        messagetype,
        connectedPhone,
        serverUrl,
        apikey,
        mediaurl,
        caption,
        thumb,
        latitude,
        longitude,
        participant,
        isgroup,
        messagetimestamp,
        height,
        width,
        title,
        atualizado,
        titulo,
        foto,
        clicado,
        metadado
      ]);
}

ConversasStruct createConversasStruct({
  int? id,
  String? createdAt,
  String? evento,
  String? instance,
  String? remotejid,
  bool? fromme,
  String? messageid,
  String? pushname,
  String? conversation,
  String? messagetype,
  String? connectedPhone,
  String? serverUrl,
  String? apikey,
  String? mediaurl,
  String? caption,
  String? thumb,
  String? latitude,
  String? longitude,
  String? participant,
  bool? isgroup,
  int? messagetimestamp,
  int? height,
  int? width,
  String? title,
  bool? atualizado,
  String? titulo,
  String? foto,
  bool? clicado,
  String? metadado,
}) =>
    ConversasStruct(
      id: id,
      createdAt: createdAt,
      evento: evento,
      instance: instance,
      remotejid: remotejid,
      fromme: fromme,
      messageid: messageid,
      pushname: pushname,
      conversation: conversation,
      messagetype: messagetype,
      connectedPhone: connectedPhone,
      serverUrl: serverUrl,
      apikey: apikey,
      mediaurl: mediaurl,
      caption: caption,
      thumb: thumb,
      latitude: latitude,
      longitude: longitude,
      participant: participant,
      isgroup: isgroup,
      messagetimestamp: messagetimestamp,
      height: height,
      width: width,
      title: title,
      atualizado: atualizado,
      titulo: titulo,
      foto: foto,
      clicado: clicado,
      metadado: metadado,
    );
