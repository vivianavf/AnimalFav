//un objeto tipo cupon

class Cupon{
  late String nombre;
  late String local;
  late String fecha;
  late String beneficio;
  late String codigo;
  late String categoria;

  Cupon(this.nombre, this.local, this.fecha, this.beneficio, this.codigo, this.categoria);

  Cupon.fromJson(Map<String, dynamic> json){
    nombre = json['Nombre'];
    local = json['Local válido'];
    fecha= json['Fecha de caducidad'];
    beneficio = json['Beneficios'];
    codigo = json['Codigo'];
    categoria = json['Categoría'];
  }

}