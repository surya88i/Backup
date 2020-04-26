import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/FavoritePage.dart';
import 'pages/HomePage.dart';
import 'pages/OrderPage.dart';
import 'pages/ProfilePage.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  runApp(
    MaterialApp(
      title: "Sports",
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<User> users;
  Widget currentPage;
  TabController tabController;
  ScrollController scrollController;
  List<Widget> pages;
  int currentIndex = 0;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;
  @override
  void initState() {
    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, favoritePage, profilePage];
    currentPage = homePage;
    users = User.getUsers();
    scrollController = ScrollController();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.only(bottom: 0.0),
              accountName: Text(
                "sunil shedge",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              accountEmail: Text("swarajya888@gmail.com",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/images/food-img-3.jpg'),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('asset/images/food-img-3.jpg'),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('asset/images/food-img-1.jpg'),
                  ),
                ),
              ],
            ),
            Card(
              child: ListTile(
                title: Text("Home"),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Shopping Cart"),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OrderPage()));
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Favourite"),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FavoritePage()));
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Account"),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerScrollView) {
            return <Widget>[
              SliverAppBar(
                title: Text("Sports"),
                expandedHeight: 95,
                floating: true,
                pinned: true,
                forceElevated: innerScrollView,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          showSearch(context: context, delegate: DataSearch());
                        });
                      }),
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        setState(() {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(120, 0, 0, 0),
                              items: users.map((user) {
                                return PopupMenuItem(
                                  value: user,
                                  child: ListTile(
                                    title: Text(user.firstname),
                                    contentPadding: EdgeInsets.only(right: 80),
                                  ),
                                );
                              }).toList());
                        });
                      }),
                  PopupMenuButton(
                      padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                      itemBuilder: (context) {
                        return users.map((user) {
                          return PopupMenuItem(
                            value: user,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(right: 80),
                              title: Text(user.firstname),
                            ),
                          );
                        }).toList();
                      })
                ],
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorWeight: 2,
                    controller: tabController,
                    tabs: [
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(Icons.shopping_cart)),
                      Tab(icon: Icon(Icons.favorite_border)),
                      Tab(icon: Icon(Icons.account_circle)),
                    ]),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              HomePage(),
              OrderPage(),
              FavoritePage(),
              ProfilePage(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.pink,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = pages[currentIndex];
            });
          },
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text("Order")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), title: Text("Favourite")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Account")),
          ]),
    );
  }
}

class User {
  final String firstname;
  final String lastname;
  User({this.firstname, this.lastname});
  static List<User> getUsers() {
    return <User>[
      User(firstname: "Sunil", lastname: "shedge"),
      User(firstname: "akash", lastname: "shedge"),
      User(firstname: "Nivas", lastname: "shedge"),
      User(firstname: "Devraj", lastname: "shedge"),
    ];
  }
}

final cities = [
  "Pune",
  "Satara",
  "Kolhapur",
  "Sangli",
  "Karad",
  "Mumbai",
  "Goa",
  "Ratnagiri",
  "Nanded",
  "Vardha",
  "Parbhani",
  "Nashik",
  "Solapur",
  "Ahmadnagar",
  "Akola",
  "Vashim",
  "Vidarbh maratha",
  "Gondia",
  "Amaravati",
];
final recentCities = [
  "Karad",
  "Mumbai",
  "Goa",
  "Ratnagiri",
  "Nanded",
  "Vardha",
  "Parbhani",
  "Nashik",
  "Solapur",
  "Ahmadnagar",
];

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? IconButton(
              icon: Icon(
                Icons.mic,
                color: Colors.black,
              ),
              onPressed: () {})
          : IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
              onPressed: () {
                query = '';
              }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        color: Colors.green,
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text("$query"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ])),
            onTap: () {
              buildResults(context);
            },
          );
        });
  }
}
