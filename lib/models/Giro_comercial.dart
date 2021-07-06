// To parse this JSON data, do
//
//     final giroData = giroDataFromJson(jsonString);

import 'dart:convert';

GiroData giroDataFromJson(String str) => GiroData.fromJson(json.decode(str));

String giroDataToJson(GiroData data) => json.encode(data.toJson());

class GiroData {
  GiroData({
    this.data,
  });

  List<Giro> data;

  factory GiroData.fromJson(Map<String, dynamic> json) => GiroData(
        data: List<Giro>.from(json["data"].map((x) => Giro.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Giro {
  Giro({
    this.id,
    this.descripcion,
    this.estado,
  });

  int id;
  String descripcion;
  String estado;

  factory Giro.fromJson(Map<String, dynamic> json) => Giro(
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
