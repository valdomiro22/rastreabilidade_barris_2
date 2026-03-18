import 'dart:developer' as dev;

import 'package:intl/date_symbol_data_local.dart' as date_local_data;
import 'package:intl/intl.dart';

class StringUtil {
  static String? formatarData(String? data) {
    date_local_data.initializeDateFormatting('pt_BR');
    final formatador = DateFormat.yMd('pt_br');

    if (data != null) {
      DateTime dataConvertida = DateTime.parse(data);
      String dataFormatada = formatador.format(dataConvertida);
      return dataFormatada;
    } else {
      return null;
    }
  }

  static String? formatarDataComPontos(String? data) {
    date_local_data.initializeDateFormatting('pt_BR');
    final formatador = DateFormat('dd.MM.yyyy', 'pt_br');

    if (data != null) {
      DateTime dataConvertida = DateTime.parse(data);
      String dataFormatada = formatador.format(dataConvertida);
      return dataFormatada;
    } else {
      return null;
    }
  }

  static DateTime? stringParaDateTime(String data) {
    try {
      final DateFormat format = DateFormat('dd/MM/yyyy');
      DateTime novaData = format.parse(data);
      return novaData;
    } catch (e) {
      dev.log('Erro ao formatar data');
      return null;
    }
  }

  static String formatarDataBarrasParaPontos(String data) {
    return data.replaceAll('/', '.');
  }

  static Future<String> formatarHora(String data) async {
    await date_local_data.initializeDateFormatting('pt_BR');
    final formatador = DateFormat.Hms('pt_br');

    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  static String formatarHoraSincrona(String data) {
    final formatador = DateFormat.Hms('pt_BR');
    final dataConvertida = DateTime.parse(data);
    return formatador.format(dataConvertida);
  }

  static String capitalize(String text) {
    if (text.isEmpty) {
      return '';
    }
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }

  static DateTime hojeSemHorario() {
    final dataCompleta = DateTime.now();
    final dataSemHora = DateTime(dataCompleta.year, dataCompleta.month, dataCompleta.day);
    return dataSemHora;
  }

  static DateTime agoraSemData() {
    final dataCompleta = DateTime.now();
    final horarioSemData = DateTime(dataCompleta.hour, dataCompleta.minute, dataCompleta.second);
    return horarioSemData;
  }

  static DateTime agoraSemSegundos() {
    final dataCompleta = DateTime.now();
    final horarioSemSegundos = DateTime(dataCompleta.hour, dataCompleta.minute);
    return horarioSemSegundos;
  }
}