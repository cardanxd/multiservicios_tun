class Orden{

  DateTime fecha;
  String vendedor;
  int clienteid;
  int vehiculoid;
  int cilindros;
  String condicionventa;
  String urgenciainicial;
  String atencion;
  String comentarios;
  String centrocosto;
  double km;
  double combustible;
  String transmision;
  String vestiduras;

  Orden(fecha, vendedor, clienteid, vehiculoid, cilindros, condicionventa, urgenciainicial, atencion, comentarios, centrocosto, km, combustible, transmision, vestiduras){

    this.fecha = fecha;
    this.vendedor = vendedor;
    this.clienteid = clienteid;
    this.vehiculoid = vehiculoid;
    this.cilindros = cilindros;
    this.condicionventa = condicionventa;
    this.urgenciainicial = urgenciainicial;
    this.atencion = atencion;
    this.comentarios = comentarios;
    this.centrocosto = centrocosto;
    this.km = km;
    this.combustible = combustible;
    this.transmision = transmision;
    this.vestiduras = vestiduras;

  }

}