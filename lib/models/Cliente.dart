class Cliente {
  final int id;
  final String nombre;
  final String razon;
  final String rfc;
  final String email;
  final String calle;
  final String exterior;
  final String interior;
  final String ecalle;
  final String ycalle;
  final String colonia;
  final String postal;
  final String ciudad;
  final String estado;
  final String pais;
  final String particular;
  final String oficina;
  final String movil;
  final double limiteCredito;
  final int diasCredito;
  final int diasBloqueo;
  final String descuento;
  final DateTime birthday;
  final int sucursal;
  final int segmento;
  final int giro;

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
    this.limiteCredito,
    this.diasCredito,
    this.diasBloqueo,
    this.descuento,
    this.birthday,
    this.sucursal,
    this.segmento,
    this.giro,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
        id: json['id'],
        nombre: json['nombre'],
        razon: json['razon'],
        rfc: json['rfc'],
        email: json['email'],
        calle: json['calle'],
        exterior: json['exterior'],
        interior: json['interior'],
        ecalle: json['ecalle'],
        ycalle: json['ycalle'],
        colonia: json['colonia'],
        postal: json['postal'],
        ciudad: json['ciudad'],
        estado: json['estado'],
        pais: json['pais'],
        particular: json['particular'],
        oficina: json['oficina'],
        movil: json['movil'],
        limiteCredito: json['limitecredito'],
        diasCredito: json['diascredito'],
        diasBloqueo: json['diasbloqueo'],
        descuento: json['descuento'],
        birthday: json['birthday'],
        sucursal: json['sucursal'],
        segmento: json['segmento'],
        giro: json['giro']);
  }
}
