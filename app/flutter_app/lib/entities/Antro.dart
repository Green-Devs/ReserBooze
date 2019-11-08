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
  double puntaje;
  //photoPath es la fotografía principal
  String photoPath;
  //fotos es una lista de fotos(sus direcciones) secundarias y opcionales
  List<String> fotos;

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

  //Métodos que no son getters o setters

  //para agregar una foto a la lista de fotos opcionales
  void pushFoto(String foto) {
    fotos.add(foto);
  }

  //Te dice si se pudo eliminar la foto opcional en el index "index"
  //Index es un número cuya cuenta empezó en 0 como primer elemento
  bool deleteFoto(int index) {
    bool judge = false;

    //Si el index es válido elimina la foto
    if(index < fotos.length){
      judge = !judge;
      fotos.removeAt(index);
    }
    return judge;
  }
}