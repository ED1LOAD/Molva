import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequirmentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RequirmentButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFFF888888),
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
class EditButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const EditButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: gradient,
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
class CompanyData extends StatefulWidget {
  @override
  State<CompanyData> createState() => _CompanyDataState();
}

class _CompanyDataState extends State<CompanyData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          clipBehavior: Clip.none,
          title: Text(
            'Уведомления',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.0,
                ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.sort),
            color: darkgray,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: darkgray,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Название Юр.Лица',
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
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: 'ИНН/ОГРН',
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
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Юр.Адрес',
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
            SizedBox(height: 10),
            RequirmentButton(text: 'Банковские реквезиты', onPressed: () {}),
            Spacer(),
            Text('После редактирования с вами свяжется поддержка для уточнения информации, после чего она будет изменена',
            style: TextStyle(fontSize: 12, color: Colors.grey),),
            EditButton(text: 'Редактировать' , onPressed: () {}),
          ],
          ),bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Цвет фона нижнего меню
        selectedItemColor: blue1, // Цвет выбранного элемента
        unselectedItemColor: darkgray, // Цвет не выбранных элементов
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Баланс',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Вакансии',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
        );
        
  }
}


/*

*/