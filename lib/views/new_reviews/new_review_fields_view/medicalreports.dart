import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/main.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/dio_handler.dart';
import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/medical_details.dart';
import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/patientinfo.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../util/routes.dart';

class MedicalReports extends StatelessWidget {
  MedicalReports({super.key});

  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final CreateReviewController controller = Get.put(CreateReviewController());
  FilePickerResult? result;
  final TextEditingController medicationNameController =
      TextEditingController();
  final TextEditingController startDatecontroller = TextEditingController();
  String? dobErrorMessage;
  final AppUserController userController = Get.put(AppUserController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(2);
    });
    return WillPopScope(
      onWillPop: () async {
        controller.setStep(1); // Set to step 0 when navigating back
        return true;
      },
      child: Scaffold(
        key: _scafoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            'New Second Opinion',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: StepperIcons(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Medical Reports',
                    style: TextStyle(
                        color: AppUtil().textcolor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Manage Your Medical Records:',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Upload Reports, Medication Details and Images',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Medical Reports',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () async {
                          PermissionStatus storageStatus;
                          if (Platform.isAndroid) {
                            final plugin = DeviceInfoPlugin();
                            final android = await plugin.androidInfo;
                            // Check if the SDK version is less than 33
                            storageStatus = android.version.sdkInt < 33
                                ? await Permission.storage.request()
                                : PermissionStatus.granted;
                          } else {
                            storageStatus = PermissionStatus.granted;
                          }
                          // If storage permission is granted
                          if (storageStatus.isGranted) {
                            var result = await FilePicker.platform.pickFiles(
                                allowMultiple: true, // Allow multiple files
                                type: FileType.any);

                            if (result == null) {
                              print("No file selected");
                            } else {
                              for (var element in result.files) {
                                if (element.size > 45 * 1024 * 1024) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    CommonWidgets().snackBarinfo(
                                        'The maximum file size should be less than 50 MB.'),
                                  );
                                } else {
                                  // Prevent duplicate entries
                                  if (!controller.medicalreports
                                      .contains(element.name)) {
                                    controller.medicalreports.add(element.name);
                                    controller.medicalreportspath
                                        .add(element.path!);
                                  }
                                }
                              }
                            }
                          } else {
                            print("Storage permission denied");
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppUtil().textcolor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Obx(() => controller.medicalreports.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 4, crossAxisCount: 2),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.medicalreports.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppUtil().customBlue.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: FileTypeIcon(
                                            fileName: controller
                                                .medicalreports[index]),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            controller.medicalreports[index],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.medicalreports
                                              .removeAt(index);
                                          controller.medicalreportspath
                                              .removeAt(index);
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Upload Medical Imaging (DICOM CD)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          PermissionStatus storageStatus;

                          if (Platform.isAndroid) {
                            final plugin = DeviceInfoPlugin();
                            final android = await plugin.androidInfo;
                            storageStatus = android.version.sdkInt < 33
                                ? await Permission.storage.request()
                                : PermissionStatus.granted;
                          } else {
                            storageStatus = PermissionStatus.granted;
                          }

                          if (storageStatus.isGranted) {
                            var result = await FilePicker.platform.pickFiles(
                              allowMultiple: true,
                              type: FileType.any,
                            );

                            if (result != null) {
                              for (var element in result.files) {
                                if (!controller.dicomreports
                                    .contains(element.name)) {
                                  controller.dicomreports.add(element.name);
                                  controller.dicomreportspath
                                      .add(element.path!);
                                }
                              }
                            } else {
                              print("No file selected");
                            }
                          } else {
                            print("Storage permission denied");
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppUtil().textcolor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => controller.dicomreports.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4, // Adjust as needed
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.dicomreports.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppUtil().customBlue.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: FileTypeIcon(
                                          fileName:
                                              controller.dicomreports[index],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            controller.dicomreports[index],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.dicomreports
                                              .removeAt(index);
                                          controller.dicomreportspath
                                              .removeAt(index);
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox()),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Medication Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          controller.currentMedicationButtonClicked.value =
                              true;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppUtil().textcolor)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                                child: Text(
                              'Add',
                              style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => controller.currentMedicationButtonClicked.value ==
                          false
                      ? SizedBox()
                      : Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppUtil().containerColor.withOpacity(0.1),
                              border: Border.all(
                                  color:
                                      AppUtil().customBlue.withOpacity(0.15))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 46,
                                  decoration: BoxDecoration(
                                      color: AppUtil().containerColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Medication Name',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Start Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          controller: medicationNameController,
                                          cursorColor: AppUtil().textcolor,
                                          decoration: InputDecoration(
                                            hintText: 'Medication Name',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppUtil().textcolor)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        child: TextFormField(
                                          controller: startDatecontroller,
                                          cursorColor: AppUtil().textcolor,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                7), // Allow MM/YYYY
                                            TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                                final text = newValue.text;
                                                if (newValue.text.length <
                                                    oldValue.text.length) {
                                                  return newValue;
                                                }
                                                if (text.length > 7) {
                                                  return oldValue;
                                                }
                                                StringBuffer buffer =
                                                    StringBuffer();
                                                for (int i = 0;
                                                    i < text.length;
                                                    i++) {
                                                  buffer.write(text[i]);
                                                  if (i == 1) {
                                                    buffer.write(
                                                        '/'); // Insert '/' after month
                                                  }
                                                }

                                                return TextEditingValue(
                                                  text: buffer.toString(),
                                                  selection:
                                                      TextSelection.collapsed(
                                                          offset:
                                                              buffer.length),
                                                );
                                              },
                                            ),
                                          ],
                                          onChanged: (value) {
                                            validateMedication(value, context);
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'MM/YYYY',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppUtil().textcolor)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Displaying error message
                                if (dobErrorMessage != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      dobErrorMessage!,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        var addReviewmedicationstatus = false;
                        if (medicationNameController.text.isNotEmpty &&
                            startDatecontroller.text.isNotEmpty) {
                          controller.isLoading.value = true;
                          var dateParts = startDatecontroller.text.split('/');
                          var medicationStartMonth =
                              dateParts[0]; // Extract month
                          var medicationStartYear = dateParts[1];

                          addReviewmedicationstatus =
                              await controller.addReviewMedication(
                                  caseId: controller
                                      .reviewPatientModel.value?.Data[0][0].id,
                                  medicationName: medicationNameController.text,
                                  medicationStartMonth: medicationStartMonth,
                                  medicationStartYear: medicationStartYear);
                        }
                        var getReviewCaseDetailStatus =
                            await controller.getReviewCaseDetail(
                                caseId: controller
                                    .reviewPatientModel.value?.Data[0][0].id);

                        var boxfileuploadStatus = false;
                        if (controller.medicalreportspath.isNotEmpty ||
                            controller.dicomreportspath.isNotEmpty) {
                          var boxtoken =
                              await controller.getfileUploadtokenBox();
                          var file = File(controller.medicalreportspath[0]);
                          boxfileuploadStatus = await controller.uploadFile(
                              context,
                              boxtoken,
                              controller.medicalreportspath[0],
                              filename: file.uri.pathSegments.last,
                              controller
                                  .reviewPatientModel.value?.Data[0][0].id);
                        }
                        if (addReviewmedicationstatus ||
                            getReviewCaseDetailStatus ||
                            boxfileuploadStatus == true) {
                          controller.isLoading.value = false;
                          Get.toNamed(PageRouteName.preview);
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [
                            Color(0xFF065FD5),
                            Color(0xFF064DAB),
                          ],
                        ),
                      ),
                      child: Center(
                          child: Obx(
                        () => controller.isLoading.value == false
                            ? Text(
                                'Save and Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25,
                                ),
                              )
                            : LoadingAnimationWidget.fourRotatingDots(
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width / 10,
                              ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateMedication(String value, BuildContext context) {
    final currentDate = DateTime.now();
    dobErrorMessage = null; // Reset error message

    if (value.length == 7) {
      final parts = value.split('/');
      final month = int.tryParse(parts[0]) ?? 0;
      final year = int.tryParse(parts[1]) ?? 0;

      if (month < 01 || month > 12) {
        dobErrorMessage = "Month cannot be greater than 12";
      } else if (year > currentDate.year) {
        dobErrorMessage = "Year cannot be in the future";
      } else if (DateTime(
        year,
        month,
      ).isAfter(currentDate)) {
        dobErrorMessage = "Date cannot be later than today";
      }
    }

    // Trigger a rebuild to update the error message
    (context as Element).markNeedsBuild();
  }

  Column medicalDetailsTextform(
      {String? title, TextEditingController? controller, String? hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey),
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: AppUtil().textcolor,
            maxLines: hinttext == 'Address' ? 4 : 1,
            decoration: InputDecoration(
              hintText: hinttext!,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}
