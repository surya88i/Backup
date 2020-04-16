class Users{
  String firstname;
  String lastname;
  Users({this.firstname,this.lastname});
}

List<Users> getUsers() {
  return <Users>[
    Users(firstname: "sunil",lastname: "shedge"),
    Users(firstname: "Akash",lastname: "shedge"),
    Users(firstname: "Prasad",lastname: "Jadhav"),
    Users(firstname: "Shubham",lastname: "kadam"),
    Users(firstname: "Vishal",lastname: "jadhav"),
    Users(firstname: "Rohit",lastname: "Phadtare"),
    Users(firstname: "rushikant",lastname: "Shitole"),
    Users(firstname: "Sangram",lastname: "Alde"),

  ];
}