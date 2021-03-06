import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

var apiUrl = 'http://api.knctu.com/api/';
var wsURL = 'ws://api.knctu.com/ws/subscribe/';
var _rawToken = '';
var _token = 'Token $_rawToken';

const String _contentType = 'application/json';

void setToken(String token) => _rawToken = token;

IOWebSocketChannel subscribeChannel;
StreamController _streamController;

Stream get socketStream => _streamController.stream;

void openConnection() {
  subscribeChannel =
      IOWebSocketChannel.connect('$wsURL?authorization=$_rawToken');
  _streamController = StreamController.broadcast();
  _streamController.addStream(subscribeChannel.stream);
}

Stream subscribe(data) {
  subscribeChannel.sink.add(jsonEncode(data));
  return _streamController.stream;
}

Future<http.Response> getQuestionFromId(String id) {
  return http.get('${apiUrl}forum/question/$id/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> getQuestions() {
  return http.get('${apiUrl}forum/question/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> getHomeQuestions() {
  return http.get('${apiUrl}forum/home/question/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> postQuestion(data) {
  return http.post('${apiUrl}forum/question/',
      headers: {
        HttpHeaders.authorizationHeader: _token,
        HttpHeaders.contentTypeHeader: _contentType
      },
      body: jsonEncode(data));
}

Future<http.Response> postAnswer(data) {
  return http.post('${apiUrl}forum/answer/',
      headers: {
        HttpHeaders.authorizationHeader: _token,
        HttpHeaders.contentTypeHeader: _contentType
      },
      body: jsonEncode(data));
}

Future<http.Response> postComment(data) {
  return http.post('${apiUrl}forum/comment/',
      headers: {
        HttpHeaders.authorizationHeader: _token,
        HttpHeaders.contentTypeHeader: _contentType
      },
      body: jsonEncode(data));
}

Future<http.Response> postReply(data) {
  return http.post('${apiUrl}forum/reply/',
      headers: {
        HttpHeaders.authorizationHeader: _token,
        HttpHeaders.contentTypeHeader: _contentType
      },
      body: jsonEncode(data));
}

Future<http.Response> patchInfoUser(String id, data) {
  return http.patch('${apiUrl}forum/info/user/$id/',
      headers: {
        HttpHeaders.authorizationHeader: _token,
        HttpHeaders.contentTypeHeader: _contentType
      },
      body: jsonEncode(data));
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

Future<http.Response> getUserFromId(String id) {
  return http.get('${apiUrl}user/$id/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}

Future<http.Response> getChatRooms() {
  return http.get('${apiUrl}chat/room/', headers: {
    HttpHeaders.authorizationHeader: _token,
    HttpHeaders.contentTypeHeader: _contentType
  });
}
