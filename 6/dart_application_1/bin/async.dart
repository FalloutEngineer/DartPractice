import 'dart:async';
import 'dart:math';
import 'dart:io' as io;

import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  startServer();
}

void fut() {
  print('before');
  fetchUser(3)
      .then((value) {
        value['login'] = 'gibon1337';
        return value;
      })
      .then((value) => print(value))
      .catchError((e) => print(e));
  print('after');
}

void fut2() async {
  print('before');
  try {
    var result = await fetchUser(3);
    print(result);
  } catch (e) {
    print(e);
  }
  print('after');
}

Future<Map<String, String>> fetchUser(int userId) async {
  // return Future.delayed(
  //     Duration(seconds: 2), () => {'id': userId.toString(), 'name': 'Vlad'});
  // return Future.delayed(
  //     Duration(seconds: 1), () => throw Exception('Some Exception'));
  var response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

  var map = json.decode(response.body) as Map;

  return {'id': map['id'].toString(), 'name': map['name']};
}

void str() async {
  var stream = streamOfInt().where((number) => number < 1000).take(2);
  await for (int number in stream) {
    print(number);
  }
}

void str2() {
  // streamOfInt().skip(2).listen((event) {
  //   print(event);
  // });

  streamControllerExample().skip(2).listen((number) {
    print(number);
  });
}

Stream<int> streamOfInt() async* {
  for (var i = 0; i < 5; i++) {
    var randomNum = Random().nextInt(3000);
    await Future.delayed(Duration(milliseconds: randomNum));
    yield randomNum;
  }
}

void readFile() async {
  var text = io.File('bin/some.txt').openRead();

  // var stream = text.transform(utf8.decoder).transform(LineSplitter());

  // await for (String line in stream) {
  //   print(line);
  // }

  // var lines =
  //     await text.transform(utf8.decoder).transform(LineSplitter()).toList();

  // lines.forEach((line) {
  //   print(line);
  // });

  var lines = await transformedFile(
          text.transform(utf8.decoder).transform(LineSplitter()))
      .toList();

  print(lines);
}

Stream<String> transformedFile(Stream<String> stream) async* {
  await for (var value in stream) {
    yield '> $value';
  }
}

Stream<int> streamControllerExample() {
  var controller = StreamController<int>();
  controller.sink.add(Random().nextInt(1000));
  controller.sink.add(Random().nextInt(1000));
  controller.sink.add(Random().nextInt(1000));

  // controller.onListen!();

  return controller.stream;
}

void startServer() async {
  var server = await io.HttpServer.bind('localhost', 8080);

  server.listen((io.HttpRequest request) {
    request.response.write('Server example');
    request.response.close();
  });
}
