// To parse this JSON data, do
//
//     final sucursal = sucursalFromJson(jsonString);

import 'dart:convert';

Sucursal sucursalFromJson(String str) => Sucursal.fromJson(json.decode(str));

String sucursalToJson(Sucursal data) => json.encode(data.toJson());

class Sucursal {
  Sucursal({
    this.id,
    this.nombre,
  });

  int id;
  String nombre;

  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
