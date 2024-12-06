import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/models/caseFaqQuestion/casefaqquestion_model.dart';
import 'package:global_health_opinion_sample/models/caselistmodel/case_list_model.dart';
import 'package:global_health_opinion_sample/models/createreviewPatientmodel/create_review_patient_model.dart';
import 'package:global_health_opinion_sample/models/reviewcasedetail/review_case_detail_model.dart';
import 'package:global_health_opinion_sample/models/specialitymodel/speciality_model.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/dio_handler.dart';
import 'package:global_health_opinion_sample/util/shared_prefences.dart';

class CreateReviewController extends GetxController {
  var currentStep = 0.obs; // Initial step
  var telemedicinestep = 0.obs;
  Rx<bool> isChecked = false.obs;
  var gender = false.obs;
  Rx<bool> isRecording = false.obs;
  Rx<String> recordingPath = ''.obs;
  Rx<bool> isPlaying = false.obs;
  Rx<bool> isExpanded = false.obs;
  int maxlines = 5;
  var medicalreports = <String>[].obs;
  var medicalreportspath = <String>[].obs;
  List imgInBytesList = [];
  var dicomreports = <String>[].obs;
  var dicomreportspath = <String>[].obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> downLoadingFile = false.obs;
  RxInt downloadingFileIndex = (-1).obs;
  Rx<bool> currentMedicationButtonClicked = false.obs;

  RxList<Map<String, dynamic>> selectedQuestions = <Map<String, dynamic>>[].obs;
  RxList<String> customQuestions = <String>[].obs;
  Rx<String?> selectedDoctorlocation = Rx<String?>(null);
  var doctorsLocation = ["USA", "India"];

  int checkBoxValue = 0;
  bool checkBox1 = false;
  bool checkBox2 = false;
  checkboxUpdate(int checkBoxNo, bool value) {
    if (value == true) {
      checkBoxValue++;
      if (checkBoxNo == 1) {
        checkBox1 = value;
      } else {
        checkBox2 = value;
      }
    } else {
      checkBoxValue--;
      if (checkBoxNo == 1) {
        checkBox1 = value;
      } else {
        checkBox2 = value;
      }
    }

    update();
  }

  void changeGender(bool value) {
    gender.value = value;
  }

  void setStep(int step) {
    currentStep.value = step;
  }

  String getGenderAsString() {
    return gender.value ? "F" : "M";
  }

  // List<Map<String, dynamic>> reviewlist = [
  //   {
  //     'Name': 'John Smith',
  //     'Expectedtime': '48 Hrs',
  //     'Recievedon': 'Aug 23, 2024',
  //     'Submittedon': 'Aug 24, 2024',
  //     'percentagelength': 0.2,
  //     'Completedpercentage': '20',
  //     'Status': 'Pending',
  //     'CircleImage': 'J',
  //     'Color': Colors.red
  //   },
  //   {
  //     'Name': 'Tom Smith',
  //     'Expectedtime': '48 Hrs',
  //     'Recievedon': 'Aug 23, 2024',
  //     'Submittedon': 'Aug 24, 2024',
  //     'percentagelength': 1.0,
  //     'Completedpercentage': '100',
  //     'Status': 'Completed',
  //     'CircleImage': 'T',
  //     'Color': Colors.purple
  //   },
  // ];
  List<Map<String, dynamic>> reviewlist = [];

  var reviewPatientModel = Rxn<CreateReviewPatientModel>();
  createReviewAddPatient({
    String? firstName,
    String? lastName,
    String? gender,
    String? cellPhone,
    String? DOB,
    String? occupation,
  }) async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var c1values = {
        "FirstName": firstName,
        "LastName": lastName,
        "Gender": gender,
        "CellPhone": cellPhone,
        "DOB": DOB,
        "Occupation": occupation
      };

