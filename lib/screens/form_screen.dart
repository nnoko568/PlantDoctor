import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../helpers/app_color.dart';
import 'diagnose_screen.dart';
import '../widgets/user_image_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController symptomsEditingCOntroller = TextEditingController();
  String? _settingDropdownValue;
  String? _seasonDropdownValue;

  void settingDropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _settingDropdownValue = selectedValue;
      });
    }
  }

  void seasonDropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _seasonDropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingTextField = DropdownButtonFormField(
      items: const [
        DropdownMenuItem<String>(
          value: 'Out doors',
          child: Text('Out doors'),
        ),
        DropdownMenuItem<String>(
          value: 'In doors',
          child: Text('In doors'),
        ),
      ],
      value: _settingDropdownValue,
      onChanged: settingDropdownCallBack,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.formBorderColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.mainColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.grey.withOpacity(0.05),
        filled: true,
        labelText: 'Setting',
        labelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );

    final seasonTextField = DropdownButtonFormField(
      items: const [
        DropdownMenuItem<String>(
          value: 'Rain season',
          child: Text('Rain season'),
        ),
        DropdownMenuItem<String>(
          value: 'Dry season',
          child: Text('Dry season'),
        ),
      ],
      value: _seasonDropdownValue,
      onChanged: seasonDropdownCallBack,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.formBorderColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.mainColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.grey.withOpacity(0.05),
        filled: true,
        labelText: 'Season',
        labelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('assets/images/plant-doctor.png'),
        ),
        title: Text(
          'Plant Doctor',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomTextField(
                placeHolder: 'Name',
                editingController: nameEditingController,
                isObscure: false,
                textInputType: TextInputType.name,
              ),
              CustomTextField(
                placeHolder: 'Location',
                editingController: locationEditingController,
                isObscure: false,
                textInputType: TextInputType.streetAddress,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: settingTextField,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: seasonTextField,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                editingController: symptomsEditingCOntroller,
                placeHolder: 'Symptoms',
                isObscure: false,
                textInputType: TextInputType.multiline,
              ),
              const UserImagePicker(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DiagnoseScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Diagnose',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
