import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet(
      {super.key, required this.buildcontext, required this.callback});
  final void Function(ImageSource) callback;
  final BuildContext buildcontext;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    //close bottomsheet
                    Navigator.pop(buildcontext);
                    //pickimage
                    callback(ImageSource.camera);
                    // above expression is equivalent to
                    //pickImage(ImageSource.camera);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.blue.shade900,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Open Camera",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    //close bottomsheet
                    Navigator.pop(buildcontext);
                    //custom method
                    callback(ImageSource.gallery);
                    // above expression is equivalent to
                    //pickImage(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_library,
                        color: Colors.blue.shade900,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Open Gallery",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom)
        ],
      ),
    );
  }
}
