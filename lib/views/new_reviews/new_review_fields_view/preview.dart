import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/patientinfo.dart';

import '../../../util/routes.dart';

class Preview extends StatelessWidget {
  Preview({super.key});
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final CreateReviewController controller = Get.put(CreateReviewController());
  @override
  Widget build(BuildContext context) {
    final filteredFilesList = controller.uploadFilesList
        .where((file) => !(file.FileName?.endsWith('.m4a') ?? false))
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(3);
    });
    return WillPopScope(
      onWillPop: () async {
        controller.setStep(2); // Set to step 0 when navigating back
        return true; // Allow the navigation to happen
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
          padding: EdgeInsets.only(left: 25, top: 25, right: 25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: StepperIcons(),
                ),
                Text(
                  'Preview',
                  style: TextStyle(
                      color: AppUtil().textcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Case ID:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Obx(() => Flexible(
                          child: Text(' ${controller.userInfoList[0].id}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 17)),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Case Type: ',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Text('Pending',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.grey))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: AppUtil().containerColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46,
                          decoration: BoxDecoration(
                              color: AppUtil().customBlue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Personal Info',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => Row(
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => personalInfoTile(
                                  title: 'Last Name : ',
                                  responseValue:
                                      controller.userInfoList[0].LastName),
                            ),
                            personalInfoTile(
                                title: 'Country : ', responseValue: 'India'),
                          ],
                        ),
                        Obx(
                          () => personalInfoTile(
                              title: 'Gender : ',
                              responseValue:
                                  controller.userInfoList[0].Gender == 'M'
                                      ? 'Male'
                                      : 'Female'),
                        ),
                        Obx(
                          () => personalInfoTile(
                              title: 'Cell Phone : ',
                              responseValue:
                                  controller.userInfoList[0].CellPhone),
                        ),
                        Obx(
                          () => personalInfoTile(
                              title: 'Occupation : ',
                              responseValue:
                                  controller.userInfoList[0].Occupation),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: AppUtil().containerColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46,
                          decoration: BoxDecoration(
                              color: AppUtil().customBlue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Speciality',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                        : controller.specialtyList[index]
                                            .SpecialtyName!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: AppUtil().containerColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46,
                          decoration: BoxDecoration(
                              color: AppUtil().customBlue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Medical/Diagnosis Summary',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => Text(
                            controller.userInfoList[0].MedicalSummary!,
                            maxLines: controller.isExpanded.value
                                ? null
                                : controller.maxlines,
                            overflow: controller.isExpanded.value
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                        ),
                        Obx(() => controller
                                    .userInfoList[0].MedicalSummary!.length >
                                100
                            ? TextButton(
                                onPressed: () {
                                  controller.isExpanded.value =
                                      !controller.isExpanded.value;
                                },
                                child: Text(
                                  controller.isExpanded.value
                                      ? 'Show Less'
                                      : 'Read More',
                                  style: TextStyle(color: AppUtil().customBlue),
                                ),
                              )
                            : SizedBox()),
                        AppUtil().h10,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {},
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(
                                    () => Row(
                                      children: [
                                        Icon(
                                          controller.isPlaying.value
                                              ? Icons.stop
                                              : Icons.play_arrow_rounded,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        controller.uploadFilesList.isEmpty ||
                                                !controller.uploadFilesList[0]
                                                    .FileName!
                                                    .endsWith('.m4a')
                                            ? Text('No Recorded Summary')
                                            : Text(
                                                '${controller.uploadFilesList[0].FileName!.substring(0, 8)}...${controller.uploadFilesList[0].FileName!.split('_').last}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: AppUtil().containerColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46,
                          decoration: BoxDecoration(
                              color: AppUtil().customBlue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Medical Records',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        filteredFilesList.isEmpty
                            ? Text('No Medical Records')
                            : GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 5,
                                  crossAxisCount: 2,
                                ),
                                itemCount: filteredFilesList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {},

                                    child: Container(
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.36,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
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
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: AppUtil().containerColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46,
                          decoration: BoxDecoration(
                              color: AppUtil().customBlue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Current Medicatons',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: controller.medicationList.length,
                            itemBuilder: (context, index) {
                              return medicationInfoTile(
                                  title: 'Medication Name : ',
                                  responseValue:
                                      controller.medicationList.isEmpty
                                          ? "Citrizen"
                                          : controller.medicationList[index]
                                              .MedicationName,
                                  startyear: 'Start Date : ',
                                  startYearResponse: controller
                                          .medicationList.isEmpty
                                      ? "11/2023"
                                      : "${controller.medicationList[index].mn.toString()}/${controller.medicationList[index].yr}",
                                  index: index + 1);
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    var status = await controller.getPaymentDetail(
                        caseId: controller.userInfoList[0].id);

                    if (status) {
                      Get.toNamed(PageRouteName.payments, arguments: {
                        'caseSpeciality': controller.paymentspeciality,
                        'amount': controller.paymentAmount
                      });
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
                        child: Text(
                      'Proceed to Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 25,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
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
