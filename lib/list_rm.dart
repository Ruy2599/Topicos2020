import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Personajes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FormPersonajes();
  }
}

class FormPersonajes extends State<Personajes>{

  List dataRM;
  var loading;

  @override
  void initState() {
    //Este método se ejecuta antes de visualizar el contenido de lsa interfaz
    getDataRM();
  }

  Future<String> getDataRM() async {

    
    setState(() { //Notificamos a la app que debe renderizar la interfaz
      loading = true;
    });
      var response = await http.get(
      Uri.encodeFull("https://rickandmortyapi.com/api/character/"),
    
    );

    setState(() {
      loading = false;
      Map cadOriginal = json.decode(response.body);
      dataRM = cadOriginal['results'] as List;
    });


    //Este método se ejecutará en segundo plano

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumo de API Rick and Morty")),
      backgroundColor: Color.fromRGBO(42, 43, 43, 0),
      body: loading == true ? 
      Center(
        child: CircularProgressIndicator(),
      ) :
      
       ListView.builder(
        itemCount: dataRM == null ? 0 : dataRM.length,
        
        itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(33, 65, 80, .8)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0, color: Colors.white))
                  ),
                  child: Image.network(dataRM[index]['image']),
                ),
                title: Text(dataRM[index]['name'], style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                subtitle: Text(dataRM[index]['species'], style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}