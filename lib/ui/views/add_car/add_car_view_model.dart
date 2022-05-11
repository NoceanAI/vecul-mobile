import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vecul/core/data_sources/car_data_source.dart';
import 'package:vecul/core/data_sources/core_data_source.dart';
import 'package:vecul/ui/exports.dart';

class AddCarViewModel extends BaseViewModel{
  final TextEditingController carMake = TextEditingController();
  final TextEditingController carModel = TextEditingController();
  final TextEditingController carYear = TextEditingController();
  final TextEditingController carState = TextEditingController();
  final TextEditingController carPrice = TextEditingController();
  final TextEditingController carPickupPoint = TextEditingController();
  final TextEditingController carReturnPoint = TextEditingController();
  final TextEditingController mileage = TextEditingController();
  final TextEditingController transmission = TextEditingController();
  final TextEditingController carVIN = TextEditingController();
  final TextEditingController description = TextEditingController();
  final CarDataSource _carDataSource = CarDataSource();
  final CoreDataSource _coreDataSource = CoreDataSource();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DialogService _dialogService = locator<DialogService>();

  final ImagePicker _picker = ImagePicker();


  Future pickFile() async {
    //FilePickerResult? result = await FilePicker.platform.pickFiles()
    final ImagePicker _picker = ImagePicker();
    try{
      List<XFile>? images = await _picker.pickMultiImage(
        maxWidth: 100,
        maxHeight: 100,
      );
      if (images==null){
        return null;
      }
      if (images.length< 5){
        _dialogService.showWarningDialog('Please select 5 images to proceed');
        return null;
      }
      if (images.length > 5){
        images = images.sublist(0, 5);
      }
      await _coreDataSource.uploadCarPics(images.map((e) => e.path).toList());
      await addCar();
      images;
    }catch(e){
      rethrow;
      _dialogService.showWarningDialog('Error occurred, please try again');
    }
    notifyListeners();
    return null;
  }

  Future addCar() async {
    setBusy(true);
    try {
      var data  = await _carDataSource.addCar(body: {
        'car_detail': {
          'make': carMake.text.trim(),
          'model': carModel.text.trim(),
          'pick_up_point': carPickupPoint.text.trim(),
          'return_point': carReturnPoint.text.trim(),
          'state': carState.text.trim(),
          'car_year': carYear.text.trim(),
          'milage': mileage.text.trim(),
          'vehicle_registration_due_date': '2022-05-01',
          'transmission': 'automatic',
          'vin': carVIN.text.trim(),
        },
        'owner_info': {
        },
        'car_images': {
          'image_1': 'some_url',
        },
        'reviews': {},
        'ratings': {},
        'price': carPrice.text,
        'description': description.text,
      });
      print(data);
      setBusy(false);

    } catch (e) {
      setBusy(false);
        _dialogService.showWarningDialog(e.toString());
    }
  }
  // List<XFile>? images;

  // void pickFile() async {
  //   //FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   images = await _picker.pickMultiImage(
  //     maxWidth: 100,
  //     maxHeight: 100,
  //   );
  //   print(images?.length);
  //   notifyListeners();
  // }

  @override
  void dispose() {
    carModel.dispose();
    carMake.dispose();
    mileage.dispose();
    transmission.dispose();
    description.dispose();
    carReturnPoint.dispose();
    carPickupPoint.dispose();
    carYear.dispose();
    carState.dispose();
    carPrice.dispose();
    carVIN.dispose();
    super.dispose();
  }
}