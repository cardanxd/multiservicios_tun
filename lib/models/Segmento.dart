// To parse this JSON data, do
//
//     final segmentoData = segmentoDataFromJson(jsonString);

import 'dart:convert';

SegmentoData segmentoDataFromJson(String str) =>
    SegmentoData.fromJson(json.decode(str));

String segmentoDataToJson(SegmentoData data) => json.encode(data.toJson());

class SegmentoData {
  SegmentoData({
    this.data,
  });

  List<Segmento> data;

  factory SegmentoData.fromJson(Map<String, dynamic> json) => SegmentoData(
        data:
            List<Segmento>.from(json["data"].map((x) => Segmento.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Segmento {
  Segmento({
    this.id,
    this.descripcion,
    this.estado,
  });

  int id;
  String descripcion;
  String estado;

  factory Segmento.fromJson(Map<String, dynamic> json) => Segmento(
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
