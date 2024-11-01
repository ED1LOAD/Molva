import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Transaction {
  final String description;
  final double amount;
  final String date;
  final bool isIncome;
  final String company;

  Transaction({
    required this.description,
    required this.amount,
    required this.date,
    required this.isIncome,
    required this.company,
  });
}

class BalancesScreenDistrtibutor extends StatefulWidget {
  const BalancesScreenDistrtibutor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BalancesScreenDistrtibutorState createState() =>
      _BalancesScreenDistrtibutorState();
}

class _BalancesScreenDistrtibutorState
    extends State<BalancesScreenDistrtibutor> {
  // Пример списка операций (можно заменить на реальные данные)
  List<Transaction> transactions = [];

  bool _isAll = true;
  bool _isAdd = false;
  bool _isMinus = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'Балансы',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
      body: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BalanceBlock(balance: "39000"),
              const SizedBox(height: 20),
              Text(
                "Лента операций",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 20),
              transactions.isNotEmpty ? _topButtons() : Container(),
              transactions.isNotEmpty
                  ? const SizedBox(
                      height: 10,
                    )
                  : Container(),
              transactions.isEmpty ? const NonFoundImage() : Container(),
              transactions.isNotEmpty
                  ? Flexible(
                      child: _checksBuilder(),
                    )
                  : Container(),
              const Spacer(),
              WithdrawalButton(
                text: "Счета",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Checks(),
                    ),
                  );
                },
                color: darkgray,
              ),
              const SizedBox(
                height: 10,
              ),
              WithdrawalButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WithdrawScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'Балансы',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BalanceBlock(balance: "39000"),
                const SizedBox(height: 20),
                Text(
                  "Лента операций",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                ),
                const SizedBox(height: 20),
                transactions.isNotEmpty ? _topButtons() : Container(),
                transactions.isNotEmpty
                    ? const SizedBox(
                        height: 10,
                      )
                    : Container(),
                transactions.isEmpty ? const NonFoundImage() : Container(),
                transactions.isNotEmpty
                    ? Flexible(
                        child: _checksBuilder(),
                      )
                    : Container(),
                const Spacer(),
                WithdrawalButton(
                  text: "Счета",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Checks(),
                      ),
                    );
                  },
                  color: darkgray,
                ),
                const SizedBox(
                  height: 10,
                ),
                WithdrawalButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WithdrawScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Row(
        children: [
          TopButton(
            text: "Все",
            onPressedVacancies: () {
              setState(() {
                _isAll = true;
                _isAdd = false;
                _isMinus = false;
              });
            },
            isVacancies: _isAll,
            padding: EdgeInsets.zero,
            width: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: TopButton(
              text: "Пополнение",
              onPressedVacancies: () {
                setState(() {
                  _isAll = false;
                  _isAdd = true;
                  _isMinus = false;
                });
              },
              isVacancies: _isAdd,
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: TopButton(
              text: "Вывод",
              onPressedVacancies: () {
                setState(() {
                  _isAll = false;
                  _isAdd = false;
                  _isMinus = true;
                });
              },
              isVacancies: _isMinus,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  // Тут очень плохо с поиском подходящих вакансий. Нужно переписать.
  ListView _checksBuilder() {
    List<Transaction> validTransactions = transactions;
    if (_isAdd) {
      validTransactions =
          transactions.where((element) => element.isIncome).toList();
    } else if (_isMinus) {
      validTransactions =
          transactions.where((element) => !element.isIncome).toList();
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: validTransactions.length,
      itemBuilder: (context, index) {
        final transaction = validTransactions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                _showDialog(transaction);
              },
              leading: transaction.isIncome
                  ? Image.asset(
                      "assets/agent_balance/add.png",
                      width: 24,
                    )
                  : Image.asset(
                      "assets/agent_balance/minus.png",
                      width: 24,
                    ),
              title: Text(
                transaction.company,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                transaction.date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 12,
                    ),
              ),
              trailing: Text(
                "${transaction.amount} ₽",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDialog(Transaction transaction) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  const CloseButton(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextOperation(operation: "123456"),
                        const SizedBox(height: 20),
                        TextIncome(isIncome: transaction.isIncome),
                        const SizedBox(height: 10),
                        transaction.isIncome
                            ? TextDate(text1: "От:", text2: transaction.company)
                            : Container(),
                        transaction.isIncome
                            ? const SizedBox(height: 10)
                            : Container(),
                        TextDate(
                          text1: "Дата поступления:",
                          text2: transaction.date,
                        ),
                        const SizedBox(height: 10),
                        TextDate(
                          text1: "Сумма:",
                          text2: "${transaction.amount} ₽",
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}

class WithdrawalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  const WithdrawalButton({
    super.key,
    this.text = "Пополнить счет",
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: color == null ? gradient : null,
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class NonFoundImage extends StatelessWidget {
  const NonFoundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Image.asset(
              "assets/agent_balance/wallet.png",
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Center(
        child: Text(
          "Здесь будут отражены ваши балансовые операции ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ]);
  }
}

class BalanceBlock extends StatelessWidget {
  final String balance;
  final String title;

  const BalanceBlock({
    super.key,
    required this.balance,
    this.title = "Баланс:",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
            ),
            Text(
              '$balance ₽',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextDate extends StatelessWidget {
  final String text1;
  final String text2;
  const TextDate({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: darkgray,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(width: 10),
        Text(
          text2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: 15,
      child: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.black,
          size: 20,
        ),
        onPressed: () => Navigator.pop(context), // Close the dialog
      ),
    );
  }
}

class TextOperation extends StatelessWidget {
  final String operation;
  const TextOperation({
    super.key,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Операция №$operation",
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class TextIncome extends StatelessWidget {
  final bool isIncome;
  const TextIncome({
    super.key,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return isIncome
        ? Text(
            "Пополнение счета",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          )
        : Text(
            "Вывод средств",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({
    super.key,
    required String text,
    required VoidCallback onPressedVacancies,
    required bool isVacancies,
    required EdgeInsets padding,
    double? width,
  })  : _text = text,
        _padding = padding,
        _onPressedVacancies = onPressedVacancies,
        _isVacancies = isVacancies,
        _width = width;

  final EdgeInsets _padding;
  final String _text;
  final VoidCallback _onPressedVacancies;
  final bool _isVacancies;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: InkWell(
        child: GestureDetector(
          onTap: () {
            _onPressedVacancies();
          },
          child: Container(
            width: _width,
            height: 36,
            decoration: BoxDecoration(
              color: !_isVacancies ? background : blue1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: _isVacancies ? Colors.white : Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String sum = "";

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: Text(
            'Вывод средств',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BalanceBlock(
                  balance: "39000",
                  title: "Доступно к выводу:",
                ),
                const SizedBox(height: 20),
                Text(
                  "Введите сумму к выводу:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    sum = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Сумма',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    fillColor: background,
                    filled: true,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Spacer(),
                WithdrawalButton(
                  text: "Подтвердить сумму",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1024),
              child: AppBar(
                backgroundColor: background,
                centerTitle: true,
                title: Text(
                  'Вывод средств',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BalanceBlock(
                    balance: "39000",
                    title: "Доступно к выводу:",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Введите сумму к выводу:",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      sum = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Сумма',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: background,
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const Spacer(),
                  WithdrawalButton(
                    text: "Подтвердить сумму",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Checks extends StatefulWidget {
  const Checks({super.key});

  @override
  State<Checks> createState() => _ChecksState();
}

class _ChecksState extends State<Checks> {
  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: Text(
            'Счета',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Check(
                  title: "Токарь",
                  description: "Описание",
                  date: "12.12.2022",
                  sum: 10000,
                  isPayed: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Check(
                  title: "Менеджер по развитию",
                  description: "Описание",
                  date: "12.12.2022",
                  sum: 10000,
                  isPayed: true,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1024),
              child: AppBar(
                backgroundColor: background,
                centerTitle: true,
                title: Text(
                  'Счета',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Check(
                    title: "Токарь",
                    description: "Описание",
                    date: "12.12.2022",
                    sum: 10000,
                    isPayed: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Check(
                    title: "Менеджер по развитию",
                    description: "Описание",
                    date: "12.12.2022",
                    sum: 10000,
                    isPayed: true,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Check extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final int sum;
  final bool isPayed;

  const Check({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.sum,
    required this.isPayed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Публикация вакансии:",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isPayed
                        ? const Color(0xff61E36E)
                        : const Color(0xffFBC756),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    isPayed ? "оплачено" : "ожидает оплаты",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "$sum ₽",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
