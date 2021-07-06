// To parse this JSON data, do
//
//     final centrocosto = centrocostoFromJson(jsonString);

import 'dart:convert';

Centrocosto centrocostoFromJson(String str) =>
    Centrocosto.fromJson(json.decode(str));

String centrocostoToJson(Centrocosto data) => json.encode(data.toJson());

class Centrocosto {
  Centrocosto({
    this.data,
  });

  List<CentroCosto> data;

  factory Centrocosto.fromJson(Map<String, dynamic> json) => Centrocosto(
        data: List<CentroCosto>.from(
            json["data"].map((x) => CentroCosto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CentroCosto {
  CentroCosto({
    this.id,
    this.descripcion,
    this.estado,
  });

  int id;
  String descripcion;
  String estado;

  factory CentroCosto.fromJson(Map<String, dynamic> json) => CentroCosto(
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
