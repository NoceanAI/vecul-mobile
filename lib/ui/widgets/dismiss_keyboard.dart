import 'package:flutter/cupertino.dart';

class DismissKeyboard extends StatelessWidget {

  final Widget child;

  const DismissKeyboard({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode _currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        if (!_currentFocus.hasPrimaryFocus) _currentFocus.unfocus();
      },
      child: child,
    );
  }

}