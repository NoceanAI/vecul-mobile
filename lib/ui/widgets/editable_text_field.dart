import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class EditableTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  const EditableTextField(
      {Key? key, required this.hintText, this.controller, this.textInputType})
      : super(key: key);

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool _isReadOnly = true;

  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(5.r),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteF9,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: _isReadOnly,
              style: TextStyle(
                fontFamily: sfPro,
                color: AppColors.black33,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              keyboardType: widget.textInputType,
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIconColor: AppColors.grey82.withOpacity(0.53),
                contentPadding:
                EdgeInsets.symmetric(vertical: 18.r, horizontal: 16.r),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: sfPro,
                  color: AppColors.grey82.withOpacity(0.53),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                _isReadOnly = !_isReadOnly;
              });
            },
            child: Text(
              _isReadOnly ? 'Edit' : 'Done',
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.blue00,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}