import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var dataSource=DataSource();
  bool sort=false;
  int rowPerPage=PaginatedDataTable.defaultRowsPerPage;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: PaginatedDataTable(
            horizontalMargin: 20.0,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search,color: Colors.black,), onPressed: (){}),
            ],
            onRowsPerPageChanged: (val){
              rowPerPage=val;
            },
            rowsPerPage: rowPerPage,
            columnSpacing: MediaQuery.of(context).size.width/6,
            sortAscending: sort,

            sortColumnIndex: 0,
            header: Center(child: Text("Data Table")),
            columns: [
              DataColumn(label: Text("Product Name"),numeric: true),
              DataColumn(label: Text("Firstname"),numeric: true,
             
              
              ),
              DataColumn(label: Text("Lastname"),numeric: true),
              DataColumn(label: Text("Price"),numeric: true),
              DataColumn(label: Text("Quantity"),numeric: true),
              DataColumn(label: Text("Total"),numeric: true),
            ],
            source: dataSource,
            ),
        ),
      );
    }
  }
  
  class DataSource extends DataTableSource{
   
  @override
  DataRow getRow(int index) {
     users=<User>[
      User(firstname: "Sunil",lastname:"Shinde",price: 200,productname: "Samsung",quantity:45,total:9000),
      User(firstname: "Akshay",lastname:"Kadam",price: 100,productname: "LG",quantity:54,total: 5400),
      User(firstname: "Amar",lastname:"Kadam",price: 400,productname: "Nokia",quantity:40,total: 16000),
      User(firstname: "Sammer",lastname:"Thorat",price: 500,productname: "Redmi Mi",quantity:65,total: 32500),
      User(firstname: "Adarsh",lastname:"Shukla",price: 200,productname: "Apple iphone",quantity:40,total: 8000),
      User(firstname: "Rushikesh",lastname:"Shinde",price: 200,productname: "Samsung",quantity:45,total: 9000),
      User(firstname: "Ramesh",lastname:"Yadav",price: 100,productname: "LG",quantity:54,total: 5400),
      User(firstname: "Ram",lastname:"Shinde",price: 200,productname: "Apple iphone",quantity:40,total: 8000),
      User(firstname: "Adinath",lastname:"Shinde",price: 400,productname: "Nokia",quantity:40,total: 16000),
      User(firstname: "Sangram",lastname:"Shinde",price: 100,productname: "Vivo",quantity:54,total: 5400),
      User(firstname: "Sunil",lastname:"Shedge",price: 500,productname: "Redmi Mi",quantity:65,total: 32500),
    ];
    assert(index >=0);
    if(index >=users.length) return null;
    final User user=users[index];

    return DataRow.byIndex(
      index: index,
      cells: [
      DataCell(Text(user.productname)),  
      DataCell(Text(user.firstname)),
      DataCell(Text(user.lastname)),
      DataCell(Text(user.price.toString())),
      DataCell(Text(user.quantity.toString())),
      DataCell(Text(user.total.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>10;

  @override
  int get selectedRowCount => 0;
}
class User{
  final String firstname;
  final String lastname;
  final int price;
  final int quantity;
  final String productname;
  final int total;
  User({this.firstname,this.lastname,this.price,this.quantity,this.productname,this.total});
}
 List<User> users;