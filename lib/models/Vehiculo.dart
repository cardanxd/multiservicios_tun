// To parse this JSON data, do
//
//     final vehiculo = vehiculoFromJson(jsonString);

import 'dart:convert';

Vehiculo vehiculoFromJson(String str) => Vehiculo.fromJson(json.decode(str));

String vehiculoToJson(Vehiculo data) => json.encode(data.toJson());

class Vehiculo {
  Vehiculo({
    this.cliente,
    this.tipo,
    this.marca,
    this.modelo,
    this.serie,
    this.economico,
    this.placa,
  });

  int cliente;
  String tipo;
  String marca;
  String modelo;
  String serie;
  String economico;
  String placa;

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        cliente: json["cliente"] as int,
        tipo: json["tipo"] as String,
        marca: json["marca"] as String,
        modelo: json["modelo"] as String,
        serie: json["serie"] as String,
        economico: json["economico"] as String,
        placa: json["placa"] as String,
      );

  Map<String, dynamic> toJson() => {
        "cliente": cliente,
        "tipo": tipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "economico": economico,
        "placa": placa,
      };
}