      var requestBody = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASESAVE"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": "0"},
          {
            "T": "c1",
            "V": jsonEncode(c1values),
          },
          {"T": "c10", "V": "2"},
        ]
      };

      var jsonBody = jsonEncode(requestBody);
      print(jsonBody);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        reviewPatientModel.value = CreateReviewPatientModel.fromJson(response);

        return true;
      } else {
        print("Error in API call: ${response['Error']}");

        return false;
      }
    } catch (e) {
      print("Error: $e");

      return false;
    }
  }

  Rx<String?> selectedValue = Rx<String?>(null);
  var specialityListModel = Rxn<SpecialityModel>();
  getListSpeciality() async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "LISTSPECIALTY"},
          {"T": "src", "V": "MOBILE"},
        ]
      };
      String jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        specialityListModel.value = SpecialityModel.fromJson(response);
        updateDropdownItems();
      } else {
        debugPrint('Something went wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  var paymentspeciality = '';
  var paymentAmount = '';
  getPaymentDetail({String? caseId}) async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASERATES"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId},
        ]
      };
      String jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        print(response);

        // Accessing nested data
        var data = response['Data'];
        if (data != null && data.isNotEmpty) {
          var firstInnerList = data[0];
          if (firstInnerList.isNotEmpty) {
            var firstItem = firstInnerList[0];
            paymentspeciality = firstItem['SpecialtyName'];
            paymentAmount = firstItem['Amount'].toString();
            debugPrint(paymentspeciality + paymentAmount);
          } else {
            debugPrint('Inner list is empty');
          }
        } else {
          debugPrint('Data is empty or null');
        }

        return true;
      } else {
        debugPrint('Something went wrong');
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  var specialityDropdownItems =
      <Map<String, dynamic>>[].obs; // Store both ID and Name

  void updateDropdownItems() {
    if (specialityListModel.value != null) {
      specialityDropdownItems.value = specialityListModel.value!.Data
          .expand((list) => list) // Flatten the nested list
          .map((speciality) => {
                'id': speciality.id, // Store the ID
                'nm': speciality.nm, // Store the name
              })
          .toList();
    }
  }

  var caseListModel = Rxn<CaseListModel>();
  getAllCasesList() async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASELIST"},
          {"T": "src", "V": "MOBILE"},
        ]
      };
      String jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        print(response);
        caseListModel.value = CaseListModel.fromJson(response);
        update();
      } else {
        debugPrint('Unable to access get all cases list');
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  addReviewSpeciality({dynamic caseId, dynamic specialityId}) async {
    try {
      var token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASESPL"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId},
          {"T": "dk2", "V": specialityId},
          {"T": "c10", "V": 1},
        ]
      };
      var jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        print(response);
        return true;
      } else {
        print(response);
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  addMedicalSummary({dynamic caseId, String? medicalSummary}) async {
    try {
      var token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASESAVE"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId},
          {"T": "dk2", "V": medicalSummary},
          {"T": "c10", "V": 3},
        ]
      };
      var jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        print(response);
        return true;
      } else {
        print(response);
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  addReviewMedication(
      {dynamic caseId,
      String? medicationName,
      String? medicationStartMonth,
      String? medicationStartYear}) async {
    try {
      var token = await SharedPrefs.getString(SharedPrefs.TOKEN);

      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASERXs"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId.toString()},
          {"T": "dk2", "V": medicationName},
          {"T": "c1", "V": medicationStartMonth},
          {"T": "c2", "V": medicationStartYear},
          {"T": "c10", "V": 1},
        ]
      };
      var jsonBody = jsonEncode(body);

      var response = await DioHandler.dioPOST(body: jsonBody);

      if (response is Map<String, dynamic>) {
        if (response['Status'] == 1) {
          debugPrint("this is the response ${response.toString()}");
          return true;
        } else {
          debugPrint("API responded with an error: ${response['Message']}");
          return false;
        }
      } else {
        debugPrint("Unexpected response format: $response");
        return false;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      return false;
    }
  }

  var userInfoList = RxList<UserInfo>([]);
  var specialtyList = RxList<Specialty>([]);
  var medicationList = RxList<Medication>([]);
  var uploadFilesList = RxList<UploadedFiles>([]);

  getReviewCaseDetail({
    dynamic caseId,
  }) async {
    try {
      var token = await SharedPrefs.getString(SharedPrefs.TOKEN);

      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASE"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId.toString()},
        ]
      };
      var jsonBody = jsonEncode(body);
      print(jsonBody);

      var response = await DioHandler.dioPOST(body: jsonBody);

      if (response['Status'] == 1) {
        if (response['Data'].isNotEmpty) {
          if ((response['Data'][0] as List).isNotEmpty) {
            userInfoList.value = (response['Data'][0] as List)
                .map((user) => UserInfo.fromJson(user))
                .toList();
          } else {
            userInfoList.value = [];
          }
          if ((response['Data'][1] as List).isNotEmpty) {
            specialtyList.value = (response['Data'][1] as List)
                .map((specialty) => Specialty.fromJson(specialty))
                .toList();
          } else {
            specialtyList.value = [];
          }
          if ((response['Data'][2] as List).isNotEmpty) {
            medicationList.value = (response['Data'][2] as List)
                .map((medication) => Medication.fromJson(medication))
                .toList();
          } else {
            medicationList.value = [];
          }
          if ((response['Data'][3] as List).isNotEmpty) {
            uploadFilesList.value = (response['Data'][3] as List)
                .map((uploadfiles) => UploadedFiles.fromJson(uploadfiles))
                .toList();
          } else {
            uploadFilesList.value = [];
          }
        } else {
          debugPrint("Data list is empty.");
          userInfoList.value = [];
          specialtyList.value = [];
          medicationList.value = [];
        }
        return true;
      } else {
        debugPrint("API responded with an error: ${response['Message']}");
        return false;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      return false;
    }
  }

  var questionData = RxList<QuestionData>([]);
  var caseQuestion = RxList<CaseQuestion>([]);
  caseQuestions() async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASEQUESTIONS"},
          {"T": "src", "V": "MOBILE"},
        ]
      };
      var jsonBody = jsonEncode(body);
      debugPrint(jsonBody);

      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        questionData.value = (response['Data'][0] as List)
            .map((question) => QuestionData.fromJson(question))
            .toList();

        caseQuestion.value = (response['Data'][1] as List)
            .map((casequestion) => CaseQuestion.fromJson(casequestion))
            .toList();

        debugPrint(questionData.toString());
        debugPrint(caseQuestion.toString());
        return true;
      } else {
        debugPrint(response);
        return false;
      }
    } catch (e) {
      debugPrint("the error ${e.toString()}");
      return false;
    }
  }

  addcaseQuestions({
    dynamic caseId,
    String? question,
  }) async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "CASEQUESTIONS"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId.toString()},
          {"T": "c1", "V": "0"},
          {"T": "c2", "V": question},
          {"T": "c10", "V": "1"},
        ]
      };
      var jsonBody = jsonEncode(body);
      debugPrint(jsonBody);

      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        questionData.value = (response['Data'][0] as List)
            .map((question) => QuestionData.fromJson(question))
            .toList();

        caseQuestion.value = (response['Data'][1] as List)
            .map((casequestion) => CaseQuestion.fromJson(casequestion))
            .toList();

        debugPrint(questionData.toString());
        debugPrint(caseQuestion.toString());
        return true;
      } else {
        debugPrint(response);
        return false;
      }
    } catch (e) {
      debugPrint("the error ${e.toString()}");
      return false;
    }
  }

  Future<bool> editcaseQuestions({
  dynamic caseId,
  String? question,
  dynamic caseQuestionId,
}) async {
  try {
    if (caseId == null || caseQuestionId == null || question == null || question.trim().isEmpty) {
      debugPrint("Invalid input data");
      return false;
    }

    String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);

    var body = {
      "Token": token,
      "Tags": [
        {"T": "Action", "V": "CASEQUESTIONS"},
        {"T": "src", "V": "MOBILE"},
        {"T": "lts", "V": DateTime.now().toIso8601String()},
        {"T": "dk1", "V": caseId.toString()},
        {"T": "dk2", "V": caseQuestionId.toString()},
        {"T": "c1", "V": "0"},
        {"T": "c2", "V": question},
        {"T": "c10", "V": "1"},
      ]
    };

    var jsonBody = jsonEncode(body);
    debugPrint("Payload: $jsonBody");

    var response = await DioHandler.dioPOST(body: jsonBody);

    if (response['Status'] == 1) {
      questionData.value = (response['Data'][0] as List)
          .map((question) => QuestionData.fromJson(question))
          .toList();

      caseQuestion.value = (response['Data'][1] as List)
          .map((casequestion) => CaseQuestion.fromJson(casequestion))
          .toList();

      debugPrint("Updated questionData: ${questionData.toString()}");
      debugPrint("Updated caseQuestion: ${caseQuestion.toString()}");

      questionData.refresh(); // Ensure UI updates
      return true;
    } else {
      debugPrint("Server response: $response");
      return false;
    }
  } catch (e) {
    debugPrint("Error in editcaseQuestions: ${e.toString()}");
    return false;
  }
}


  getfileUploadtokenBox() async {
    var response = await DioHandler.dioPOSTGetTOken(
        path:
            'https://rereadmedical.azurewebsites.net/api/box/get-file-upload-token');
    var token = response["AccessTokenField"];
    print(token);
    return token;
  }

  final dio.Dio dioInstance = dio.Dio();
  uploadFile(
      BuildContext context, String accessToken, String filePath, dynamic caseId,
      {String? filename}) async {
    var file = File(filePath);

    var formData = dio.FormData.fromMap({
      'file': await dio.MultipartFile.fromFile(file.path, filename: filename),
      'parent_id': '283344829854', // Root folder or specific ID
    });

    try {
      var response = await dioInstance.post(
        'https://upload.box.com/api/2.0/files/content',
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (response.statusCode == 201) {
        print('File uploaded successfully!');
        await postBoxResponseToBackend(
            responsefrombox: response.data, caseId: caseId);
        return true;
      } else if (response.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(
            CommonWidgets().snackBarinfo('The file name already exists'));
        return false;
      } else {
        print('Failed to upload file: ${response.statusCode}');
        print(response.data);
        return false;
      }
    } catch (e) {
      print('Error during file upload: $e');
      return false;
    }
  }

  postBoxResponseToBackend({dynamic caseId, dynamic responsefrombox}) async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "BOXUPLOADED"},
          {"T": "src", "V": "MOBILE"},
          {"T": "dk1", "V": caseId.toString()},
          {"T": "dk2", "V": "1"},
          {"T": "c1", "V": jsonEncode(responsefrombox)}
        ]
      };
      var jsonEncoded = jsonEncode(body);
      print("Json Body: $jsonEncoded");
      var response = await DioHandler.dioPOST(body: jsonEncoded);
      print("Response To backend : $response");
    } catch (e) {
      print(e);
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': ((int.parse(amount)) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      //Make post request to Stripe
      var response = await DioHandler.dioPOSTStripe(body: body);

      print(response);
      return response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      //STEP 1: Create Payment Intent
      // print(dotenv.env['STRIPE_SECRET']);
      paymentIntent = await createPaymentIntent('100', 'USD');
      print(paymentIntent);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], //Gotten from payment intent
              googlePay: const PaymentSheetGooglePay(
                  merchantCountryCode: "US",
                  testEnv: true,
                  currencyCode: "USD"),
              merchantDisplayName: 'GHO'));

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (e) {
      print("exception $e");

      if (e is StripeConfigException) {
        print("Stripe exception ${e.message}");
      } else {
        print("exception $e");
      }
    }
  }

  Map<String, dynamic>? paymentIntent;
  displayPaymentSheet(BuildContext context) async {
    try {
      // "Display payment sheet";
      await Stripe.instance.presentPaymentSheet();
      // Show when payment is done
      // Displaying snackbar for it
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
      paymentIntent = null;
    } on StripeException catch (e) {
      // If any error comes during payment
      // so payment will be cancelled
      print('Error: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Payment Cancelled")),
      );
    } catch (e) {
      print("Error in displaying");
      print('$e');
    }
  }

  boxFilePreviewtoken() async {
    var response = await DioHandler.dioPOSTGetTOken(
        path:
            'https://rereadmedical.azurewebsites.net/api/box/get-file-preview-token');
    var token = response["AccessTokenField"];
    print(token);
    return token;
  }

  getboxFilePreviewDownloadURl(String? fileID) async {
    var body = {"ReviewFileId": fileID};
    String url =
        'https://rereadmedical.azurewebsites.net/api/box/get-shared-url';
    var response = await DioHandler.dioPOSTGetTOken(body: body, path: url);
    var downloadUrl = response['SharedLink']['DownloadUrl'];
    print(downloadUrl);
    return downloadUrl;
  }
}
