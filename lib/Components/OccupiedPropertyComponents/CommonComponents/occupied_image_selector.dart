import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/image_box_controller.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class CustomImageSelector extends StatelessWidget {
  final int maxImages;
  const CustomImageSelector({super.key, this.maxImages = 4});

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Wrap(
              spacing: 25.0,
              runSpacing: 10.0,
              children: List.generate(
                maxImages,
                    (index) {
                  if (index < imageController.images.length) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: FileImage(imageController.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -5,
                          child: IconButton(
                            onPressed: () {
                              imageController.removeImage(index);
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        imageController.pickImage(index);
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 40),
                              SizedBox(height: 5),
                              CustomTextWidget(text: 'Add Image', textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
