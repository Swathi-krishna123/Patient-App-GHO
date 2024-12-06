import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AppUserController userController = Get.find<AppUserController>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController numcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController newpasswordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstnamecontroller.text = userController.userDetail.value?.FirstName;
    lastnamecontroller.text = userController.userDetail.value?.LastName;

    numcontroller.text = userController.userDetail.value?.Phone;

    emailcontroller.text = userController.userDetail.value?.eMail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonWidgets().appBarCommon(context, 'Personal Info'),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUtil().h15,
              personalInfoTile(
                  'First Name', controller: firstnamecontroller, context),
              AppUtil().h15,
              personalInfoTile(
                  'Last Name', controller: lastnamecontroller, context),
              AppUtil().h15,
              personalInfoTile('Email', controller: emailcontroller, context),
              AppUtil().h15,
              phonenumberinfotile(
                  'Phone Number',
                  controller: numcontroller,
                  context,
                  usercontroller: userController),
              AppUtil().h15,
              saveAndContinueButton(context),
              AppUtil().h15,
              GestureDetector(
                onTap: () async {
                  showChangePassdialogue(context, userController);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(231, 238, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.grey)]),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.password,
                          color: AppUtil().textcolor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Default color
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget saveAndContinueButton(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () async {
        if (_formkey.currentState!.validate()) {
          userController.isLoading.value = true;
          bool updateprofilestatus = await userController.updateUserDetails(
              email: emailcontroller.text,
              firstname: firstnamecontroller.text,
              lastname: lastnamecontroller.text,
              phonenum: numcontroller.text);
          updateprofilestatus ? Get.back() : Get.back();
          userController.isLoading.value = false;
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
          () => userController.isLoading.value == false
              ? Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 25,
                  ),
                )
              : LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width / 10,
                ),
        )),
      ),
    );
  }

  Future<void> showChangePassdialogue(
      BuildContext context, AppUserController controller) async {
    await Get.dialog(
      Dialog(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20), // Optional padding
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.password,
                  color: AppUtil().textcolor,
                ),
                Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                AppUtil().h10,
                personalInfoTile('Current Password', context,
                    controller: passwordcontroller,
                    hinttext: 'Enter Your Current Password'),
                AppUtil().h10,
                personalInfoTile('New Password', context,
                    controller: newpasswordcontroller,
                    hinttext: 'Enter New Password'),
                AppUtil().h10,
                personalInfoTile('Confirm Password', context,
                    controller: confirmpasswordcontroller,
                    hinttext: 'Confirm Password'),
                AppUtil().h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel",
                          style: TextStyle(color: AppUtil().textcolor)),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (passwordcontroller.text.isNotEmpty &&
                            newpasswordcontroller.text.isNotEmpty &&
                            confirmpasswordcontroller.text.isNotEmpty &&
                            newpasswordcontroller.text ==
                                confirmpasswordcontroller.text) {
                          var status = false;
                          status = await controller.changePassword(
                              currentPassword: passwordcontroller.text,
                              newPassword: newpasswordcontroller.text);
                          if (status) {
                            passwordcontroller.clear();
                            newpasswordcontroller.clear();
                            confirmpasswordcontroller.clear();
                            Get.back();
                            ScaffoldMessenger.of(context).showSnackBar(
                                CommonWidgets().snackBarinfo(controller.data));
                          }
                        } else if (newpasswordcontroller.text !=
                            confirmpasswordcontroller.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CommonWidgets().snackBarinfo(
                                  'Current Password and Confirm Password are not Matching'));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CommonWidgets().snackBarinfo(
                                  'Please fill the required fields'));
                        }
                      },
                      child: Text("Save",
                          style: TextStyle(color: AppUtil().textcolor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}

phonenumberinfotile(String? titletext, BuildContext context,
    {TextEditingController? controller,
    String? hinttext,
    AppUserController? usercontroller}) {
  print(usercontroller?.userDetail.value?.CountryID);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titletext!,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width / 30),
      ),
      AppUtil().h5,
      Row(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(231, 238, 255, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.grey)]),
            child: Center(
              child: CountryCodePicker(
                onChanged: (country) {
                  usercontroller?.countryId = country.dialCode;
                  print(usercontroller?.countryId.toString());
                },
                initialSelection:
                    usercontroller?.userDetail.value?.CountryID != null
                        ? "+${usercontroller?.userDetail.value?.CountryID}"
                        : '+91',
                favorite: ['+91', '+1', '+65'],
                countryFilter: AppUtil().countryfilter,
                showFlag: true,
                alignLeft: true,
                showCountryOnly: false,
                showOnlyCountryWhenClosed: true,
                showDropDownButton: false,
                showFlagDialog: true,
                hideMainText: true,
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(231, 238, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.grey)]),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is Required';
                  } else if (value.isNotEmpty) {
                    bool isValid = CountryUtils.validatePhoneNumber(
                        controller!.text, usercontroller!.countryId!);
                    if (isValid) {
                      print('Valid Number');
                    } else {
                      return 'Enter a valid Number';
                    }
                  }
                  return null;
                },
                cursorColor: AppUtil().textcolor,
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: TextStyle(color: Colors.grey),
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
            ),
          ),
        ],
      ),
    ],
  );
}

personalInfoTile(String? titletext, BuildContext context,
    {TextEditingController? controller, String? hinttext}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titletext!,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width / 30),
      ),
      AppUtil().h5,
      Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(231, 238, 255, 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey)]),
        child: TextFormField(
          readOnly: titletext == 'Email' ? true : false,
          controller: controller,
          cursorColor: AppUtil().textcolor,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey),
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
      ),
    ],
  );
}
