import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class OccupiedImageSelector extends StatelessWidget {
  final List<ImageProvider> images;
  final VoidCallback onAddImage;

  const OccupiedImageSelector({
    super.key,
    required this.images,
    required this.onAddImage,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (var image in images) buildImageCard(image),
        buildAddImageCard(),
      ],
    );
  }

  Widget buildImageCard(ImageProvider image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.edit,
              size: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddImageCard() {
    return GestureDetector(
      onTap: onAddImage,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            CustomTextWidget(
              text: 'Add Image',
              color: Colors.white, fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
