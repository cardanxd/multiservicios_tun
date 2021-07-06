// To parse this JSON data, do
//
//     final vehiculoData = vehiculoDataFromJson(jsonString);

import 'dart:convert';

VehiculoData vehiculoDataGetFromJson(String str) =>
    VehiculoData.fromJson(json.decode(str));

String vehiculoDataToJson(VehiculoData data) => json.encode(data.toJson());

class VehiculoData {
  VehiculoData({
    this.data,
  });

  List<Vehiculo> data;

  factory VehiculoData.fromJson(Map<String, dynamic> json) => VehiculoData(
        data:
            List<Vehiculo>.from(json["data"].map((x) => Vehiculo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Vehiculo {
  Vehiculo({
    this.id,
    this.clienteId,
    this.equipoId,
    this.marca,
    this.modelo,
    this.serie,
    this.economico,
    this.placa,
  });

  int id;
  int clienteId;
  int equipoId;
  String marca;
  String modelo;
  String serie;
  String economico;
  String placa;

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        id: json["id"],
        clienteId: json["cliente_id"],
        equipoId: json["equipo_id"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        economico: json["economico"],
        placa: json["placa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cliente_id": clienteId,
        "equipo_id": equipoId,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "economico": economico,
        "placa": placa,
      };
}
