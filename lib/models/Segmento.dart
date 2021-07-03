// To parse this JSON data, do
//
//     final segmento = segmentoFromJson(jsonString);

import 'dart:convert';

Segmento segmentoFromJson(String str) => Segmento.fromJson(json.decode(str));

String segmentoToJson(Segmento data) => json.encode(data.toJson());

class Segmento {
  Segmento({
    this.id,
    this.nombre,
  });

  int id;
  String nombre;

  factory Segmento.fromJson(Map<String, dynamic> json) => Segmento(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
