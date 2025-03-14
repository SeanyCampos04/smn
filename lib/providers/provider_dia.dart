import 'package:flutter/material.dart';
import 'package:smn/models/modelo_dia.dart';
import 'package:smn/services/servicio_carga_dia.dart';

class ProviderDias with ChangeNotifier {
  List<ModeloDia> _dias = [];
  bool _esta_cargando = false;

  List<ModeloDia> get dia => _dias;
  bool get estaCargando => _esta_cargando;

  Future<void> CargaDia(int index) async {
    _esta_cargando = true;
    notifyListeners();

    try {
      if (_dias.isEmpty) {
        _dias = await ServicioCargaDias().descargaDias(index);

      } 
    } catch (error) {
      print(error);
    } finally {
      notifyListeners();
    }
  }
}