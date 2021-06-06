class Prueba {
  final String producto;
  final String descripcion;
  final String unidad;
  final int precio;

  Prueba({this.producto, this.descripcion, this.unidad, this.precio});

  factory Prueba.fromJson(Map<String, dynamic> json) {
    return Prueba(
      producto: json['producto'],
      descripcion: json['descripcion'],
      unidad: json['unidad'],
      precio: json['precio'],
    );
  }
}
