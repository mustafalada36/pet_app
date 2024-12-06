import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/constants.dart';
import 'package:http/http.dart' as http;

class blogs extends StatefulWidget {
  const blogs({super.key});

  @override
  State<blogs> createState() => _blogsState();
}

class _blogsState extends State<blogs> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages = [];
  List<String> _uploadedImageUrls = [];
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> _uploadToCloudinary(XFile imageFile) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/dr5nxrgfx/image/upload';
    const uploadPreset = 'abcdefght';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl));
      request.fields['upload_preset'] = uploadPreset;
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final responseJson = json.decode(responseData.body);
        setState(() {
          _uploadedImageUrls.add(responseJson['secure_url']);
        });
        print('Image uploaded successfully: ${responseJson['secure_url']}');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile>? pickedImages = await _picker.pickMultiImage();
      if (pickedImages != null) {
        setState(() {
          _selectedImages = pickedImages;
        });
        // Upload all selected images
        for (var image in _selectedImages!) {
          await _uploadToCloudinary(image);
        }
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> _addBlog() async {
    if (titleController.text.isEmpty ||
        descController.text.isEmpty ||
        _uploadedImageUrls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please fill all fields and add an image.")),
      );
      return;
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('Blog').add({
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
      'title': titleController.text,
      'desc': descController.text,
      'images': _uploadedImageUrls,
    }).then((value) {
      print('Blog Added: ${value.id}');
      titleController.clear();
      descController.clear();
      _selectedImages = [];
      _uploadedImageUrls = [];
      Navigator.pop(context);
    }).catchError((error) {
      print('Failed to add Blog: $error');
    });
  }

  Future<void> deleteAd(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Blog')
          .doc(documentId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad deleted successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete ad: $e")),
      );
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Blog",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: _pickImages,
                icon: const Icon(Icons.image),
                label: const Text("Add Images"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addBlog,
                child: const Text("Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Community",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Blog')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No blogs found"));
          }

          final blogList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: blogList.length,
            itemBuilder: (context, index) {
              final blog = blogList[index].data() as Map<String, dynamic>;
              final images = blog['images'] as List<dynamic>?;
              final imageUrl = images != null && images.isNotEmpty
                  ? images[0]
                  : null; // Use first image

              return Card(
                elevation: 0,
                color: secondaryColor,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imageUrl != null)
                      Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blog['title'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  blog['desc'] ?? 'No Description',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              /*if (confirm ?? false) {
                await deleteAd(documentId);
              }*/
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}
