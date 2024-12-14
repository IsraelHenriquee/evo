import '../database.dart';

class InstanciasTable extends SupabaseTable<InstanciasRow> {
  @override
  String get tableName => 'instancias';

  @override
  InstanciasRow createRow(Map<String, dynamic> data) => InstanciasRow(data);
}

class InstanciasRow extends SupabaseDataRow {
  InstanciasRow(super.data);

  @override
  SupabaseTable get table => InstanciasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
