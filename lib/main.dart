import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue[800],
      accentColor: Colors.cyan,
    ),
    home: MyApp(),
  ));
}
/* void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.cyan
  ),
  home: MyApp(),
  
));   */

/* void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
} */

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? studentName;
  String? studentID;
  String? studyProgramID;
  double? studentGPA;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }

  getStudentName(name){
    this.studentName=name;
  }

  getStudentID(id){
    this.studentID=id;
  }

  getStudyProgramID(programID){
    this.studyProgramID=programID;
  }

  getStudentGPA(gpa){
    this.studentGPA=double.parse(gpa);
  }

  createData(){
    print("test");
    DocumentReference documentReference=
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    //Firestore.instance.collection("MyStudents").document(studentName);
    //create Map
    print("test1");
    Map<String, dynamic> students={
      "studentName":studentName,
      "studentID":studentID,
      "studyProgramID":studentID,
      "studentGPA":studentGPA
    };
    print("test3");
    documentReference.setData(students).whenComplete(() {
      print("$studentName created");
      
    });
  }

  readData(){
    print("read");
  }
  
  updateData(){
    print("updated");
  }
  
  deleteData(){
    print("deleted");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Bikini Bottom University"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width:2.0 )
                  )
                ),
                onChanged: (String name){
                },
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "StudentID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width:2.0 )
                  )
                ),
                onChanged: (String id){
                  getStudentID(id);
                },
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "StudyProgram",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width:2.0 )
                  )
                ),
                onChanged: (String programID){
                   getStudyProgramID(programID);
                },
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width:2.0 )
                  )
                ),
                onChanged: (String gpa){
                    getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                    child: Text("create"),
                    textColor: Colors.white,
                    onPressed: () {
                      createData();
                    },
                  ),RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                    child: Text("read"),
                    textColor: Colors.white,
                    onPressed: () {
                      readData();
                    }
                  ),RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                    child: Text("update"),
                    textColor: Colors.white,
                    onPressed: () {
                      updateData();
                    },
                  ),RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                    child: Text("delete"),
                    textColor: Colors.white,
                    onPressed: () {
                      deleteData();
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}