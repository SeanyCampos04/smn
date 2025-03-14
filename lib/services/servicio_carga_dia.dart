import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smn/models/modelo_dia.dart';

class ServicioCargaDias {
  Future<List<ModeloDia>> descargaDias(int index) async{
    try{
      final String respuesta = 
      await rootBundle.loadString('assets/data/dia{$index+1}.json');

      List<dynamic> dias = jsonDecode(respuesta);
      return dias.map((dia) => ModeloDia.fromJson(dia)).toList();
    } catch (e) {
      return [];
    }
  }
}

