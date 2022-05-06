import 'package:flutter/cupertino.dart';

class Books {
  String auteur;

  String image;

  int isbn;

  String nom;

  Books({
    this.auteur,
    this.image,
    this.isbn,
    this.nom,

  });

  Map<String, dynamic> toJson() =>
      {
        'auteur': auteur,
        'image': image,
        'isbn': isbn,
        'nom': nom,

      };

  static Books fromJson(Map<String,dynamic> json ) => Books(
    auteur: json['auteur'],
    image: json['image']  ,
    isbn: json['isbn'],
    nom: json['nom'],

  );


}

 /* static Books fromJson(json) => Books(
      author: json['author'],
      country:json['country'],
      language:json['language']:,
      link:json['link'],
      pages:json['pages'],
      name:json['name'],
      year:json['year'],
  );*/


/*
Expanded(child :
StreamBuilder(
stream: FirebaseFirestore.instance.collection('books').
doc('physique').
collection('physique').
snapshots(),
builder: ( context, AsyncSnapshot<QuerySnapshot> snapshot){
if(!snapshot.hasData){
return Center(
child: CircularProgressIndicator(),
);
}

return ListView(
children: snapshot.data.docs.map((document) {
return Center(
child: Container(
width: MediaQuery.of(context).size.width / 1.2,
height: MediaQuery.of(context).size.height / 6,
child: Text("Title: " + document['nom']),
),
);
}).toList(),
);
}
),) */

/*  StreamBuilder(
                                stream: FirebaseFirestore.instance.collection('books')
                                //.doc('physique')
                               // .collection('physique')
                               // .limit(3)
                                .snapshots(),
                                builder: ( context, AsyncSnapshot<QuerySnapshot> snapshot){
                                    if (snapshot.hasError) {
                                     return Text("Error ${snapshot.error}");}
                                  if(!snapshot.hasData){
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (snapshot.hasData)  {
                                  return
                                   // Expanded(child:
                                    ListView(
                                      shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                   physics: NeverScrollableScrollPhysics(),
                                    children: snapshot.data.docs.map((document) {
                                      return Center(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width / 1.2,
                                          height: MediaQuery.of(context).size.height / 6,
                                          child: Text("Title: " + document['categorie']),

                                        ),
                                      );
                                    }).toList(),
                                  );

                                }}
                            ),*/