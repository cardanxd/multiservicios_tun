// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
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
    this.limitecredito,
    this.diascredito,
    this.diasbloqueo,
    this.descuento,
    this.birthday,
    this.sucursal,
    this.segmento,
    this.giro,
  });

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
  double limitecredito;
  int diascredito;
  int diasbloqueo;
  String descuento;
  DateTime birthday;
  int sucursal;
  int segmento;
  int giro;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nombre: json["nombre"] as String,
        razon: json["razon"] as String,
        rfc: json["rfc"] as String,
        email: json["email"] as String,
        calle: json["calle"] as String,
        exterior: json["exterior"] as String,
        interior: json["interior"] as String,
        ecalle: json["ecalle"] as String,
        ycalle: json["ycalle"] as String,
        colonia: json["colonia"] as String,
        postal: json["postal"] as String,
        ciudad: json["ciudad"] as String,
        estado: json["estado"] as String,
        pais: json["pais"] as String,
        particular: json["particular"] as String,
        oficina: json["oficina"] as String,
        movil: json["movil"] as String,
        limitecredito: json["limitecredito"] as double,
        diascredito: json["diascredito"] as int,
        diasbloqueo: json["diasbloqueo"] as int,
        descuento: json["descuento"] as String,
        birthday: (json["birthday"]) as DateTime,
        sucursal: json["sucursal"] as int,
        segmento: json["segmento"] as int,
        giro: json["giro"] as int,
      );

  Map<String, dynamic> toJson() => {
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
        "limitecredito": limitecredito,
        "diascredito": diascredito,
        "diasbloqueo": diasbloqueo,
        "descuento": descuento,
        "birthday": birthday,
        "sucursal": sucursal,
        "segmento": segmento,
        "giro": giro,
      };
}
