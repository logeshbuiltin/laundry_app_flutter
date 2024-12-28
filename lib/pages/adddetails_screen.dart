import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:laundry_app_ui/utils/constants.dart';
import 'package:laundry_app_ui/utils/helper.dart';
import 'package:laundry_app_ui/widgets/app_button.dart';
import 'package:image_field/image_field.dart';

typedef Progress = Function(double percent);

// ignore: must_be_immutable
class AdddetailsScreen extends StatelessWidget{
  late bool isTextBoxVisible = false;
  String userSelection = "";

  dynamic remoteFiles;
 
  Future<dynamic> uploadToServer(XFile? file,
      {Progress? uploadProgress}) async {
    //implement your code using Rest API or other technology
  }

 @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FlutterIcons.keyboard_backspace_mdi,
                    color: Colors.white,
                  ),
                ),                
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 150.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Constants.scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField(
                        items: categoryType.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,),
                          );
                        }).toList(), 
                        onChanged: (String? value) { 
                          userSelection = value.toString();
                          if(value == "Image") {
                            isTextBoxVisible = !isTextBoxVisible;
                          }
                          else {
                            isTextBoxVisible = true;
                          }
                         },
                         decoration: InputDecoration(
                            hintText: "Select type",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Constants.primaryColor.withOpacity(0.1),
                            filled: true,
                            //prefixIcon: const Icon(Icons.email)
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        maintainAnimation: true,
                        maintainSize: true,
                        maintainState: true,
                        visible: isTextBoxVisible,
                        child: TextField(
                        decoration: InputDecoration(
                              hintText: userSelection,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none),
                              fillColor: Constants.primaryColor.withOpacity(0.1),
                              filled: true,
                              //prefixIcon: const Icon(Icons.email)
                          ),
                        ),
                      ),  

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                  
                      //     //Remote Image upload
                      //     ImageField(
                      //         texts: const {
                      //           'fieldFormText': 'Upload to server',
                      //           'titleText': 'Upload to server'
                      //         },
                      //         files: remoteFiles != null
                      //             ? remoteFiles!.map((image) {
                      //                 return ImageAndCaptionModel(
                      //                     file: image, caption: image.alt.toString());
                      //               }).toList()
                      //             : [],
                      //         remoteImage: true,
                      //         onUpload: (pickedFile,
                      //                     controllerLinearProgressIndicator) async {
                      //           dynamic fileUploaded = await uploadToServer(
                      //             pickedFile,
                      //             uploadProgress: (percent) {
                      //               var uploadProgressPercentage = percent / 100;
                      //               controllerLinearProgressIndicator!
                      //                   .updateProgress(uploadProgressPercentage);
                      //             },
                      //           );
                      //           return fileUploaded;
                      //         },
                      //         onSave: (List<ImageAndCaptionModel>? imageAndCaptionList) {
                      //           remoteFiles = imageAndCaptionList;
                      //         }),
                
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      AppButton(
                        type: ButtonType.PRIMARY,
                        text: "Add",
                        onPressed: () {
                          nextScreen(context, "/dashboard");
                        },
                      )
                    ]
                  ),
                ),              
              ],
            ),
          )
        ],
      ),  
    );
  }
}