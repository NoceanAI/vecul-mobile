import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class UnderlineTextField extends StatefulWidget {
  final TextInputType textInputType;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  const UnderlineTextField(
      {Key? key,
        required this.textInputType,
        required this.hintText,
        this.controller,
        required this.label})
      : super(key: key);

  @override
  State<UnderlineTextField> createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  bool _isReadOnly = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black33,
              ),
            ),
            SizedBox(
              width: 206.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: _isReadOnly,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.black33,
                          ),
                          decoration: InputDecoration(
                            hintText: widget.hintText,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            _isReadOnly = !_isReadOnly;
                          });
                        },
                        child: Text(
                          _isReadOnly ? 'Edit' : 'Done',
                          style: TextStyle(
                            color: AppColors.blue00,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.greyE0,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}