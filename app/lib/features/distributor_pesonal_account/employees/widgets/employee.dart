import 'package:flutter/material.dart';

class Employee extends ChangeNotifier {
  final String name;
  bool isEditing;

  Employee({
    required this.name,
      this.isEditing = false,
    });

    Employee copyWith({
      String? name,
      String? position,
      String? status,
      bool? isEditing,
    }) {
      return Employee(
        name: name ?? this.name,
        isEditing: isEditing ?? this.isEditing,
      );
    }
  }

  class EmployeeCard extends StatefulWidget {
    final Employee employee;
    final Function() onToggleEditing;
  final Function(String) onUpdateEmployee;
  EmployeeCard({
    required this.employee,
    required this.onToggleEditing,
    required this.onUpdateEmployee,
  });
  @override
  State<StatefulWidget> createState() {
    return _EmployeeCardState();
  }
}

class _EmployeeCardState extends State<EmployeeCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  
  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;


      widget.onUpdateEmployee(name);
      setState(() {
        widget.employee.isEditing = false; // Скрыть форму редактирования
      });
    }
  }
 @override
  Widget build(BuildContext context) {
    final employee = widget.employee;
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Отображение ФИО, должности и статуса
                  Expanded(
                    child: Text(
                      '${employee.name}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Кнопка редактирования
                  IconButton(
                    icon: Icon(employee.isEditing ? Icons.done : Icons.edit),
                    onPressed: () {
                      setState(() {
                        employee.isEditing = !employee.isEditing;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}