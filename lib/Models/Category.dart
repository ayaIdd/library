class Category {
  int id;
  String name;
  String icon;

  Category({
    this.id,
    this.name,
    this.icon
  });
}

List<Category> demoCategories = [
    Category(
      id: 1,
      name: 'Mathématique',

    ),
    Category(
      id: 2,
      name: 'Physique',

    ),
    Category(
      id: 3,
      name: 'Informatique',
    ),

  ];