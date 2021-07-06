// To parse this JSON data, do
//
//     final equipoData = equipoDataFromJson(jsonString);

import 'dart:convert';

EquipoData equipoDataFromJson(String str) =>
    EquipoData.fromJson(json.decode(str));

String equipoDataToJson(EquipoData data) => json.encode(data.toJson());

class EquipoData {
  EquipoData({
    this.data,
  });

  List<Equipo> data;

  factory EquipoData.fromJson(Map<String, dynamic> json) => EquipoData(
        data: List<Equipo>.from(json["data"].map((x) => Equipo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Equipo {
  Equipo({
    this.id,
    this.descripcion,
    this.estado,
  });

  int id;
  String descripcion;
  String estado;

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        id: json["id"],
        descripcion: json["descripcion"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "estado": estado,
      };
}
