import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Photo> photo;
  MyHomePage({Key key, this.title, this.photo}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Photo selectedPhotos = photos[0];
  String backup;
  String name = "Sunil Shedge";
  String email = "sunil900@gmail.com";
  String emails = "shedgeakash09@gmail.com";
  String names = "Akash Shedge";
  String backup2;
  String backup3;
  String pic1 = "S";
  String pic2 = "A";
  void refresh() {
    setState(() {
      backup = name;
      name = names;
      names = backup;

      backup2 = email;
      email = emails;
      emails = backup2;

      backup3 = pic1;
      pic1 = pic2;
      pic2 = backup3;
    });
  }

  void selectedPhoto(Photo val) {
    setState(() {
      selectedPhotos = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: GoogleFonts.bitter(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
          PopupMenuButton<Photo>(
              onSelected: selectedPhoto,
              itemBuilder: (context) {
                return photos.map((Photo photo) {
                  return PopupMenuItem<Photo>(
                      value: photo,
                      child: ListTile(
                        leading: photo.icons,
                        title: Text(photo.title),
                      ));
                }).toList();
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                name,
                style: GoogleFonts.bitter(),
              ),
              accountEmail: Text(
                email,
                style: GoogleFonts.bitter(),
              ),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  setState(() {
                    refresh();
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(pic1, style: TextStyle(color: Colors.black)),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        refresh();
                      });
                    },
                    child: CircleAvatar(
                      child: Text(pic2, style: TextStyle(color: Colors.black)),
                      backgroundColor: Colors.white,
                    )),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: GoogleFonts.bitter(),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                "About",
                style: GoogleFonts.bitter(),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: GoogleFonts.bitter(),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-3.jpg",fit:BoxFit.cover),
                    ), 
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                          
                          RaisedButton(color: Colors.amber,child: Text("Order"), onPressed: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-2.jpg",fit:BoxFit.cover),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                          
                          RaisedButton(child: Text("Order"), onPressed: () {},color: Colors.redAccent,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-1.jpg",fit:BoxFit.cover),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                        
                          RaisedButton(child: Text("Order"), onPressed: () {},color: Colors.blue)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width:MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-3.jpg",fit:BoxFit.cover),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                          
                          RaisedButton(child: Text("Order"), onPressed: () {},color: Colors.blueAccent)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-2.jpg",fit:BoxFit.cover),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                          
                          RaisedButton(child: Text("Order"), onPressed: () {},color:Colors.deepOrange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.asset("asset/images/food-img-1.jpg",fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          ),
                          child: IconButton(
                              focusColor: Colors.redAccent,
                              color: Colors.black,
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        
                          Text(
                            "\$ 200",
                            style: GoogleFonts.bitter(fontSize: 18),
                          ),
                          
                          RaisedButton(child: Text("Order"), onPressed: () {},color:Colors.teal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Pune"
        "Aurangabad",
    "TamilNadu",
    "Keral",
    "JaiPur",
    "Mumbai",
    "Satara",
    "kolhapur",
    "Solapur",
  ];
  final recentCities = [
    "Pune",
    "Keral",
    "JaiPur",
    "Mumbai",
    "Satara",
    "kolhapur",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //implement buildActions

    return [
      query.isEmpty
          ? IconButton(
              icon: Icon(Icons.mic, color: Colors.red), onPressed: () {})
          : IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                query = '';
              }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        color: Colors.green,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //implement buildResults
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Card(
          color: Colors.pink,
          child: Center(
              child: Text(
            query,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
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

class Photo {
  final int id;
  final String title;
  final Icon icons;
  Photo({this.id, this.title, this.icons});
}

List<Photo> photos = [
  Photo(id: 1, title: "Home", icons: Icon(Icons.home)),
  Photo(id: 2, title: "About", icons: Icon(Icons.info)),
  Photo(id: 3, title: "Gallery", icons: Icon(Icons.photo)),
  Photo(id: 4, title: "Share", icons: Icon(Icons.share)),
];
