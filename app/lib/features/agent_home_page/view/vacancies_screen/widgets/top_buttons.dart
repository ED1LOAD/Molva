import 'package:app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({
    super.key,
    required isVacancies,
    required VoidCallback onPressedVacancies,
    required bool isResponds,
    required VoidCallback onPressedResponds,
  })  : _isVacancies = isVacancies,
        _onPressedVacancies = onPressedVacancies,
        _isResponds = isResponds,
        _onPressedResponds = onPressedResponds;

  final bool _isVacancies;
  final VoidCallback _onPressedVacancies;
  final bool _isResponds;
  final VoidCallback _onPressedResponds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: TopButton(
                padding: const EdgeInsets.only(
                  top: 7,
                  bottom: 7,
                  left: 7,
                ),
                text: "Вакансии",
                onPressedVacancies: _onPressedVacancies,
                isVacancies: _isVacancies,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 6,
              child: TopButton(
                padding: const EdgeInsets.only(
                  top: 7,
                  bottom: 7,
                  right: 7,
                ),
                text: "Отклики",
                onPressedVacancies: _onPressedResponds,
                isVacancies: _isResponds,
              ),
            ),
          ],
        ),
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
  })  : _text = text,
        _padding = padding,
        _onPressedVacancies = onPressedVacancies,
        _isVacancies = isVacancies;

  final EdgeInsets _padding;
  final String _text;
  final VoidCallback _onPressedVacancies;
  final bool _isVacancies;

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
