import 'package:flutter/material.dart';

import 'LivreFavoris.dart';


class FavorisUI extends StatefulWidget{

  _FavorisUIState createState() => _FavorisUIState();
}

class _FavorisUIState extends State<FavorisUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 60,
          title: Text("Favoris"),
          centerTitle: true,

          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(40), bottomRight: Radius.circular(40)),
                gradient: LinearGradient(
                  colors: [Color(0xFFE59a59),Color(0xFFE59a59)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
            onPressed: () {} ,
          ),

        ),

        body : _buildListView(context),

       );
  }


  ListView _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text('Livre #$index'),
          subtitle: Text('The subtitle'),
          leading :Image.network('https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1140180560?k=20&m=1140180560&s=612x612&w=0&h=X_400OQDFQGqccORnKt2PHYvTZ3dBLeEnCH_hRiUQrY='),
          trailing: Icon(Icons.arrow_forward,color: Color(0xFF2661FA)),
          onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LivreFavorisPage()),
              );
          },
        );
      }
    );

  }

}

