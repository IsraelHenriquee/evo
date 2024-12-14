import '../database.dart';

class EvoConversasTable extends SupabaseTable<EvoConversasRow> {
  @override
  String get tableName => 'evo_conversas';

  @override
  EvoConversasRow createRow(Map<String, dynamic> data) => EvoConversasRow(data);
}

class EvoConversasRow extends SupabaseDataRow {
  EvoConversasRow(super.data);

  @override
  SupabaseTable get table => EvoConversasTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get evento => getField<String>('evento');
  set evento(String? value) => setField<String>('evento', value);

  String? get instance => getField<String>('instance');
  set instance(String? value) => setField<String>('instance', value);

  String? get remotejid => getField<String>('remotejid');
  set remotejid(String? value) => setField<String>('remotejid', value);

  bool? get fromme => getField<bool>('fromme');
  set fromme(bool? value) => setField<bool>('fromme', value);

  String? get messageid => getField<String>('messageid');
  set messageid(String? value) => setField<String>('messageid', value);

  String? get pushname => getField<String>('pushname');
  set pushname(String? value) => setField<String>('pushname', value);

  String? get conversation => getField<String>('conversation');
  set conversation(String? value) => setField<String>('conversation', value);

  String? get messagetype => getField<String>('messagetype');
  set messagetype(String? value) => setField<String>('messagetype', value);

  String? get connectedPhone => getField<String>('connected_phone');
  set connectedPhone(String? value) =>
      setField<String>('connected_phone', value);

  String? get serverUrl => getField<String>('server_url');
  set serverUrl(String? value) => setField<String>('server_url', value);

  String? get apikey => getField<String>('apikey');
  set apikey(String? value) => setField<String>('apikey', value);

  String? get mediaurl => getField<String>('mediaurl');
  set mediaurl(String? value) => setField<String>('mediaurl', value);

  String? get caption => getField<String>('caption');
  set caption(String? value) => setField<String>('caption', value);

  String? get thumb => getField<String>('thumb');
  set thumb(String? value) => setField<String>('thumb', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get participant => getField<String>('participant');
  set participant(String? value) => setField<String>('participant', value);

  bool? get isgroup => getField<bool>('isgroup');
  set isgroup(bool? value) => setField<bool>('isgroup', value);

  int? get messagetimestamp => getField<int>('messagetimestamp');
  set messagetimestamp(int? value) => setField<int>('messagetimestamp', value);

  int? get height => getField<int>('height');
  set height(int? value) => setField<int>('height', value);

  int? get width => getField<int>('width');
  set width(int? value) => setField<int>('width', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
