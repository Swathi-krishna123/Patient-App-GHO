import 'dart:developer';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/patientinfo.dart';
import 'package:just_audio/just_audio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;
import '../../../controller.dart/app_controller.dart';
import '../../../util/constant.dart';
import '../../../util/routes.dart';

// ignore: must_be_immutable
class MedicalDetails extends StatelessWidget {
  MedicalDetails({super.key});
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final CreateReviewController controller = Get.put(CreateReviewController());
  final AppUserController userController = Get.put(AppUserController());
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController summarycontroller = TextEditingController();
  TextEditingController questionController = TextEditingController();
  TextEditingController editquestioncontroller = TextEditingController();
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  final _formkey = GlobalKey<FormState>();
  FocusNode summaryFocusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(1);
    });
    return WillPopScope(
      onWillPop: () async {
        controller.setStep(0); // Set to step 0 when navigating back
        return true; // Allow the navigation to happen
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
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
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
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
                      'Medical/Diagnosis Summary',
                      style: TextStyle(
                          color: AppUtil().textcolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFFC7DFFE)),
                      child: Center(
                        child: Text(
                          'Speciality',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(
                      () => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,

                            hint: Text(
                              'Select Specialty',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: controller.specialityDropdownItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item['id']
                                          .toString(), // Use ID as value (String format)
                                      child: Text(
                                        item[
                                            'nm'], // Display the name in the dropdown
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value:
                                controller.selectedValue.value, // Selected ID
                            onChanged: (value) {
                              controller.selectedValue.value =
                                  value; // Update selected ID
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 45,
                              padding: EdgeInsets.only(right: 10),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              maxHeight: 275,
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 40,
                            ),
                            dropdownSearchData: DropdownSearchData(
                              searchController: searchcontroller,
                              searchInnerWidgetHeight: 50,
                              searchInnerWidget: Container(
                                height: 50,
                                padding: EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  cursorColor: AppUtil().textcolor,
                                  expands: true,
                                  maxLines: null,
                                  controller: searchcontroller,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Search Specialty',
                                    hintStyle: TextStyle(fontSize: 12),
                                    focusedBorder: InputBorder.none,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                final searchTerm = searchValue.toLowerCase();
                                // Search based on the name ('nm')
                                return item.child
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchTerm);
                              },
                            ),
                            onMenuStateChange: (isOpen) {
                              if (!isOpen) {
                                searchcontroller.clear();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: summarycontroller,
                        focusNode: summaryFocusnode,
                        onFieldSubmitted: (value) => false,
                        cursorColor: AppUtil().textcolor,
                        validator: userController.validateField,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText:
                              'Describe Your Condition & Concerns: Provide a brief history, diagnosis details, and any concerns about treatment recommendations',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).r,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'Share Your Medical Summary via Voice',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                )),
                                Obx(
                                  () => GestureDetector(
                                    onTap: () async {
                                      if (controller.isRecording.value) {
                                        String? filePath =
                                            await audioRecorder.stop();
                                        print(filePath);
                                        if (filePath != null) {
                                          controller.recordingPath.value =
                                              filePath;
                                          print(controller.recordingPath.value);
                                          controller.isRecording.value = false;
                                        }
                                      } else {
                                        if (await audioRecorder
                                            .hasPermission()) {
                                          final Directory appDocumentsDir =
                                              await getApplicationDocumentsDirectory();
                                          final String filePath = p.join(
                                              appDocumentsDir.path,
                                              "recording.m4a");
                                          print(filePath);
                                          await audioRecorder.start(
                                              const RecordConfig(),
                                              path: filePath);
                                          controller.isRecording.value = true;
                                          controller.recordingPath.value = '';
                                        }
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: AppUtil().textcolor,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                controller.isRecording.value
                                                    ? Icons.stop
                                                    : Icons.mic,
                                                color: AppUtil().textcolor,
                                                size: 25,
                                              ),
                                              Text(
                                                controller.isRecording.value
                                                    ? 'Stop Recording'
                                                    : 'Record Now',
                                                style: TextStyle(
                                                    color: AppUtil().textcolor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => controller.recordingPath.value != ''
                                  ? Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Obx(
                                          () => controller
                                                      .recordingPath.value !=
                                                  ''
                                              ? Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/voicerecord.svg',
                                                      color:
                                                          AppUtil().textcolor,
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "Case${controller.reviewPatientModel.value?.Data[0][0].id}_Recorded_medical_summary",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 35,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        debugPrint(controller
                                                            .recordingPath
                                                            .value);
                                                        if (audioPlayer
                                                            .playing) {
                                                          audioPlayer.stop();
                                                          controller.isPlaying
                                                              .value = false;
                                                        } else {
                                                          await audioPlayer
                                                              .setFilePath(
                                                                  controller
                                                                      .recordingPath
                                                                      .value);
                                                          audioPlayer.play();
                                                          controller.isPlaying
                                                              .value = true;
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: Icon(
                                                          controller.isPlaying
                                                                  .value
                                                              ? Icons.stop
                                                              : Icons
                                                                  .play_arrow_rounded,
                                                          color: Colors.black54,
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.recordingPath
                                                            .value = '';
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: Icon(
                                                          Icons
                                                              .delete_outline_rounded,
                                                          color: Colors.black54,
                                                          size: 28,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('No Voice Attached')],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/medicaldetailsquestion.svg',
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Please select the question addressed by the reviewer',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.questionData.length,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Obx(() {
                                          return ListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 5),
                                            title: Text(controller
                                                .questionData[index].Question),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                var selectedQuestion =
                                                    controller
                                                        .questionData[index];
                                                // Ensure you're adding both 'id' and 'question'
                                                if (!controller
                                                    .selectedQuestions
                                                    .any((q) =>
                                                        q['id'] ==
                                                        selectedQuestion.id)) {
                                                  controller.selectedQuestions
                                                      .add({
                                                    'id': selectedQuestion.id,
                                                    'question': selectedQuestion
                                                        .Question,
                                                  });
                                                }
                                                log("selected question id : ${selectedQuestion.id}");
                                              },
                                              child: Icon(Icons.add,
                                                  color: Colors.black),
                                            ),
                                          );
                                        });
                                      },
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    custombottomsheet(
                                      context,
                                      txtcontroller: questionController,
                                      hinttext: 'Enter your question',
                                      onTap: () {
                                        // Check if the text field is empty
                                        if (questionController.text.isEmpty) {
                                          // Show a message or a snackbar to indicate that the text is required
                                          Get.snackbar(
                                            'Input Required',
                                            'Please enter a question before saving.',
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor:
                                                AppUtil().textcolor,
                                            colorText: Colors.white,
                                          );
                                        } else {
                                          
                                          // Add the question to the list and close the bottom sheet
                                          controller.customQuestions
                                              .add(questionController.text);
                                          Get.back();
                                          questionController
                                              .clear(); // Clear the text field after adding
                                        }
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: AppUtil().textcolor),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 10,
                                              top: 10)
                                          .r,
                                      child: Center(
                                        child: Text(
                                          'Add Your Question',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppUtil().textcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount:
                                        controller.selectedQuestions.length,
                                    itemBuilder: (context, index) {
                                      // Get the 'id' and 'question' fields properly from the map
                                     var selectedQuestion = controller.selectedQuestions[index];
                                      return ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title:
                                            Text(selectedQuestion['question']),
                                        trailing: SizedBox(
                                          width: 56,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  editquestioncontroller.text =
                                                      selectedQuestion[
                                                          'question'];
                                                  custombottomsheet(
                                                    context,
                                                    txtcontroller:
                                                        editquestioncontroller,
                                                    hinttext: selectedQuestion[
                                                        'question'],
                                                    onTap: () async {
                                                      var questionId =
                                                          selectedQuestion[
                                                              'id'];
                                                      var updatedQuestion =
                                                          editquestioncontroller
                                                              .text;

                                                      // // Debugging inputs
                                                      // log('Updating Question...');
                                                      // log('Question ID: $questionId');
                                                      // log('Updated Question: $updatedQuestion');
                                                      // log('Case ID: ${controller.reviewPatientModel.value?.Data[0][0].id}');
                                                      // log("list of questions....${controller.questionData}");

                                                      var updatequestionstatus =
                                                          await controller.editcaseQuestions(
                                                              caseQuestionId:
                                                                  questionId,
                                                              question:
                                                                  updatedQuestion,
                                                              caseId: controller
                                                                  .reviewPatientModel
                                                                  .value
                                                                  ?.Data[0][0]
                                                                  .id);
                                                            
                                                      updatequestionstatus
                                                          ? Get.back()
                                                          : Get.back();
                                                    },
                                                  );
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/icons/editicon.svg',
                                                  width: 20,
                                                  height: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.selectedQuestions
                                                      .removeAt(index);
                                                },
                                                child: Icon(Icons.close_rounded,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Obx(() => controller.customQuestions.isNotEmpty
                                    ? Divider(
                                        color: Colors.grey,
                                      )
                                    : SizedBox()),
                                Obx(() => ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          controller.customQuestions.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Text(
                                            controller.customQuestions[index],
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {
                                                controller.customQuestions
                                                    .remove(controller
                                                            .customQuestions[
                                                        index]);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              )),
                                        );
                                      },
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (controller.selectedValue.value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CommonWidgets().snackBarinfo(
                                  'Please select the Specialty to continue'));
                        } else {
                          if (_formkey.currentState!.validate()) {
                            controller.isLoading.value = true;
                            var addMedicalSummarystatus = false;
                            if (summarycontroller.text.isNotEmpty) {
                              addMedicalSummarystatus =
                                  await controller.addMedicalSummary(
                                caseId: controller
                                    .reviewPatientModel.value?.Data[0][0].id,
                                medicalSummary: summarycontroller.text,
                              );
                            }
                            var addReviewSpecialityStatus = false;
                            if (controller.selectedValue.value!.isNotEmpty) {}
                            addReviewSpecialityStatus =
                                await controller.addReviewSpeciality(
                              caseId: controller
                                  .reviewPatientModel.value?.Data[0][0].id,
                              specialityId:
                                  controller.selectedValue.value, // Selected ID
                            );
                            var addCasequestionstatus = false;
                            if (questionController.text.isNotEmpty) {
                              addCasequestionstatus =
                                  await controller.addcaseQuestions(
                                      caseId: controller.reviewPatientModel
                                          .value?.Data[0][0].id,
                                      question: questionController.text);
                            }

                            var boxfileUploadstatus = false;
                            if (controller.recordingPath.value.isNotEmpty) {
                              var token =
                                  await controller.getfileUploadtokenBox();
                              boxfileUploadstatus = await controller.uploadFile(
                                  context,
                                  token,
                                  controller.recordingPath.value,
                                  filename:
                                      "Case${controller.reviewPatientModel.value?.Data[0][0].id}_Recorded_medical_summary.m4a",
                                  controller
                                      .reviewPatientModel.value?.Data[0][0].id);
                            }

                            if (addMedicalSummarystatus &&
                                    addReviewSpecialityStatus ||
                                addCasequestionstatus ||
                                boxfileUploadstatus == true) {
                              controller.isLoading.value = false;
                              Get.toNamed(PageRouteName.medicalreports);
                            }
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
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> custombottomsheet(BuildContext context,
      {TextEditingController? txtcontroller,
      String? hinttext,
      void Function()? onTap}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height /
                3, // Adjust this to fit your content
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppUtil().containerColor),
                    ),
                    child: TextFormField(
                      controller: txtcontroller,
                      cursorColor: AppUtil().textcolor,
                      validator: userController.validateField,
                      maxLines: 7,
                      decoration: InputDecoration(
                        hintText: hinttext,
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppUtil().textcolor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppUtil().textcolor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppUtil().textcolor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
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

class FileTypeIcon extends StatelessWidget {
  final String fileName;

  FileTypeIcon({required this.fileName});
  final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    final fileExtension = fileName.split('.').last.toLowerCase();
    final iconPath = controller.fileExtensionIcons[fileExtension] ??
        'assets/icons/file.svg'; // Default icon if extension is not found

    return SvgPicture.asset(
      iconPath,
      width: 45,
      height: 45,
    );
  }
}
