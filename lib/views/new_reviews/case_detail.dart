import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:just_audio/just_audio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../util/common_widgets.dart';

class CaseDetail extends StatefulWidget {
  const CaseDetail({super.key});

  @override
  State<CaseDetail> createState() => _CaseDetailState();
}

class _CaseDetailState extends State<CaseDetail> {
  final CreateReviewController controller = Get.put(CreateReviewController());

  final AudioPlayer audioPlayer = AudioPlayer();
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokengenerate();
    print(controller.userInfoList);
    print(controller.uploadFilesList[0].FileName);
    audioPlayer.playbackEventStream.listen((event) {
      controller.isPlaying.value = false;
    });
  }

  tokengenerate() async {
    token = await controller.boxFilePreviewtoken();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFilesList = controller.uploadFilesList
        .where((file) => !(file.FileName?.endsWith('.m4a') ?? false))
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonWidgets().appBarCommon(context, 'My Reviews'),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUtil().h10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  caseDetailsTitleText(
                      text:
                          "${controller.userInfoList[0].FirstName} ${controller.userInfoList[0].LastName}",
                      isUserTtile: true),
                  Container(
                    decoration: BoxDecoration(
                        color: controller.userInfoList[0].CaseStatus == null
                            ? AppUtil().textcolor.withOpacity(0.5)
                            : AppUtil().textcolor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Download Second Opinion',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 35),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppUtil().containerColor,
              ),
              Row(
                children: [
                  caseDetailsSubtitile(
                    text: 'Case Status: ',
                  ),
                  caseDetailsSubtitile(
                      text: 'In Progress', color: Colors.orange)
                ],
              ),
              // Row(
              //   children: [
              //     caseDetailsSubtitile(
              //       text: 'Case ID: ',
              //       color: Colors.grey,
              //     ),
              //     caseDetailsSubtitile(
              //         text: controller.userInfoList[0].id.toString(),
              //         color: Colors.grey),
              //   ],
              // ),
              Row(
                children: [
                  caseDetailsSubtitile(
                    text: 'Submitted On: ',
                    color: Colors.grey,
                  ),
                  caseDetailsSubtitile(text: '06/10/2024', color: Colors.grey),
                ],
              ),
              Row(
                children: [
                  caseDetailsSubtitile(
                      text: 'Payment: ', fontweight: FontWeight.bold),
                  caseDetailsSubtitile(
                      text: '\$130.00', fontweight: FontWeight.bold),
                ],
              ),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              caseDetailsTitleText(text: 'Personal Info'),
              AppUtil().h10,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: AppUtil().containerColor, width: 2)),
                child: Padding(
                  padding: EdgeInsets.all(12.0).r,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          personalInfoTile(
                              title: 'First Name : ',
                              responseValue:
                                  controller.userInfoList[0].FirstName),
                          personalInfoTile(
                              title: 'DOB:',
                              responseValue:
                                  "${controller.userInfoList[0].dobd}/${controller.userInfoList[0].dobm}/${controller.userInfoList[0].doby}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          personalInfoTile(
                              title: 'Last Name : ',
                              responseValue:
                                  controller.userInfoList[0].LastName),
                          personalInfoTile(
                              title: 'Country : ', responseValue: 'India'),
                        ],
                      ),
                      personalInfoTile(
                          title: 'Gender : ',
                          responseValue:
                              controller.userInfoList[0].Gender == 'M'
                                  ? 'Male'
                                  : 'Female'),
                      personalInfoTile(
                          title: 'Cell Phone : ',
                          responseValue: controller.userInfoList[0].CellPhone),
                      personalInfoTile(
                          title: 'Occupation : ',
                          responseValue: controller.userInfoList[0].Occupation),
                    ],
                  ),
                ),
              ),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              caseDetailsTitleText(text: 'Speciality'),
              AppUtil().h10,
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 5,
                      crossAxisCount: 2),
                  itemCount: controller.specialtyList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          controller.specialtyList.isEmpty
                              ? "Podiatory"
                              : controller.specialtyList[index].SpecialtyName!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width / 35),
                        ),
                      ),
                    );
                  }),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              caseDetailsTitleText(text: 'Medical / Diagnosis Summary'),
              AppUtil().h10,
              Obx(
                () => Text(
                  (controller.userInfoList[0].MedicalSummary?.isEmpty ?? true)
                      ? 'No Medical Summary'
                      : controller.userInfoList[0].MedicalSummary!,
                  maxLines:
                      controller.isExpanded.value ? null : controller.maxlines,
                  overflow: controller.isExpanded.value
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                ),
              ),
              Obx(() {
                final medicalSummary =
                    controller.userInfoList[0].MedicalSummary;

                // Check if `medicalSummary` is not null and not empty, and its length is greater than 100
                if (medicalSummary != null &&
                    medicalSummary.isNotEmpty &&
                    medicalSummary.length > 100) {
                  return TextButton(
                    onPressed: () {
                      controller.isExpanded.value =
                          !controller.isExpanded.value;
                    },
                    child: Text(
                      controller.isExpanded.value ? 'Show Less' : 'Read More',
                      style: TextStyle(color: AppUtil().customBlue),
                    ),
                  );
                } else {
                  return SizedBox(); // Return an empty box if conditions are not met
                }
              }),
              AppUtil().h10,

              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      controller.isLoading.value = true;
                      String downloadUrl = '';

                      // Check if the file is an m4a file
                      if (controller.uploadFilesList.isNotEmpty &&
                          controller.uploadFilesList[0].FileName!
                              .endsWith('.m4a')) {
                        // Proceed if token and file format are correct
                        if (token!.isNotEmpty) {
                          downloadUrl =
                              await controller.getboxFilePreviewDownloadURl(
                                  controller.uploadFilesList[0].fl);
                        }

                        String localpath = '';
                        if (downloadUrl.isNotEmpty) {
                          localpath = await CommonWidgets().downloadFile(
                            downloadUrl,
                            filename: controller.uploadFilesList[0].FileName,
                          );
                        }

                        if (localpath.isNotEmpty) {
                          if (audioPlayer.playing) {
                            audioPlayer.stop();
                            controller.isPlaying.value = false;
                          } else {
                            await audioPlayer.setFilePath(localpath);
                            audioPlayer.play();
                            controller.isPlaying.value = true;
                          }
                        }
                      } else {
                        // Show message if file is not an m4a file
                        controller.isPlaying.value = false;
                      }
                      controller.isLoading.value = false;
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => controller.isLoading.value
                              ? LoadingAnimationWidget.discreteCircle(
                                  color: AppUtil().textcolor,
                                  size: 20.r,
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      controller.isPlaying.value
                                          ? Icons.stop
                                          : Icons.play_arrow_rounded,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 5),
                                    controller.uploadFilesList.isEmpty ||
                                            !controller
                                                .uploadFilesList[0].FileName!
                                                .endsWith('.m4a')
                                        ? Text('No Recorded Summary')
                                        : Text(
                                            '${controller.uploadFilesList[0].FileName!.substring(0, 8)}...${controller.uploadFilesList[0].FileName!.split('_').last}',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              caseDetailsTitleText(text: 'Medical Records'),
              AppUtil().h10,
              filteredFilesList.isEmpty
                  ? Text('No Medical Records')
                  : GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 0,
                        childAspectRatio: 5,
                        crossAxisCount: 2,
                      ),
                      itemCount: filteredFilesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            controller.downloadingFileIndex.value = index;
                            String downloadUrl = '';
                            if (token!.isNotEmpty) {
                              downloadUrl =
                                  await controller.getboxFilePreviewDownloadURl(
                                      filteredFilesList[index].fl);
                            }
                            String localpath = '';
                            if (downloadUrl.isNotEmpty) {
                              localpath = await CommonWidgets().downloadFile(
                                  downloadUrl,
                                  filename: filteredFilesList[index].FileName);
                            }
                            if (localpath.isNotEmpty) {
                              CommonWidgets().openFile(localpath);
                            }
                            controller.downloadingFileIndex.value = -1;
                          },
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.36,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => controller.downloadingFileIndex.value ==
                                        index
                                    ? Center(
                                        child: LoadingAnimationWidget
                                            .discreteCircle(
                                          color: AppUtil().textcolor,
                                          size: 20.r,
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 25,
                                            child: SvgPicture.asset(
                                              'assets/icons/pdf.svg', // Use the icon path based on file type
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              filteredFilesList[index]
                                                  .FileName!,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              caseDetailsTitleText(text: 'Current Medicatons'),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemCount: controller.medicationList.length,
                  itemBuilder: (context, index) {
                    return medicationInfoTile(
                        title: 'Medication Name : ',
                        responseValue: controller.medicationList.isEmpty
                            ? "Citrizen"
                            : controller.medicationList[index].MedicationName,
                        startyear: 'Start Date : ',
                        startYearResponse: controller.medicationList.isEmpty
                            ? "11/2023"
                            : "${controller.medicationList[index].mn.toString()}/${controller.medicationList[index].yr}",
                        index: index + 1);
                  }),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              // caseDetailsTitleText(text: 'Follow-up Questions'),
              // AppUtil().h10,
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('1. ', style: TextStyle(fontSize: 15)),
              //     Expanded(
              //         child: caseDetailsSubtitile(
              //             text:
              //                 'Is the diagnosis accurate? If discrepancies exist, what alternative diagnoses should be considered?')),
              //   ],
              // ),
              // AppUtil().h5,
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('2. ', style: TextStyle(fontSize: 15)),
              //     Expanded(
              //         child: caseDetailsSubtitile(
              //             text:
              //                 'What if I need an in-person visit after the telemedicine consultation?')),
              //   ],
              // ),
              // AppUtil().h5,
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('3. ', style: TextStyle(fontSize: 15)),
              //     Expanded(
              //         child: caseDetailsSubtitile(
              //             text:
              //                 'Is the diagnosis accurate? If discrepancies exist, what alternative diagnoses should be considered?')),
              //   ],
              // ),
              // AppUtil().h10
            ],
          ),
        ),
      ),
    );
  }

  Text caseDetailsTitleText({String? text, bool? isUserTtile = false}) {
    return Text(
      isUserTtile == true ? text!.toUpperCase() : text!,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.sp),
      overflow: TextOverflow.ellipsis,
    );
  }

  Text caseDetailsSubtitile(
      {String? text,
      double? fontsize = 16,
      Color? color = Colors.black,
      FontWeight fontweight = FontWeight.normal}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontsize?.sp,
        color: color,
        fontWeight: fontweight,
      ),
    );
  }

  Padding personalInfoTile({String? title, String? responseValue}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Text(
            title!,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 5,
          ),
          Text(responseValue!,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
        ],
      ),
    );
  }

  Padding medicationInfoTile(
      {String? title,
      String? responseValue,
      String? startyear,
      String? startYearResponse,
      int? index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${index.toString()}.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Text(responseValue!,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
            ],
          ),
          AppUtil().h5,
          Row(
            children: [
              Text(
                startyear!,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Text(startYearResponse!,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
            ],
          ),
        ],
      ),
    );
  }
}
