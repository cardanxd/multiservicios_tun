class Cliente{

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

  Cliente(nombre, razon, rfc, email, calle, exterior, interior, ecalle, ycalle, colonia, postal, ciudad, estado, pais, particular, oficina, movil, limitecredito, diascredito, diasbloqueo, descuento, birthday, sucursal, segmento, giro){
    this.nombre = nombre;
    this.razon =razon;
    this.rfc = rfc;
    this.email = email;
    this.calle = calle;
    this.exterior = exterior;
    this.interior = interior;
    this.ecalle = ecalle;
    this.ycalle = ycalle;
    this.colonia = colonia;
    this.postal = postal;
    this.ciudad = ciudad;
    this.estado = estado;
    this.pais = pais;
    this.particular = particular;
    this.oficina = oficina;
    this.movil = movil;
    this.limitecredito = limitecredito;
    this.diascredito = diascredito;
    this.diasbloqueo = diasbloqueo;
    this.descuento = descuento;
    this.birthday = birthday;
    this.sucursal = sucursal;
    this.segmento = segmento;
    this.giro = giro;
  }

}