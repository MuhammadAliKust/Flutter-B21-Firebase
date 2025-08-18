import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class UploadFileServices {
  /// Uploads an image file to the Karyana API and returns the uploaded image URL
  ///
  /// [image] - The image file to upload
  /// Returns a Future<String> that resolves to the uploaded image URL
  /// Throws an Exception if upload fails or response is invalid
  Future<String> uploadImage(File? image) async {
    final supabase = Supabase.instance.client;
    if (image == null) {
      return '';
    } else {
      final file = File(image.path);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final fullPath = '${file.path}/$fileName';
      try {
        await supabase.storage
            .from('profiles')
            .upload(
              fullPath,
              image,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            ); // Get public URL
        final publicUrl = supabase.storage
            .from('profiles')
            .getPublicUrl(fullPath);
        return publicUrl;
      } catch (error) {
        print('Error uploading image: $error');
        rethrow;
      }
    }
  }
}
