import 'package:expense_app_ui/data/local/models/cat_model.dart';

class AppConstants{
    static const String App_Name = "Monety";
    static List<CatModel> mCat = [
        CatModel(id: 1, title: "Coffee", imgPath: "asset/icons/coffee.png"),
        CatModel(id: 2, title: "Fast food", imgPath: "asset/icons/fast-food.png"),
        CatModel(id: 3, title: "Gift", imgPath: "asset/icons/gift-box.png"),
        CatModel(id: 4, title: "Hotpot", imgPath: "asset/icons/hot-pot.png"),
        CatModel(id: 5, title: "Grocery", imgPath: "asset/icons/ic_grocery.png"),
        CatModel(id: 6, title: "Mobile recharge", imgPath: "asset/icons/smartphone.png"),
        CatModel(id: 7, title: "Snack", imgPath: "asset/icons/snack.png"),
        CatModel(id: 8, title: "Vehicles", imgPath: "asset/icons/vehicles.png"),
    ];
}