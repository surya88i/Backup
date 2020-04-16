import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  var dataSource=DataSource();
  bool sort=true;
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
              setState(() {
                rowPerPage=val;
              });
            },
            rowsPerPage: rowPerPage,
            columnSpacing: MediaQuery.of(context).size.width/2,
            sortAscending: sort,

            sortColumnIndex: 0,
            header: Center(child: Text("Data Table")),
            columns: [
              DataColumn(label: Text("Firstname"),numeric: true,
            
              
              ),
              DataColumn(label: Text("Lastname"),numeric: true),
            ],
            source: dataSource,
            ),
        ),
      );
    }
  }
  
  class DataSource extends DataTableSource{
    List<User> users=<User>[
      User(firstname: "Sunil",lastname:"Shinde"),
      User(firstname: "Akshay",lastname:"Kadam"),
      User(firstname: "Amar",lastname:"Kadam"),
      User(firstname: "Sammer",lastname:"Thorat"),
      User(firstname: "Adarsh",lastname:"Shukla"),
      User(firstname: "Rushikesh",lastname:"Shinde"),
      User(firstname: "Ramesh",lastname:"Yadav"),
      User(firstname: "Ram",lastname:"Shinde"),
      User(firstname: "Adinath",lastname:"Shinde"),
      User(firstname: "Sangram",lastname:"Shinde"),
      User(firstname: "Sunil",lastname:"Shedge"),
    ];
  @override
  DataRow getRow(int index) {
     
    assert(index >=0);
    if(index >=users.length) return null;
    final User user=users[index];
   
    return DataRow.byIndex(
      index: index,
      cells: [
      DataCell(Text(user.firstname)),
      DataCell(Text(user.lastname)),
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
  User({this.firstname,this.lastname});
}