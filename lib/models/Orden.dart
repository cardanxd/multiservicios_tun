// To parse this JSON data, do
//
//     final orden = ordenFromJson(jsonString);

import 'dart:convert';

Orden ordenFromJson(String str) => Orden.fromJson(json.decode(str));

String ordenToJson(Orden data) => json.encode(data.toJson());

class Orden {
  Orden({
    this.fecha,
    this.vendedor,
    this.cliente,
    this.vehiculo,
    this.cilindros,
    this.condicionventa,
    this.urgenciainicial,
    this.atencion,
    this.comentarios,
    this.centrocosto,
    this.placa,
    this.ceniceros,
    this.cristalesRotos,
    this.quemacocos,
    this.espejoIzq,
    this.espejoDer,
    this.tapon,
    this.antena,
    this.tapetes,
    this.varilla,
    this.radio,
    this.espejoInt,
    this.gato,
    this.extinguidor,
    this.emblemas,
    this.encendedor,
    this.llanta,
    this.km,
    this.combustible,
    this.transmision,
    this.vestiduras,
  });

  DateTime fecha;
  String vendedor;
  int cliente;
  int vehiculo;
  String cilindros;
  String condicionventa;
  String urgenciainicial;
  String atencion;
  String comentarios;
  String centrocosto;
  String placa;
  String ceniceros;
  String cristalesRotos;
  String quemacocos;
  String espejoIzq;
  String espejoDer;
  String tapon;
  String antena;
  String tapetes;
  String varilla;
  String radio;
  String espejoInt;
  String gato;
  String extinguidor;
  String emblemas;
  String encendedor;
  String llanta;
  double km;
  double combustible;
  String transmision;
  String vestiduras;

  factory Orden.fromJson(Map<String, dynamic> json) => Orden(
        fecha: DateTime.parse(json["fecha"]),
        vendedor: json["vendedor"],
        cliente: json["cliente"],
        vehiculo: json["vehiculo"],
        cilindros: json["cilindros"],
        condicionventa: json["condicionventa"],
        urgenciainicial: json["urgenciainicial"],
        atencion: json["atencion"],
        comentarios: json["comentarios"],
        centrocosto: json["centrocosto"],
        placa: json["placa"],
        ceniceros: json["ceniceros"],
        cristalesRotos: json["cristales_rotos"],
        quemacocos: json["quemacocos"],
        espejoIzq: json["espejo_izq"],
        espejoDer: json["espejo_der"],
        tapon: json["tapon"],
        antena: json["antena"],
        tapetes: json["tapetes"],
        varilla: json["varilla"],
        radio: json["radio"],
        espejoInt: json["espejo_int"],
        gato: json["gato"],
        extinguidor: json["extinguidor"],
        emblemas: json["emblemas"],
        encendedor: json["encendedor"],
        llanta: json["llanta"],
        km: json["km"].toDouble(),
        combustible: json["combustible"].toDouble(),
        transmision: json["transmision"],
        vestiduras: json["vestiduras"],
      );

  Map<String, dynamic> toJson() => {
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "vendedor": vendedor,
        "cliente": cliente,
        "vehiculo": vehiculo,
        "cilindros": cilindros,
        "condicionventa": condicionventa,
        "urgenciainicial": urgenciainicial,
        "atencion": atencion,
        "comentarios": comentarios,
        "centrocosto": centrocosto,
        "placa": placa,
        "ceniceros": ceniceros,
        "cristales_rotos": cristalesRotos,
        "quemacocos": quemacocos,
        "espejo_izq": espejoIzq,
        "espejo_der": espejoDer,
        "tapon": tapon,
        "antena": antena,
        "tapetes": tapetes,
        "varilla": varilla,
        "radio": radio,
        "espejo_int": espejoInt,
        "gato": gato,
        "extinguidor": extinguidor,
        "emblemas": emblemas,
        "encendedor": encendedor,
        "llanta": llanta,
        "km": km,
        "combustible": combustible,
        "transmision": transmision,
        "vestiduras": vestiduras,
      };
}
