import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBlock _employeeBlock = EmployeeBlock();

  @override
  void dispose() {
    _employeeBlock.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empolyee App'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBlock.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].id}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data[index].name}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "৳ ${snapshot.data[index].salary.toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up_alt),
                          onPressed: () {
                            _employeeBlock.employeeSalaryIncrement
                                .add(snapshot.data[index]);
                          },
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down_alt),
                          onPressed: () {
                            _employeeBlock.employeeSalaryDecrement
                                .add(snapshot.data[index]);
                          },
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
