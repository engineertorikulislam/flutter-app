// TODO: imports;

// TODO: List of empolyee

// TODO: Stream Controlors

// TODO: Sream Sink getter

// TODO: Constructor -add data; listen to change

// TODO: Core Functions

// TODO: Dispose

import 'dart:async';
import 'Employee.dart';

class EmployeeBlock {
  // Sink is add data in pipe or data flow
  // stream to get data from pipe or data flow

  List<Employee> _employeeList = [
    Employee(1, 'Md Torikul Islam', 10000.50),
    Employee(2, 'Md Rustom Ali', 20000.50),
    Employee(3, 'Md Riad ', 30000.50),
    Employee(4, 'Md Rid ', 40000.50),
    Employee(5, 'Dipok', 50000.50),
    Employee(6, 'Md Torikul Islam', 10000.50),
    Employee(7, 'Md Rustom Ali', 20000.50),
    Employee(8, 'Md Riad ', 30000.50),
    Employee(9, 'Md Rid ', 40000.50),
    Employee(10, 'Dipok', 50000.50)
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  // Increment Employee Salary Stream Controller

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();

  //  Decrement Employee Salary Stream Controller

  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  // getters

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  // Create a Constructor
  EmployeeBlock() {
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);

    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;

    double incrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary + incrementedSalary;

    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;

    double decrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;

    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeListStreamController.close();

    _employeeSalaryIncrementStreamController.close();

    _employeeSalaryDecrementStreamController.close();
  }
}
