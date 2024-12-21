import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }
  Future<void> _fetchImages() async {
    try {
      // Fetch list of files from the 'images' bucket
      final response = await supabase.storage.from('images').list();
     // final response = await supabase.storage.from('images').list(path: 'images/');

      print('Raw response: ${response.toString()}');

      if (response.isNotEmpty) {
        // Generate public URLs for each file
        List<String> urls = response.map((file) {
          print('File details: ${file.toString()}');
          return supabase.storage.from('images').getPublicUrl(file.name);
        }).toList();

        setState(() {
          imageUrls = urls;
        });

        print('Image URLs: $imageUrls');
      } else {
        print('No files found in the bucket.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch images: $e')),
      );
      print('Error fetching images: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Uploaded Images')),
      body: imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
