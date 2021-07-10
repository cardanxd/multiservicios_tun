// To parse this JSON data, do
//
//     final clienteData = clienteDataFromJson(jsonString);

import 'dart:convert';

ClienteData clienteGetDataFromJson(String str) =>
    ClienteData.fromJson(json.decode(str));

String clienteDataToJson(ClienteData data) => json.encode(data.toJson());

class ClienteData {
  ClienteData({
    this.data,
  });

  List<Cliente> data;

  factory ClienteData.fromJson(Map<String, dynamic> json) => ClienteData(
        data: List<Cliente>.from(json["data"].map((x) => Cliente.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Cliente {
  Cliente({
    this.id,
    this.nombre,
    this.razon,
    this.rfc,
    this.email,
    this.calle,
    this.exterior,
    this.interior,
    this.ecalle,
    this.ycalle,
    this.colonia,
    this.postal,
    this.ciudad,
    this.estado,
    this.pais,
    this.particular,
    this.oficina,
    this.movil,
    this.birthday,
  });

  int id;
  String nombre;
  String razon;
  String rfc;
  String email;
  String calle;
  String exterior;
  String interior;
  String ecalle;
  String ycalle;
  String colonia;
  String postal;
  String ciudad;
  String estado;
  String pais;
  String particular;
  String oficina;
  String movil;
  DateTime birthday;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        razon: json["razon"],
        rfc: json["rfc"],
        email: json["email"],
        calle: json["calle"],
        exterior: json["exterior"],
        interior: json["interior"],
        ecalle: json["ecalle"],
        ycalle: json["ycalle"],
        colonia: json["colonia"],
        postal: json["postal"],
        ciudad: json["ciudad"],
        estado: json["estado"],
        pais: json["pais"],
        particular: json["particular"],
        oficina: json["oficina"],
        movil: json["movil"],
        birthday: DateTime.parse(json["birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "razon": razon,
        "rfc": rfc,
        "email": email,
        "calle": calle,
        "exterior": exterior,
        "interior": interior,
        "ecalle": ecalle,
        "ycalle": ycalle,
        "colonia": colonia,
        "postal": postal,
        "ciudad": ciudad,
        "estado": estado,
        "pais": pais,
        "particular": particular,
        "oficina": oficina,
        "movil": movil,
        "birthday": birthday.toIso8601String(),
      };
}
