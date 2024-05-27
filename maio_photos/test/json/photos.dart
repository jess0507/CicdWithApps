import 'dart:convert';
import 'dart:io';

final photosString = File('test/json/photos.json').readAsStringSync();
final photosMap = jsonDecode(photosString);
