import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_border.dart';

class BIASImageField extends StatefulWidget {
  final String labelText;
  String? image;
  final Function getImage;
  final Function deleteImage;

  BIASImageField(
      {super.key,
      required this.labelText,
      required this.image,
      required this.getImage,
      required this.deleteImage});

  @override
  State<BIASImageField> createState() => _BIASImageFieldState();
}

class _BIASImageFieldState extends State<BIASImageField> {
  bool colorVisibility = false;
  ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        prefixIconColor: kBIASRedColor,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: colorVisibility
              ? kBIASBlueColor
              : kBIASLightGrayColor.withOpacity(0.7),
          fontSize: colorVisibility ? 16 : 13,
          fontWeight: colorVisibility ? FontWeight.w500 : FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        border: inputBorder(), //normal border
        enabledBorder: inputBorder(), //enabled border
        focusedBorder: inputBorder(), //focused border
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.width - 50,
        decoration: widget.image == null || widget.image == ''
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white)
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.memory(base64Decode(widget.image!)).image,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
        child: Column(
          mainAxisAlignment: widget.image == null || widget.image == ''
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                pickedImage =
                    await picker.pickImage(source: ImageSource.camera);
                widget.getImage(pickedImage);
                setState(() {
                  colorVisibility = true;
                });
              },
              child: widget.image == null || widget.image == ''
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.width / 2 - 50,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.camera,
                          color: kBIASLightGrayColor.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          widget.deleteImage();
                          setState(() {
                            colorVisibility = false;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(CupertinoIcons.xmark,
                              color: kBIASDarkGrayColor),
                        ),
                      ),
                    ),
            ),
            Visibility(
              visible: widget.image == null || widget.image == '',
              child: Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: kBIASLightGrayColor.withOpacity(0.7),
              ),
            ),
            InkWell(
              onTap: () async {
                pickedImage =
                    await picker.pickImage(source: ImageSource.gallery);
                widget.getImage(pickedImage);
                setState(() {
                  colorVisibility = true;
                });
              },
              child: widget.image == null || widget.image == ''
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.width / 2 - 50,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.photo,
                          color: kBIASLightGrayColor.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
