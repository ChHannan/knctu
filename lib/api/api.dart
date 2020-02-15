import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

var apiUrl = 'http://api.knctu.com/api/';
var wsURL = 'ws://api.knctu.com/ws/subscribe/';
var _rawToken = '01f1f32dab5766f5981ceb336ebfbe6efb826f9e';
var _token = 'Token $_rawToken';

const String _contentType = 'application/json';

void setToken(String token) => _rawToken = token;

IOWebSocketChannel subscribeChannel;

void openConnection() {
  subscribeChannel = IOWebSocketChannel.connect('$wsURL?authorization=$_rawToken');
}

Stream subscribe(data) {
  subscribeChannel.sink.add(jsonEncode(data));
  return subscribeChannel.stream;
}

Future<http.Response> getQuestions() {
  return http.get('${apiUrl}forum/question/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> login(email, pass) {
  return http.post('${apiUrl}token/',
      body: jsonEncode({'email': email, 'password': pass}),
      headers: {HttpHeaders.contentTypeHeader: _contentType});
}

Future<http.Response> getUser() {
  return http.get('${apiUrl}user/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> getChatRooms() {
  return http.get('${apiUrl}api/chat/room/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}