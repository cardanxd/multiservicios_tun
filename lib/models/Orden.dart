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
    this.clienteId,
    this.vehiculoId,
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
  int clienteId;
  int vehiculoId;
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
        fecha: json["fecha"] as DateTime,
        vendedor: json["vendedor"] as String,
        clienteId: json["cliente_id"] as int,
        vehiculoId: json["vehiculo_id"] as int,
        cilindros: json["cilindros"] as String,
        condicionventa: json["condicionventa"] as String,
        urgenciainicial: json["urgenciainicial"] as String,
        atencion: json["atencion"] as String,
        comentarios: json["comentarios"] as String,
        centrocosto: json["centrocosto"] as String,
        placa: json["placa"] as String,
        ceniceros: json["ceniceros"] as String,
        cristalesRotos: json["cristales_rotos"] as String,
        quemacocos: json["quemacocos"] as String,
        espejoIzq: json["espejo_izq"] as String,
        espejoDer: json["espejo_der"] as String,
        tapon: json["tapon"] as String,
        antena: json["antena"] as String,
        tapetes: json["tapetes"] as String,
        varilla: json["varilla"] as String,
        radio: json["radio"] as String,
        espejoInt: json["espejo_int"] as String,
        gato: json["gato"] as String,
        extinguidor: json["extinguidor"] as String,
        emblemas: json["emblemas"] as String,
        encendedor: json["encendedor"] as String,
        llanta: json["llanta"] as String,
        km: json["km"] as double,
        combustible: json["combustible"] as double,
        transmision: json["transmision"] as String,
        vestiduras: json["vestiduras"] as String,
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "vendedor": vendedor,
        "cliente_id": clienteId,
        "vehiculo_id": vehiculoId,
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
