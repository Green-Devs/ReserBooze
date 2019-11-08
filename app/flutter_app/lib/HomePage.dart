import 'package:flutter/material.dart';
import 'entities/Antro.dart';
import 'entities/Promo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  static final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", "10/10"),
    Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", "10/10"),
    Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", "10/10"),
    Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", "10/10")
  ];

  final List<Promo> promoList = [
    Promo(antroList[3], "8:00PM", "12:00AM", "MUJERES TIENEN 2X1 EN BEBIDAS"),
    Promo(antroList[1], "10:00PM", "3:00AM", "SI RESERVAS UNA MESA, RECIBE UNA CUBETA GRATIS"),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
        child: new ListView.builder(
          //itemCount will have the length of the list of promoList
            itemCount: promoList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: buildTripCard(context, index)
              );
            }
        )
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final promo = promoList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                    child: Row(children: <Widget> [
                      Container(
                          width: 320.0,
                          height: 250.0,
                          child: Image.asset(promo.getAntro().getPhotoPath())
                      )
                    ])
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom:4.0),
                  child: Row(children: <Widget> [
                    Text(promo.getAntro().getName(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Horario: " + promo.getHoraInicio() + "-" + promo.getHoraFinal()),
                    Spacer()
                  ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Promocion: " + promo.getPromocion()),
                    Spacer()
                  ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
