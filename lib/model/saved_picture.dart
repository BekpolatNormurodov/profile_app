import 'package:examination/database/database_helper.dart';

import 'picture.dart';

class SavedPicture {
  DatabaseHelper? databaseHelper;
  List<Picture>? allpicture;

  List listPicture = [
    "https://modernrestaurantmanagement.com/assets/media/2021/03/Getty_1204581284-650x430.jpg",
    "https://i.pinimg.com/736x/06/45/ba/0645bacf0cafe371363f023d7bd5ecef--vogue-men-men-editorial.jpg",
    "https://sun9-70.userapi.com/CHdfple7VCIeQqVWp3vGFHS5nXHHdO1t7COJWQ/7cswol8dFwo.jpg",
    "https://i.pinimg.com/736x/0d/53/ab/0d53aba63c891daec051c6f1060ccc20.jpg",
    "https://sun9-70.userapi.com/CHdfple7VCIeQqVWp3vGFHS5nXHHdO1t7COJWQ/7cswol8dFwo.jpg",
  ];

  // allFunction() async {
  //   for (var item in listPicture) {
  //     databaseHelper!.takeUrl(item).then((value) {
  //       return dataBaseHelper!.addPicture(Picture("Rasm 1", value));
  //     });
  //   }
  // }
}
