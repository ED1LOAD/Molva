import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
import 'package:intl/intl.dart';

class CustomCalendarScreen extends StatefulWidget {
  const CustomCalendarScreen({super.key});

  @override
  CustomCalendarScreenState createState() => CustomCalendarScreenState();
}

class CustomCalendarScreenState extends State<CustomCalendarScreen> {
  final List<Map<String, dynamic>> selectedSlots = [];

  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ваш календарь',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Выберите дни и время, когда готовы к интервью с кандидатом',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                _buildMonthYearSelector(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TableView.builder(
                      columnCount: _daysOfCurrentMonth.length + 1,
                      rowCount: _timeSlots.length + 1,
                      cellBuilder:
                          (BuildContext context, TableVicinity vicinity) {
                        if (vicinity.row == 0 && vicinity.column == 0) {
                          return TableViewCell(
                            child: Container(),
                          );
                        } else if (vicinity.row == 0) {
                          return TableViewCell(
                            child: _buildDateAndDayOfWeekCell(
                                _daysOfCurrentMonth[vicinity.column - 1]),
                          );
                        } else if (vicinity.column == 0) {
                          return TableViewCell(
                            child: _buildTimeCell(_timeSlots[vicinity.row - 1]),
                          );
                        } else {
                          return TableViewCell(
                            child: _buildTimeSlot(
                                _daysOfCurrentMonth[vicinity.column - 1],
                                _timeSlots[vicinity.row - 1]),
                          );
                        }
                      },
                      columnBuilder: (int column) {
                        return TableSpan(
                          extent: column == 0
                              ? const FixedTableSpanExtent(55)
                              : const FixedTableSpanExtent(40),
                          foregroundDecoration: TableSpanDecoration(
                            border: TableSpanBorder(
                              trailing: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                      rowBuilder: (int row) {
                        return TableSpan(
                          extent: const FixedTableSpanExtent(40),
                          foregroundDecoration: TableSpanDecoration(
                            border: TableSpanBorder(
                              trailing: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomActionButton(), // Moved to the bottom
        ],
      ),
    );
  }

  Widget _buildBottomActionButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: selectedSlots.isNotEmpty
          ? _buildConfirmButton()
          : _buildBottomShareButton(),
    );
  }

  Widget _buildMonthYearSelector() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _currentDate =
                    DateTime(_currentDate.year, _currentDate.month - 1);
              });
            },
          ),
          Text(
            DateFormat.yMMMM('ru').format(_currentDate),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                _currentDate =
                    DateTime(_currentDate.year, _currentDate.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndDayOfWeekCell(String date) {
    final DateTime dayDate = DateFormat('dd.MM').parse(date);
    final String dayOfWeek = DateFormat.E('ru').format(dayDate).toUpperCase();
    final bool isWeekend = dayDate.weekday == DateTime.saturday ||
        dayDate.weekday == DateTime.sunday;

    return Column(
      children: [
        Text(
          dayOfWeek,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isWeekend ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }

  Widget _buildTimeCell(String time) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        time,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildTimeSlot(String day, String time) {
    bool isSelected =
        selectedSlots.any((slot) => slot["day"] == day && slot["time"] == time);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSlots.removeWhere(
                (slot) => slot["day"] == day && slot["time"] == time);
          } else {
            selectedSlots.add({"day": day, "time": time});
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0582EE) : Colors.white,
          border: Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: isSelected
              ? const Icon(Icons.check_circle, color: Colors.white)
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildBottomShareButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minHeight: 48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Поделиться всем календарем',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black, // Set text color to black
                      fontSize: 16,
                    ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // Add padding if needed
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
        ),
        child: Ink(
          decoration: const BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 48.0),
            child: const Text(
              'Подтвердить',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  List<String> get _timeSlots => [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
      ];

  List<String> get _daysOfCurrentMonth {
    List<String> days = [];
    int daysInMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateFormat('dd.MM', 'ru')
          .format(DateTime(_currentDate.year, _currentDate.month, i)));
    }
    return days;
  }
}
