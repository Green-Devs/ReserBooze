/**
 * Reserva.dart
 * versión 1.0
 *
 * La clase Reserva corresponde al componente 3.5 especificada en el SDS,
 * donde se puede encontrar una descripción más detallada de la clase.
 * Su función principal es guardar datos que toda reserva debe tener al
 * formar parte de nuestra aplicación. Adicional a lo especificado en el
 * SDS, se agregaron funciones extras en esta etapa de implementación
 */

class Reserva {
  String antroNombre;
  String antroHora;
  String antroFecha;

  /**
   * Constructor de la clase Reserva. Dart permite realizar constructores
   * con solo poner las variables del objeto en los parámetros
   */
  Reserva(this.antroNombre, this.antroHora, this.antroFecha);

  //getters

  String getAntroNombre() {
    return antroNombre;
  }

  String getAntroHora() {
    return antroHora;
  }

  String getAntroFecha() {
    return antroFecha;
  }

}