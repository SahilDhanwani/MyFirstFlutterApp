class CatalogModel{
  static final products = [Item(
  id: 1,
  name: "Tecno",
  desc: "A Legacy in Indian Market",
  price: 1234,
  color: "Black",
  imageURL: "https://images.ctfassets.net/hrltx12pl8hq/5ZjPpfAhn1rZWeopnHiXb/3e1b9a709297905672a0d24eac94a873/thumb_nov22_03.jpg",
)
];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageURL;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageURL});
}

