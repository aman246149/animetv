import 'dart:io';

import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/features/adminpanel/domain/entity/anime_entity.dart';
import 'package:animetv/features/adminpanel/presentation/bloc/admin_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/common_methods.dart';
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
  TextEditingController imageController = TextEditingController();

  XFile? selectedImagePath = XFile("");
  String imageString = "";
  File pickedImage = File("");
  final ImagePicker pickedFile = ImagePicker();
  Uint8List? uint8list;

  final _formKey = GlobalKey<FormState>();

  void getImage(Function setstate) async {
    selectedImagePath = await pickedFile.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );

    if (selectedImagePath != null) {
      pickedImage = File(selectedImagePath!.path);
      uint8list = await pickedImage.readAsBytes();

      if (uint8list!.isNotEmpty) {
        setstate();
      }
    }
  }

  void validateData() {
    // Validate returns true if the form is valid, or false otherwise.
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<AdminBloc>().add(SetAnimeDataEvent(
        AnimeEntity(name.text, genere.text, rating.text, season.text,
            imageController.text,Timestamp.now().toString()),
        pickedImage));
  }

  void showBottomModel() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 400,
              color: Colors.black,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      uint8list == null
                          ? const SizedBox.shrink()
                          : SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.memory(uint8list!),
                            ),
                      Row(
                        children: [
                          Expanded(
                            child: TextInputField(
                              controller: imageController,
                              text: "ImageUrl",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Image Url';
                                }
                                return null;
                              },
                            ),
                          ),
                          CommonButtonWidget(
                              text: "Upload From Gallery",
                              ontap: () {
                                getImage(() {
                                  setState(() {});
                                });
                              })
                        ],
                      ),
                      const Vspace(12),
                      Row(
                        children: [
                          Expanded(
                              child: CommonButtonWidget(
                                  text: "Submit",
                                  ontap: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state is SetAnimeDataLoadingState) {
          setState(() {
            showOverlayLoader(context);
          });
        } else if (state is SetAnimeDataSuccessFullState) {
          setState(() {
            hideOverlayLoader(context);
          });
        } else if (state is SetAnimeDataFailureState) {
          setState(() {
            hideOverlayLoader(context);
            showErrorSnackbar(context, state.error);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UPLOAD ANIME DATA"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Vspace(12),
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
                  const Vspace(12),
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
                  const Vspace(12),
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
                  const Vspace(12),
                  uint8list == null
                      ? Row(
                          children: [
                            Expanded(
                                child: CommonButtonWidget(
                                    text: "Upload Image",
                                    ontap: showBottomModel)),
                          ],
                        )
                      : SizedBox(
                          height: 200,
                          width: 300,
                          child: Image.memory(uint8list!),
                        )
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
      ),
    );
  }
}
