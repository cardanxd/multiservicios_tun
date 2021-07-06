// To parse this JSON data, do
//
//     final sucursalData = sucursalDataFromJson(jsonString);

import 'dart:convert';

SucursalData sucursalDataFromJson(String str) =>
    SucursalData.fromJson(json.decode(str));

String sucursalDataToJson(SucursalData data) => json.encode(data.toJson());

class SucursalData {
  SucursalData({
    this.data,
  });

  List<Sucursal> data;

  factory SucursalData.fromJson(Map<String, dynamic> json) => SucursalData(
        data:
            List<Sucursal>.from(json["data"].map((x) => Sucursal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Sucursal {
  Sucursal({
    this.id,
    this.descripcion,
    this.empresa,
    this.centroCosto,
    this.cuentaContable,
    this.estado,
    this.zona,
  });

  int id;
  String descripcion;
  String empresa;
  dynamic centroCosto;
  dynamic cuentaContable;
  String estado;
  String zona;

  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        descripcion: json["descripcion"],
        empresa: json["empresa"],
        centroCosto: json["centro_costo"],
        cuentaContable: json["cuenta_contable"],
        estado: json["estado"],
        zona: json["zona"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "empresa": empresa,
        "centro_costo": centroCosto,
        "cuenta_contable": cuentaContable,
        "estado": estado,
        "zona": zona,
      };
}
