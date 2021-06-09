// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

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
    this.limitecredito,
    this.diascredito,
    this.diasbloqueo,
    this.descuento,
    this.birthday,
    this.sucursal,
    this.segmento,
    this.giro,
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
  double limitecredito;
  int diascredito;
  int diasbloqueo;
  String descuento;
  DateTime birthday;
  int sucursal;
  int segmento;
  int giro;

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
        limitecredito: json["limitecredito"].toDouble(),
        diascredito: json["diascredito"],
        diasbloqueo: json["diasbloqueo"],
        descuento: json["descuento"],
        birthday: DateTime.parse(json["birthday"]),
        sucursal: json["sucursal"],
        segmento: json["segmento"],
        giro: json["giro"],
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
        "limitecredito": limitecredito,
        "diascredito": diascredito,
        "diasbloqueo": diasbloqueo,
        "descuento": descuento,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "sucursal": sucursal,
        "segmento": segmento,
        "giro": giro,
      };
}
