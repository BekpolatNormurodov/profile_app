import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  var listImage = [
    "https://i.pinimg.com/originals/aa/eb/7f/aaeb7f3e5120d0a68f1b814a1af69539.png",
    "https://cdn.fnmnl.tv/wp-content/uploads/2020/09/04145716/Stussy-FA20-Lookbook-D1-Mens-12.jpg",
    "https://www.propermag.com/wp-content/uploads/2020/03/0x0-19.9.20_18908-683x1024.jpg",
    "http://www.thefashionisto.com/wp-content/uploads/2014/06/Marc-by-Marc-Jacobs-Men-2015-Spring-Summer-Collection-Look-Book-001.jpg",
    "https://im0-tub-ru.yandex.net/i?id=e2e0f873e86f34e5001ddc59b42e23a6-l&ref=rim&n=13&w=828&h=828",
    "https://www.thefashionisto.com/wp-content/uploads/2013/07/w012-800x1200.jpg",
    "https://manofmany.com/wp-content/uploads/2016/09/14374499_338627393149784_1311139926468722688_n.jpg",
    "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2020%2F04%2Faries-fall-winter-2020-lookbook-first-look-14.jpg?q=75&w=800&cbr=1&fit=max",
    "https://i.pinimg.com/originals/95/0f/4d/950f4df946e0a373e47df37fb07ea1f9.jpg",
    "https://i.pinimg.com/736x/c4/03/c6/c403c63b8e1882b6f10c82f601180e2d.jpg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                ),
              ),
              Text(
                "Jenny Wilson",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 70.0),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://free2music.com/images/singer/2019/02/10/troye-sivan_2.jpg"),
          radius: 70.0,
        ),
        SizedBox(height: 20.0),
        Text(
          "@Wilson_je",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20.0),
            Column(
              children: [
                Text(
                  "29",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Following",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "121.9k",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Followers",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "7.5M",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Like",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Follow",
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(140.0, 55.0),
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(width: 15.0),
            OutlinedButton(
              onPressed: () {},
              child: Icon(Icons.mail_outline_outlined),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  fixedSize: Size(50.0, 60.0)),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              isScrollable: true,
              controller: tabController,
              indicator: BoxDecoration(borderRadius: BorderRadius.zero),
              labelColor: Colors.black,
              labelStyle:
                  TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black26,
              onTap: (tapIndex) {
                setState(() {
                  selectedIndex = tapIndex;
                });
              },
              tabs: [
                Tab(text: "Photos"),
                Tab(text: "Video"),
                Tab(text: "Tagged"),
              ],
            ),
            SizedBox(width: 50.0),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 250.0, crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: NetworkImage(listImage[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 37.0, right: 37.0, top: 185.0, bottom: 15.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text("1.234k"),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
              Center(
                child: Text("You don't have any videos"),
              ),
              Center(
                child: Text("You don't have any tagged"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
