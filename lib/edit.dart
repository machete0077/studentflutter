import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studentflutter/main.dart';
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerStudentID;
  TextEditingController controllerLastName;
  TextEditingController controllerFirstName;
  TextEditingController controllerEnrollmentDate;

  void editData() {
    var url = "https://appserviceestudianteenrique.azurewebsites.net/token";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerStudentID.text,
      "itemname": controllerLastName.text,
      "price": controllerFirstName.text,
      "stock": controllerEnrollmentDate.text
    });
  }

  @override
  void initState() {
    controllerStudentID =
        new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerLastName =
        new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerFirstName =
        new TextEditingController(text: widget.list[widget.index]['price']);
    controllerEnrollmentDate =
        new TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerStudentID,
                  decoration: new InputDecoration(
                      hintText: "Student ID", labelText: "Student ID"),
                ),
                new TextField(
                  controller: controllerLastName,
                  decoration: new InputDecoration(
                      hintText: "First Name", labelText: "First Name"),
                ),
                new TextField(
                  controller: controllerFirstName,
                  decoration: new InputDecoration(
                      hintText: "Last Name", labelText: "Last Name"),
                ),
                new TextField(
                  controller: controllerEnrollmentDate,
                  decoration: new InputDecoration(
                      hintText: "Enrollment Date",
                      labelText: "Enrollment Date"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Inicio()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
