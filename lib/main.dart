import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: StudentList(),
    ),
  );
}

    //Création de la liste d'étudiant
class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

    // La liste d'étudiant
class _StudentListState extends State<StudentList> {
  List<Student> students = [    Student(name: 'Ahmed', ds: 10, exam: 20, coef: 0.5),
    Student(name: 'Mohamed', ds: 15, exam: 30, coef: 0.6),
    Student(name: 'Salma', ds: 20, exam: 40, coef: 0.7),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste Ètudiant'),
      ),

  // Affichage de la liste d'étudiant
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          Student student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Moyenne: ${student.grade}'),

            // Appuyer sur l'étudiant pour modifier ses notes
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Changer Note'),
                    content: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            initialValue: student.ds.toString(),
                            onChanged: (value) {
                              student.ds = int.parse(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'DS',
                            ),
                          ),


                          TextFormField(
                            initialValue: student.exam.toString(),
                            onChanged: (value) {
                              student.exam = int.parse(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'Examen',
                            ),
                          ),


                          TextFormField(
                            initialValue: student.coef.toString(),
                            onChanged: (value) {
                              student.coef = double.parse(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'Coefficient',
                            ),
                          ),
                        ],
                      ),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text('Valider'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
 // Classe Student
class Student {
  String name;
  int ds;
  int exam;

  double coef;

  // Calcul du moyenne ( grade )
  double get grade => (ds + exam) * coef;

  Student({required this.name, required this.ds, required this.exam, required this.coef});
}
