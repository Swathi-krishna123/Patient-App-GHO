import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/patientinfo.dart';

import '../../../util/routes.dart';

class Payments extends StatelessWidget {
  final String caseSpeciality;
  final String amount;
  Payments({super.key})
      : caseSpeciality = Get.arguments['caseSpeciality'],
        amount = Get.arguments['amount'];
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final CreateReviewController controller = Get.put(CreateReviewController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(4);
    });
    return WillPopScope(
      onWillPop: () async {
        controller.setStep(3); // Set to step 0 when navigating back
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: StepperIcons(),
              ),
              Text(
                'Payments',
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
                    'Case ID: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    'xxxx',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              AppUtil().h10,
              Divider(
                color: AppUtil().containerColor,
              ),
              AppUtil().h10,
              Row(
                children: [
                  Text(
                    "Select the Doctor's location to view payment",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              AppUtil().h10,
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
                        'Select Location',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: controller.doctorsLocation
                          .map((item) => DropdownMenuItem<String>(
                                value: item, // Add value here
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: controller.selectedDoctorlocation
                          .value, // Nullable selected value
                      onChanged: (value) {
                        controller.selectedDoctorlocation.value =
                            value; // Update the selected location
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
                    ),
                  ),
                ),
              ),
              AppUtil().h10,
              Divider(color: AppUtil().containerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Specialities Selected',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              AppUtil().h10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    caseSpeciality,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Obx(() => Text(
                      controller.selectedDoctorlocation.value == null
                          ? '\$000.00/Hr'
                          : "\$$amount/Hr",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: controller.selectedDoctorlocation.value == null
                              ? Colors.grey
                              : Colors.black)))
                ],
              ),
              AppUtil().h10,
              Divider(color: AppUtil().containerColor),
              AppUtil().h10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Obx(() => Text(
                      controller.selectedDoctorlocation.value == null
                          ? '\$000.00/Hr'
                          : "\$$amount/Hr",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedDoctorlocation.value == null
                              ? Colors.grey
                              : Colors.black))),
                ],
              ),
              Spacer(),
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    if (controller.selectedDoctorlocation.value == null) {
                    } else {
// controller.makePayment(context);
                      Get.offAllNamed(PageRouteName.caseSuccess);
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
                        colors: controller.selectedDoctorlocation.value == null
                            ? [
                                Color(0xFF065FD5).withOpacity(0.5),
                                Color(0xFF064DAB).withOpacity(0.5),
                              ]
                            : const [
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
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
