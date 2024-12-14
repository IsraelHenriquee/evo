import '../database.dart';

class EvoLastsenderTable extends SupabaseTable<EvoLastsenderRow> {
  @override
  String get tableName => 'evo_lastsender';

  @override
  EvoLastsenderRow createRow(Map<String, dynamic> data) =>
      EvoLastsenderRow(data);
}

class EvoLastsenderRow extends SupabaseDataRow {
  EvoLastsenderRow(super.data);

  @override
  SupabaseTable get table => EvoLastsenderTable();

  String? get remotejid => getField<String>('remotejid');
  set remotejid(String? value) => setField<String>('remotejid', value);

  String? get pushname => getField<String>('pushname');
  set pushname(String? value) => setField<String>('pushname', value);

  String? get connectedPhone => getField<String>('connected_phone');
  set connectedPhone(String? value) =>
      setField<String>('connected_phone', value);
}
