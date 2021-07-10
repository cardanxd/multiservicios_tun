// To parse this JSON data, do
//
//     final orden = ordenFromJson(jsonString);

import 'dart:convert';

Orden ordenFromJson(String str) => Orden.fromJson(json.decode(str));

String ordenToJson(Orden data) => json.encode(data.toJson());

class Orden {
  Orden({
    this.id,
    this.fecha,
    this.tecnico,
    this.clienteId,
    this.vehiculoId,
    this.cilindros,
    this.condicionventaId,
    this.urgenciainicial,
    this.atencion,
    this.trabajo,
    this.centrocostoId,
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

  int id;
  DateTime fecha;
  String tecnico;
  int clienteId;
  int vehiculoId;
  String cilindros;
  int condicionventaId;
  String urgenciainicial;
  dynamic atencion;
  String trabajo;
  int centrocostoId;
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
        id: json["id"] as int,
        fecha: json["fecha"] as DateTime,
        tecnico: json["tecnico"] as String,
        clienteId: json["cliente_id"] as int,
        vehiculoId: json["vehiculo_id"] as int,
        cilindros: json["cilindros"] as String,
        condicionventaId: json["condicionventa_id"] as int,
        urgenciainicial: json["urgenciainicial"] as String,
        atencion: json["atencion"] as String,
        trabajo: json["trabajo"] as String,
        centrocostoId: json["centrocosto_id"] as int,
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
        "id": id,
        "fecha": fecha.toIso8601String(),
        "tecnico": tecnico,
        "cliente_id": clienteId,
        "vehiculo_id": vehiculoId,
        "cilindros": cilindros,
        "condicionventa_id": condicionventaId,
        "urgenciainicial": urgenciainicial,
        "atencion": atencion,
        "trabajo": trabajo,
        "centrocosto_id": centrocostoId,
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
