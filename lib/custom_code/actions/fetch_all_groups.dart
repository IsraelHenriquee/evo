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

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAllGroups(
  String serverURL,
  String instance,
  bool? getParticipants,
  String apikey,
) async {
  // Add your function code here!
  final queryParams = '?getParticipants=${getParticipants ?? false}';

  final url =
      Uri.parse('$serverURL/group/fetchAllGroups/$instance$queryParams');

  final response = await http.get(
    url,
    headers: {'apikey': apikey},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as List<dynamic>;
  } else {
    final errorResponse = jsonDecode(response.body);
    throw Exception(
        'Error ${response.statusCode}: ${errorResponse['response']['message']}');
  }
}
