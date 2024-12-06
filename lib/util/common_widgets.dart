import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CommonWidgets {
  Container textFormField(
      {TextEditingController? txtController,
      String? hinttext,
      Widget? prefixIcon,
      TextInputType keyboardtype = TextInputType.text}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xB2B0C7E6), width: 1),
      ),
      child: TextFormField(
        controller: txtController,
        keyboardType: keyboardtype,
        cursorColor: AppUtil().textcolor,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }

  Future<String> downloadFile(String url, {String? filename}) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$filename';

    // Check if the file already exists
    if (await File(filePath).exists()) {
      print("File already exists at: $filePath");
      return filePath; // Return the existing file path
    }

    // If file does not exist, download it
    final response = await http.get(Uri.parse(url));
    print("Download response status: ${response.statusCode}");

    // Check for a successful response
    if (response.statusCode == 200) {
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      print("File downloaded and saved at: $filePath");
      return filePath; // Return the new file path
    } else {
      print("Failed to download file: ${response.statusCode}");
      throw Exception('Failed to download file');
    }
  }

  void openFile(String filePath, {String? type}) async {
    debugPrint("Attempting to open file at: $filePath");
    final result = await OpenFile.open(filePath, type: type);
    debugPrint("Open file result: ${result.message}");
  }

  AppBar appBarCommon(BuildContext context, String titile,
      {CreateReviewController? controller}) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
        child: GestureDetector(
          onTap: () {
            controller?.dispose();
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(
        titile,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }

  SnackBar snackBarinfo(String content) {
    return SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppUtil().textcolor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            content,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
