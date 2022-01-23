//Ventana principal de la app

//recursos
import 'package:animalfav/cuponResources/cuponDetail.dart';
import 'package:flutter/material.dart';

//ventanas
import 'cuponResources/cuponPrincipal.dart';
import 'eventos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Pet App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}

// ************ Home Screen **************
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //obtener el tamaño de la ventana
    var size = MediaQuery.of(context).size;

    //estilo
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //imagen header
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top_header.png')),
            ),
          ),

          //botones para ir a las otras ventanas
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        //Botón que manda a Cupones

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CuponPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://img.icons8.com/external-justicon-lineal-color-justicon/64/000000/external-coupon-black-friday-justicon-lineal-color-justicon.png',
                                  height: 128,
                                ),
                                Text(
                                  'Cupones',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        //Botón que manda a Correos

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              //reemplazar CuponPage() por la ventana de correos

                              MaterialPageRoute(
                                  builder: (context) => eventosPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  // url de imagen de internet

                                  'https://cdn-icons-png.flaticon.com/512/45/45533.png',
                                  height: 128,
                                ),
                                Text(
                                  'Organizar Eventos',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
