import 'package:examination/database/database_helper.dart';
import 'package:examination/model/picture.dart';
import 'package:examination/model/saved_picture.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondMainPage extends StatefulWidget {
  const SecondMainPage({Key? key}) : super(key: key);

  @override
  _SecondMainPageState createState() => _SecondMainPageState();
}

class _SecondMainPageState extends State<SecondMainPage> {
  DatabaseHelper? databaseHelper;
  List<Picture>? allpicture;
  SavedPicture? savedPicture;

  List images = [
    "https://modernrestaurantmanagement.com/assets/media/2021/03/Getty_1204581284-650x430.jpg",
  ];

  List imageMemory = [];

  @override
  void initState() {
    super.initState();
    savedPicture = SavedPicture();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 0.0),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logo.png")),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        onPressed: () {},
                        icon:
                            Icon(Icons.notifications_none_outlined, size: 35.0),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, size: 35.0),
                      ),
                    ],
                  ),
                  SizedBox(width: 30.0),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 2.7,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://modernrestaurantmanagement.com/assets/media/2021/03/Getty_1204581284-650x430.jpg",
                              ),
                              radius: 25.0,
                            ),
                            Text(
                              "Sajon.co",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 0.0),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/736x/06/45/ba/0645bacf0cafe371363f023d7bd5ecef--vogue-men-men-editorial.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://sun9-70.userapi.com/CHdfple7VCIeQqVWp3vGFHS5nXHHdO1t7COJWQ/7cswol8dFwo.jpg"),
                              radius: 25.0),
                          SizedBox(width: 15.0),
                          Text(
                            "Jenny Wilson",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90.0, bottom: 5.0),
                      child: Text(
                        "Life is like a mirror. we get the best results\nWhen we smile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 190.0, bottom: 30.0),
                      child: Text(
                        "#fashion #yellow #photoshop",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/736x/0d/53/ab/0d53aba63c891daec051c6f1060ccc20.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://sun9-70.userapi.com/CHdfple7VCIeQqVWp3vGFHS5nXHHdO1t7COJWQ/7cswol8dFwo.jpg"),
                              radius: 25.0),
                          SizedBox(width: 15.0),
                          Text(
                            "Jenny Wilson",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90.0, bottom: 5.0),
                      child: Text(
                        "Life is like a mirror. we get the best results\nWhen we smile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 190.0, bottom: 30.0),
                      child: Text(
                        "#fashion #yellow #photoshop",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future saqla() async {
    for (var i = 0; i < images.length; i++) {
      var image = await http.get(
        Uri.parse(imageMemory[i]),
      );
      var bytes = image.bodyBytes;
      Picture picture = Picture(picture: bytes);
      
      databaseHelper!.savePicture(picture);
      print("YOZILGAN PICTURE: " + picture.toString());
      print("rasimmi saqla    ishladi");
    }
    setState(() {});
  }
}
