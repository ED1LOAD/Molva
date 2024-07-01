import 'package:app/theme.dart';
import 'package:flutter/material.dart';

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
