import '../models/foodItem.dart';

class FoodListRepo {
  Future<List<FoodItem>> fetchFood() {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        return [
          FoodItem(
            date: DateTime(1, 3, 2),
            fId: "ABC123",
            fName: "Burger",
            pId: "STR123",
            pName: "Rudra",
            price: 50.00,
            fImg:
                "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1928&q=80",
            fDes:
                "\"A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.\"",
          ),
          FoodItem(
            date: DateTime(1, 3, 2),
            fId: "XYZ123",
            fName: "Pizza With Cheeze",
            pId: "IIY123",
            pName: "Kamali",
            price: 20.00,
            fImg:
                "https://us.123rf.com/450wm/bhofack2/bhofack21410/bhofack2141000583/32917696-hot-homemade-pepperoni-pizza-ready-to-eat.jpg?ver=6",
            fDes: "LOL",
          ),
          FoodItem(
            date: DateTime(1, 3, 2),
            fId: "QWE123",
            fName: "Masala Dosa",
            pId: "RTO123",
            pName: "Krishna",
            price: 30.00,
            fImg:
                "https://www.yummyfoodrecipes.in/resources/picture/org/Indian-Masala-Dosa.jpg",
            fDes: "LOLOLOLOL",
          ),
        ];
      },
    );
  }
}
