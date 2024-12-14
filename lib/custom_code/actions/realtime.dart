// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future realtime(
  Future Function(dynamic linha) acao,
  String table,
) async {
  // Add your function code here!
  final supabase = SupaFlow.client;

  // Configura o canal para monitorar mudanças no banco de dados
  final channel = supabase.channel('public:$table');

  // Adiciona a assinatura para eventos no Postgres (INSERT)
  channel
      .onPostgresChanges(
        event: PostgresChangeEvent.insert, // Escuta eventos de INSERT
        schema: 'public', // Esquema do banco de dados
        table: table, // Nome da tabela
        callback: (payload) {
          acao(payload.newRecord); // Passa o payload para a função fornecida
        },
      )
      .subscribe(); // Ativa o canal
}
