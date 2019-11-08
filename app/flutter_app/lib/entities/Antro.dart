/**
 * Antro.dart
 * versión 1.0
 *
 * La clase Antro corresponde al componente 3.2 especificada en el SDS,
 * donde se puede encontrar una descripción más detallada de la clase.
 * Su función principal es guardar datos que todo antro debe tener al
 * formar parte de nuestra aplicación. Adicional a lo especificado en el
 * SDS, se agregaron funciones extras en esta etapa de implementación
 */


class Antro {
  String nombre;
  String tiempoApertura;
  String tiempoLimite;
  String descripcion;
  String photoPath;
  double puntaje;

  /**
   * Constructor de la clase antro. Dart permite realizar constructores
   * con solo poner las variables del objeto en los parámetros
   */
  Antro(this.nombre, this.tiempoApertura, this.tiempoLimite, this.descripcion, this.photoPath, this.puntaje);

  //getters

  String getNombre(){
    return nombre;
  }

  String getTiempoApertura(){
    return tiempoApertura;
  }

  String getTiempoLimite() {
    return tiempoLimite;
  }

  String getDescripcion() {
    return descripcion;
  }

  String getPhotoPath() {
    return photoPath;
  }

  double getPuntaje() {
    return puntaje;
  }

  String getPuntajeFormato(){
    return (this.puntaje.toString() + " / 10.0");
  }

  //setters

  void setNombre(String name){
    this.nombre = name;
  }

  void setTiempoApertura(String startHour) {
    this.tiempoApertura = startHour;
  }

  void setTiempoLimite(String endHour) {
    this.tiempoLimite = endHour;
  }

  void setDescripcion(String description) {
    this.descripcion = description;
  }

  void setPhotoPhat(String photoPath) {
    this.photoPath = photoPath;
  }

  void setPuntaje(double score) {
    this.puntaje = score;
  }
}