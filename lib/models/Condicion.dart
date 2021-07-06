// To parse this JSON data, do
//
//     final condicionData = condicionDataFromJson(jsonString);

import 'dart:convert';

CondicionData condicionDataFromJson(String str) =>
    CondicionData.fromJson(json.decode(str));

String condicionDataToJson(CondicionData data) => json.encode(data.toJson());

class CondicionData {
  CondicionData({
    this.data,
  });

  List<Condicion> data;

  factory CondicionData.fromJson(Map<String, dynamic> json) => CondicionData(
        data: List<Condicion>.from(
            json["data"].map((x) => Condicion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Condicion {
  Condicion({
    this.id,
    this.descripcion,
    this.tipo,
    this.estado,
  });

  int id;
  String descripcion;
  String tipo;
  String estado;

  factory Condicion.fromJson(Map<String, dynamic> json) => Condicion(
        id: json["id"],
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "tipo": tipo,
        "estado": estado,
      };
}
