// To parse this JSON data, do
//
//     final vehiculo = vehiculoFromJson(jsonString);

import 'dart:convert';

Vehiculo vehiculoFromJson(String str) => Vehiculo.fromJson(json.decode(str));

String vehiculoToJson(Vehiculo data) => json.encode(data.toJson());

class Vehiculo {
  Vehiculo({
    this.id,
    this.clienteId,
    this.equipo,
    this.marca,
    this.modelo,
    this.serie,
    this.economico,
    this.placa,
  });

  int id;
  int clienteId;
  String equipo;
  String marca;
  String modelo;
  String serie;
  String economico;
  String placa;

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        id: json["id"] as int,
        clienteId: json["cliente_id"] as int,
        equipo: json["equipo"] as String,
        marca: json["marca"] as String,
        modelo: json["modelo"] as String,
        serie: json["serie"] as String,
        economico: json["economico"] as String,
        placa: json["placa"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cliente_id": clienteId,
        "equipo": equipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "economico": economico,
        "placa": placa,
      };
}
