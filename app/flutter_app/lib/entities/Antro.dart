/**
 * La clase antro
 */


class Antro {
  String nombre;
  String tiempoApertura;
  String tiempoLimite;
  String descripcion;
  String photoPath;
  double puntaje;

  Antro(this.nombre, this.tiempoApertura, this.tiempoLimite, this.descripcion, this.photoPath, this.puntaje);

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

  String getPuntajeFormato(){
    return (this.puntaje.toString() + " / 10.0");
  }
}