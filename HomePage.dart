import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController refreshController;
   Iterable<Future<String>> user;
  
  @override
  void initState() {
    super.initState();
    refreshController=RefreshController();
    users.map((u) async => u.firstname);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SmartRefresher(
        enablePullDown: true,
        controller: refreshController,
        header: WaterDropHeader(),
        onRefresh: () {
         Future.delayed(Duration(seconds: 200));
         refreshController.refreshCompleted();
          
        },
        child: ListView.custom(
        scrollDirection: Axis.vertical,
        itemExtent: 70.0,
        childrenDelegate: SliverChildListDelegate(         
          List.generate(users.length, (index){
            return Card(
              color: users[index].color,
              child: ListTile(
                leading:CircleAvatar(child: Icon(Icons.person,color: Colors.black),
                backgroundColor: Colors.white),
                title:Text(users[index].firstname),
                subtitle: Text(users[index].lastname),
                trailing: IconButton(icon: Icon(Icons.delete_outline,color: Colors.white,),onPressed: (){
                  setState(() {
                    users.removeAt(index);
                  });
                }),
                onTap: (){
                },
              ),
            );
          })
          
        ),
        ),
        ),
    );
  }
}
class User
{
  final String firstname;
  final String lastname;
  final Color color;
  User({this.firstname,this.lastname,this.color});
}
List<User> users=[
      User(firstname: "Akash", lastname: "shedge",color:Colors.red),
      User(firstname: "Prasad", lastname: "Jadhav",color:Colors.orange),
      User(firstname: "Shubham", lastname: "kadam",color:Colors.green),
      User(firstname: "Vishal", lastname: "jadhav",color:Colors.blue),
      User(firstname: "Rohit", lastname: "Phadtare",color:Colors.pink),
      User(firstname: "rushikant", lastname: "Shitole",color:Colors.purple),
      User(firstname: "Sangram", lastname: "Alde",color:Colors.yellow), 
      User(firstname: "rushikant", lastname: "Mane",color:Colors.purple),
      User(firstname: "Sangram", lastname: "Thorat",color:Colors.yellow),  
  ];