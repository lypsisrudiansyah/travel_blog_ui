class Travel {
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);

  static List<Travel> generateTravelBlog() {
    return [
      Travel('Place 1', 'Spain', 'assets/images/travel1.jpg'),
      Travel('Place 2', 'Indonesia', 'assets/images/travel2.jpg'),
      Travel('Place 3', 'Cambodia', 'assets/images/travel3.jpg'),
      Travel('Place 4', 'Australia', 'assets/images/travel4.jpg'),
    ];
  }

  static List<Travel> generateMostPopular() {
    return [
      Travel('Place 5', 'Saudi Arabia', 'assets/images/mp_1.jpg'),
      Travel('Place 6', 'Belgium', 'assets/images/mp_2.jpg'),
      Travel('Place 7', 'Netherland', 'assets/images/mp_3.jpg'),
      Travel('Place 8', 'Brazil', 'assets/images/mp_4.jpg'),
    ];
  }
}
