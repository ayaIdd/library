class Item {
  int id;
  String name;
  String description;
  String image;
  int color;
  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.color,

  });
}

List<Item> demoItems = [

  Item(
    id: 1,
    name: 'tout javascript ',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/1.png',

    color:0xFF020202,

  ),
  Item(
    id: 2,
    name: 'programmer en java',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/2.png',

    color:0xFF020202,

  ),
  Item(
    id: 3,
    name: 'programmer en langage C',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/3.png',

    color: 0xFF020202,
  ),
  /*Item(
    id: 4,
    name: 'python pour les nuls',
    description: "e livre s'adresse à tous les développeurs web, qu'ils soient débutants ou avancés. Le JavaScript sert avant tout à rendre les pages web interactives et dynamiques du côté de l'utilisateur, mais il est également de plus en plus utilisé pour créer des applications complètes, y compris côté serveur.",

    color: 0xFF020202,

  ),*/
];