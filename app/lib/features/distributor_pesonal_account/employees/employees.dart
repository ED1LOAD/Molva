import 'package:app/features/distributor_pesonal_account/employees/widgets/employee.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmployeeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeState();
  }
}

class _EmployeeState extends State<EmployeeWidget> {
  late List<Employee> _employees;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _statusController = TextEditingController();
  @override
  void initState() {
    _employees = [Employee(name: 'Иванов Иван Иванович')];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'Сотрудники',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 25,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Здесь будет представлен список ваших коллег",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
            ),
            Text(
              "Создайте им учетные записи и дайте доступы",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Список сотрудников",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFF5F5F7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Иванов Иван Иванович'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      constraints: BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ), // Устанавливаем минимальную ширину и высоту
                      padding: EdgeInsets.zero, // Устанавливаем padding
                      splashRadius: 24, // Радиус нажатия
                    ),
                     // Добавляем промежуток между иконками
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      constraints: BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ), // Устанавливаем минимальную ширину и высоту
                      padding: EdgeInsets.zero, // Устанавливаем padding
                      splashRadius: 24,
                    ), // Радиус нажатия
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
