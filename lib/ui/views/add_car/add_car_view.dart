import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/core/models/user.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/dismiss_keyboard.dart';
import 'package:vecul/ui/widgets/editable_text_field.dart';
import 'add_car_view_model.dart';
import 'package:vecul/ui/views/index/index_view_model.dart';
import 'package:vecul/ui/widgets/custom_button.dart';
import 'package:vecul/ui/widgets/custom_textfield.dart';

class AddCarView extends StatelessWidget {
  const AddCarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.r),
    );
    final User user = SharedPrefsService().getUser();
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20.r,
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: const Color(0xFF0D1C2E),
              size: 25.r,
            ),
            onPressed: () {
              locator<IndexViewModel>().setIndex(0);
            },
          ),
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(width: 20.r),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            child: ViewModelBuilder<AddCarViewModel>.reactive(
              builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 23.r,
                          backgroundColor: AppColors.blue00,
                          child: Text(
                            '${user.givenName[0]}${user.familyName[0]}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.givenName} ${user.familyName}',
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: AppColors.black4F,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Listing on vecul',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.greyBD,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CupertinoButton(
                      onPressed: model.pickFile,
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 182.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: const Color(0xFFF2F2F2),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'cloud_upload'.png,
                          width: 52.r,
                          height: 52.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Photos. 0/5 choose your listing\'s main photo first. Add more photos with multiple angles to show any damage or wear.',
                      style: TextStyle(
                        color: AppColors.grey82,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 29.h),
                    EditableTextField(
                      hintText: 'Car Make',
                      controller: model.carMake,
                    ),
                    SizedBox(height: 24.h),
                    EditableTextField(
                      hintText: 'Car Model',
                      controller: model.carModel,
                    ),
                    SizedBox(height: 24.h),
                    EditableTextField(
                      hintText: 'Car Year',
                      controller: model.carYear,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 24.h),
                    EditableTextField(
                      hintText: 'State, Country',
                      controller: model.carState,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      prefixText: '₦ ',
                      hintText: 'Price',
                      controller: model.carPrice,
                      textInputAction: TextInputAction.next,
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                        hintText: 'Pickup point',
                        controller: model.carPickupPoint,
                        textInputAction: TextInputAction.next),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      hintText: 'Return Point',
                      textInputAction: TextInputAction.next,
                      controller: model.carReturnPoint,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      hintText: 'Mileage',
                      textInputAction: TextInputAction.next,
                      controller: model.mileage,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      hintText: 'VIN (Vehicle identification number)',
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      controller: model.carVIN,
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      style: TextStyle(
                        color: AppColors.black33,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                      controller: model.description,
                      maxLines: null,
                      maxLength: 250,
                      minLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        suffixIconColor: AppColors.grey82.withOpacity(0.53),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 18.r, horizontal: 16.r),
                        fillColor: AppColors.whiteF9,
                        filled: true,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border.copyWith(
                          borderSide: const BorderSide(color: AppColors.blue00),
                        ),
                        hintText: 'Description',
                        hintStyle: TextStyle(
                          fontFamily: sfPro,
                          color: AppColors.grey82.withOpacity(0.53),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      text: 'Upload',
                      isLoading: model.isBusy,
                      onTap: model.pickFile,
                    ),
                    SizedBox(height: 43.h),
                  ],
                );
              },
              viewModelBuilder: () => AddCarViewModel(),
            ),
          ),
        ),
      ),
    );
  }
}
