//Ventana principal de los cupones

import 'package:animalfav/cuponResources/cuponDetail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:animalfav/cuponResources/cupon.dart';
//import 'menu.dart';

class CuponPage extends StatefulWidget{
  @override
  _CuponPageState createState() => _CuponPageState();
}

class _CuponPageState extends State<CuponPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items = data.data as List<Cupon>;
            return ListView.builder(
              itemCount: items == null? 0: items.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cuponDetail(cupon: items[index],)));
                  },
                  child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50                          
                        ),
                        Expanded(child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].nombre.toString(), style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].local.toString()),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].fecha.toString()),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].beneficio.toString()),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].codigo.toString()),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].categoria.toString()),),
                            ],
                          ),
                        )
                        )
                      ]
                    ),
                    
                  ),
                ),
                );
              }
            );          
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<Cupon>> ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('data/cupones.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Cupon.fromJson(e)).toList();
  }
}

