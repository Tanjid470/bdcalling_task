import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/modules/register_account/controller/register_account_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterAccountScreen extends StatefulWidget {
  const RegisterAccountScreen({super.key});

  @override
  State<RegisterAccountScreen> createState() => _RegisterAccountScreenState();
}

class _RegisterAccountScreenState extends State<RegisterAccountScreen> {
  RegisterAccountController registerAccountController =
      Get.put(RegisterAccountController());
  String? selectedFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ResponsiveScale.of(context).hp(5)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  }, child: const Icon(Icons.arrow_back_ios_new)),
                const Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'HindSiliguri',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' BdCalling IT',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueAccent,
                              fontFamily: 'HindSiliguri',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
           
            const SizedBox(
              height: 10.0,
            ),
            const Center(
              child: Text(
                'Explore your learning and skills',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'HindSiliguri',
                    color: Colors.black45),
              ),
            ),
            allDataInputField()
          ],
        ),
      ),
      floatingActionButton: actionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget allDataInputField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputHeader(context, 'First Name'),
            customTextField(registerAccountController.firstNameController,
                "Enter your first name", Icons.drive_file_rename_outline),
            Obx(
              () => registerAccountController
                      .firstNameErrorMassage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text(
                          registerAccountController.firstNameErrorMassage.value,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: TextSize.font14(context),
                              // fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                    )
                  : const SizedBox.shrink(),
            ),

            inputHeader(context, 'Last Name'),
            customTextField(registerAccountController.lastNameController,
                "Enter your last name", Icons.drive_file_rename_outline),
            Obx(
              () => registerAccountController
                      .firstNameErrorMassage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text(
                          registerAccountController.firstNameErrorMassage.value,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: TextSize.font14(context),
                              // fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                    )
                  : const SizedBox.shrink(),
            ),

            // verticalGap(context,1.5),
            inputHeader(context, 'Email'),
            customTextField(registerAccountController.emailController,
                "example123@gmail.com", Icons.email_outlined),
            Obx(
              () => registerAccountController
                      .userEmailErrorMassage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text(
                          registerAccountController.userEmailErrorMassage.value,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: TextSize.font14(context),
                              fontWeight: FontWeight.w400)),
                    )
                  : const SizedBox.shrink(),
            ),

            inputHeader(context, 'Password'),
            customTextField(registerAccountController.passwordController,
                "Enter your password", Icons.password),
            Obx(
              () => registerAccountController
                      .firstNameErrorMassage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text(
                          registerAccountController.firstNameErrorMassage.value,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: TextSize.font14(context),
                              // fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                    )
                  : const SizedBox.shrink(),
            ),

            inputHeader(context, 'Upload File'),
            uploadFileField(),

          ],
        ),
      ),
    );
  }

  Widget uploadFileField() {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              setState(() {
                selectedFilePath = result.files.single.path;
              });
              registerAccountController.filePath.value = selectedFilePath ?? "";
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    selectedFilePath ?? "No file selected",
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
                const Icon(Icons.upload_file, color: Colors.blueAccent),
              ],
            ),
          ),
        ),
        // Obx(
        //       () => registerAccountController.fileErrorMessage.value.isNotEmpty
        //       ? Padding(
        //     padding: const EdgeInsets.symmetric(
        //         horizontal: 5, vertical: 3),
        //     child: Text(
        //       registerAccountController.fileErrorMessage.value,
        //       style: const TextStyle(
        //           color: Colors.red, fontWeight: FontWeight.w400),
        //     ),
        //   )
        //       : const SizedBox.shrink(),
        // ),
      ],
    );
  }

  Container customTextField(TextEditingController controller, String hintText, IconData icon) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: controller.text.isEmpty
              ? Colors.grey.shade100
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: controller.text.isEmpty
                ? Colors.grey.shade400
                : Colors.blueAccent,
          )),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: 'HindSiliguri',
            // color: HexColor('#7A7A7A'),
            fontWeight: FontWeight.bold),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: controller.text.isEmpty
                ?Colors.grey.shade400
            : Colors.blueAccent,
          ),
          hintStyle: TextStyle(
              fontFamily: 'HindSiliguri',
              color: Colors.grey.shade400,
              fontSize: 16),
          //hintStyle: const TextStyle(color: Colors.orangeAccent),
        ),
        onChanged: (value) {
          registerAccountController.saveButtonEnable();
          setState(() {});
        },
      ),
    );
  }

  Widget actionButton() {
    return Obx(() {
      return registerAccountController.saveButtonEnableFlag.value
          ? InkWell(
          onTap: () {
            registerAccountController.registerAccount();
          },
          child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.blue]),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(1.5, 1.5))
                  ]),
              height: 50,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'HindSiliguri',
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: TextSize.font20(context)),
                  textAlign: TextAlign.center,
                ),
              )))
          : Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade500,
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(1.5, 1.5))
              ]),
          height: 50,
          width: double.maxFinite,
          child: Center(
            child: Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HindSiliguri',
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: TextSize.font20(context)),
              textAlign: TextAlign.center,
            ),
          ));
    },);
  }

  Padding inputHeader(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: TextSize.font15(context),
          fontWeight: FontWeight.w600,
          color: const Color(0xff5E6579),
        ),
      ),
    );
  }

  SizedBox verticalGap(BuildContext context, double ratio) => SizedBox(
        height: ResponsiveScale.of(context).hp(ratio),
      );
}
