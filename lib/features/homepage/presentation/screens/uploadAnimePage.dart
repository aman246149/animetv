import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentation/widgets/button_widget.dart';
import '../../../auth/presentation/widgets/textfield.dart';

class UploadAnimePageq extends StatefulWidget {
  const UploadAnimePageq({super.key});

  @override
  State<UploadAnimePageq> createState() => _UploadAnimePageqState();
}

class _UploadAnimePageqState extends State<UploadAnimePageq> {
  TextEditingController genere = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController season = TextEditingController();
  TextEditingController rating = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void validateData() {
    // Validate returns true if the form is valid, or false otherwise.
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPLOAD ANIME DATA"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextInputField(
                  controller: name,
                  text: "name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct name';
                    }
                    return null;
                  },
                ),
                Vspace(12),
                TextInputField(
                  controller: genere,
                  text: "genere",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct genere';
                    }
                    return null;
                  },
                ),
                Vspace(12),
                TextInputField(
                  controller: season,
                  text: "season",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct season';
                    }
                    return null;
                  },
                ),
                Vspace(12),
                TextInputField(
                  controller: rating,
                  text: "rating",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct rating';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CommonButtonWidget(
          ontap: validateData,
          text: "UPLOAD",
        ),
      ),
    );
  }
}
