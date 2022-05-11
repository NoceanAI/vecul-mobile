import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:vecul/core/data_sources/core_data_source.dart';
import 'package:vecul/core/networking/network_helper.dart';
import 'package:vecul/ui/exports.dart';

class EditProfileViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final CoreDataSource _coreDataSource = CoreDataSource();
  // final
  Future<XFile?> pickFile() async {
    //FilePickerResult? result = await FilePicker.platform.pickFiles()

    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(
        maxWidth: 100,
        maxHeight: 100,
        source: ImageSource.gallery,
      );
      return image;
    } catch (e) {
      _dialogService.showWarningDialog('Error occurred, please try again');
    }
    notifyListeners();
    return null;
  }

  Future uploadProfilePic() async {
    // something();
    // return;
    XFile? image = await pickFile();
    if (image != null) {
      setBusy(true);
      try {
        // File file = File(image.path);
        // var imageBytes = await file.readAsBytes();
        // String base64String = base64.encode(imageBytes);
        // print(base64String);
        // await _coreDataSource.uploadPic({
        //   'content': imageBytes,
        // });
        await _coreDataSource.uploadProfilePic(await image.readAsBytes());
        setBusy(false);
      } catch (e) {
        setBusy(false);
        _dialogService.showWarningDialog(e.toString());
      }
    }
  }

  // void something() async{
  //   String uploadUrl = 'https://05r83lri5a.execute-api.us-east-1.amazonaws.com/dev/core/v1/profile_pic_upload/profile_pics/barryolusesi.png';
  //   try{
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(
  //       maxWidth: 100,
  //       maxHeight: 100,
  //       source: ImageSource.gallery,
  //     );
  //     var imageFile = File(image!.path);
  //     // Convert image to base64
  //     var bytes = imageFile.readAsBytesSync();
  //     String imagenConvertida = base64.encode(bytes);
  //     print('Value of bytes: $bytes');
  //     print('Value of imagenConvertida: $imagenConvertida');
  //     // Convert base64 to image
  //     Uint8List decodedBytes = base64.decode(imagenConvertida);
  //     String baseimage = base64Encode(decodedBytes);
  //
  //     // Uint8List imageBytes = File(image!.path).readAsBytesSync();
  //     // print('works');
  //     // String baseimage = base64.encode(imageBytes);
  //     //convert file image to Base64 encoding
  //     var response = await http.post(
  //         Uri.parse(uploadUrl),
  //         headers: {
  //           'Content-Type': 'image/png',
  //         },
  //         body: {
  //           'image': baseimage,
  //         }
  //     );
  //     print(response.body);
  //     // if(response.statusCode == 200){
  //     //   var jsondata = json.decode(response.body); //decode json data
  //     //   if(jsondata["error"]){ //check error sent from server
  //     //     print(jsondata["msg"]);
  //     //     //if error return from server, show message from server
  //     //   }else{
  //     //     print("Upload successful");
  //     //   }
  //     // }else{
  //     //   throw;
  //     //   //there is error during connecting to server,
  //     //   //status code might be 404 = url not found
  //     // }
  //   }catch(e){
  //     rethrow;
  //     //there is error during converting file image to base64 encoding.
  //   }
  // }
}
