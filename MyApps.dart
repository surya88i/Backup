import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:footer/FavouritePage.dart';
import 'package:footer/HomePage.dart';

import 'package:footer/ProfilePage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  void refresh() {
    backup = name;
    name = names;
    names = backup;

    backups = email;
    email = emails;
    emails = backups;

    pics = pic1;
    pic1 = pic2;
    pic2 = pics;
  }

  String name = "Sunil Shedge";
  String names = "Akash Shedge";
  String email = "swarajya888@gmail.com";
  String emails = "swarajya90@gmail.com";
  String backup;
  String backups;
  String pics;
  String pic1 = "S";
  String pic2 = "A";
  User selected = users[0];
  void select(User user) {
    setState(() {
      selected = user;
    });
  }

  Widget currentPage;
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
          PopupMenuButton<User>(
              onSelected: select,
              itemBuilder: (context) {
                return users.map((User user) {
                  return PopupMenuItem<User>(
                      value: user,
                      child:
                          ListTile(leading: user.icon, title: Text(user.name)));
                }).toList();
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.white, child: Text(pic1)),
              onTap: () {
                setState(() {
                  setState(() {
                    refresh();
                  });
                });
              },
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.white, child: Text(pic2)),
                onTap: () {
                  setState(() {
                    setState(() {
                      refresh();
                    });
                  });
                },
              ),
            ],
          ),

           Card(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "Home",
                 
                ),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  "About",
                 
                ),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                 
                ),
                onTap: () {},
              ),
            ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = pages[currentIndex];
            });
          },
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
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
      body: currentPage,
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool one = false;
  Iterable<Future<String>> user = users.map((u) async => u.firstname);
  RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = new RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: refreshController,
              header: WaterDropHeader(),
              onRefresh: () {
                Future.delayed(Duration(seconds: 2));
                refreshController.refreshCompleted();
              },
              child:ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: CheckboxListTile(
                      key: Key(users[index].name),
                      dense: true,
                      activeColor: Colors.pink,
                      title: Text(users[index].name),
                      controlAffinity: ListTileControlAffinity.leading,
                      secondary: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              users.removeAt(index);
                            });
                          }),
                      value: users[index].done,
                      onChanged: (val) {
                        setState(() {                                                                              
                          users[index].done = val;
                        });
                      }),
                );
              }),
        ),
     );
  }
}



class User {
  final String name;
  final Icon icon;
  String firstname;
  String lastname;
  bool done;
  User({this.name, this.icon, this.done, this.firstname, this.lastname});
}

List<User> users = [
  User(name: "Home", icon: Icon(Icons.home), done: false),
  User(name: "Order", icon: Icon(Icons.shopping_cart), done: false),
  User(name: "Favourite", icon: Icon(Icons.favorite_border), done: false),
  User(
    name: "Account",
    icon: Icon(Icons.account_circle),
    done: false,
  ),
  User(
    name: "Home",
    icon: Icon(Icons.home),
    done: false,
  ),
  User(
    name: "Order",
    icon: Icon(Icons.shopping_cart),
    done: false,
  ),
  User(name: "Favourite", icon: Icon(Icons.favorite_border), done: false),
 
];

final state = [
  "Maharashtra",
  "Gujarat",
  "Delhi",
  "Jammu Kashmir",
  "Aurangabad",
  "Asam",
  "Sri Lanka",
  "Tamil Nadu",
  "Panjab",
  "ChhatisGadh",
  "Keral",
  "Arunachal Pradesh",
];
final recentState = [
  "Jammu Kashmir",
  "Aurangabad",
  "Asam",
  "Sri Lanka",
  "Tamil Nadu",
  "Panjab",
];

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? IconButton(
              icon: Icon(Icons.mic), color: Colors.red, onPressed: () {})
          : IconButton(
              icon: Icon(Icons.close),
              color: Colors.red,
              onPressed: () {
                query = '';
              })
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
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Card(
      child: Container(
        color: Colors.pink,
        width: 80,
        height: 80,
        child: Center(child: Text("$query")),
      ),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentState
        : state.where((p) => p.startsWith(query)).toList();
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
                )
              ],
            )),
            onTap: () {
              buildResults(context);
            },
          );
        });
  }
}