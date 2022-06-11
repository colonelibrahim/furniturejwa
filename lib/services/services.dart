import 'dart:convert';
//sudah di hilangkan import htmml nya kemungkinan tidak berjalan 
//nooted harus gunakan emulator android!!!
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'furniture_services.dart';
part 'transaksi_services.dart';

String baseURL = 'http://192.168.0.5/furniturbackend/public/api/';
