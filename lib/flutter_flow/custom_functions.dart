import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String getMessagePreview(String messageType) {
  switch (messageType) {
    case 'imageMessage':
      return '📷 Foto';
    case 'videoMessage':
      return '🎥 Vídeo';
    case 'documentMessage':
      return '📄 Documento';
    case 'audioMessage':
      return '🎵 Áudio';
    case 'stickerMessage':
      return '🖼️ Figurinha';
    case 'contactMessage':
      return '📇 Contato';
    case 'locationMessage':
      return '📍 Localização';
    case 'extendedTextMessage':
      return '✏️ Texto formatado';
    case 'buttonsMessage':
      return '🔘 Botão interativo';
    case 'templateMessage':
      return '📑 Template';
    case 'reactionMessage':
      return '❤️ Reação';
    case 'pollCreationMessage':
      return '📊 Enquete';
    case 'listMessage':
      return '📝 Lista interativa';
    case 'liveLocationMessage':
      return '🚶📍 Localização ao vivo';
    case 'productMessage':
      return '🛍️ Produto';
    default:
      return '❓ Tipo desconhecido';
  }
}

String getmimetype(String fileUrl) {
  // Extrai a extensão do arquivo
  final extension = fileUrl.split('.').last.toLowerCase();

  // Mapeia extensões para MIME types
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'gif':
      return 'image/gif';
    case 'pdf':
      return 'application/pdf';
    case 'csv':
      return 'text/csv';
    case 'mp4':
      return 'video/mp4';
    case 'mp3':
      return 'audio/mpeg';
    case 'wav':
      return 'audio/wav';
    case 'txt':
      return 'text/plain';
    case 'html':
      return 'text/html';
    case 'json':
      return 'application/json';
    case 'xml':
      return 'application/xml';
    case 'zip':
      return 'application/zip';
    case 'doc':
    case 'docx':
      return 'application/msword';
    case 'ppt':
    case 'pptx':
      return 'application/vnd.ms-powerpoint';
    case 'xls':
    case 'xlsx':
      return 'application/vnd.ms-excel';
    case 'avi':
      return 'video/x-msvideo';
    default:
      return 'application/octet-stream'; // Tipo genérico para arquivos desconhecidos
  }
}

String formatWhatsAppMessage(
  String name,
  String message,
) {
  return '*$name:*\n$message';
}
