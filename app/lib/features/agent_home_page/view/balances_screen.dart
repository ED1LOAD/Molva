
import 'package:flutter/material.dart';
class Transaction {
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.description,
    required this.amount,
    required this.date,
  });
}
class BalancesScreen extends StatefulWidget {
  const BalancesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BalancesScreenState createState() => _BalancesScreenState();
}
class _BalancesScreenState extends State<BalancesScreen> {
  // Пример списка операций (можно заменить на реальные данные)
  List<Transaction> transactions = [
    Transaction(description: 'Пополнение', amount: 500.0, date: DateTime.now()),
    Transaction(description: 'Покупка', amount: -250.0, date: DateTime.now()),
    Transaction(description: 'Вывод средств', amount: -100.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Балансы и операции'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Ваш баланс: \$650.00',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: Icon(transaction.amount >= 0 ? Icons.add : Icons.remove, color: Colors.green),
                  title: Text(transaction.description),
                  subtitle: Text('${transaction.amount > 0 ? '+' : ''}\$${transaction.amount.toStringAsFixed(2)}'),
                  trailing: Text(
                    '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Действия при нажатии кнопки вывода средств
              // Например, открытие модального окна для ввода суммы
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Вывод средств'),
                    content: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Введите сумму для вывода'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // закрыть диалоговое окно
                        },
                        child: const Text('Отмена'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Действия при подтверждении вывода средств
                          Navigator.of(context).pop(); // закрыть диалоговое окно
                        },
                        child: const Text('Вывести'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Вывести средства'),
          ),
        ],
      ),
    );
  }
}