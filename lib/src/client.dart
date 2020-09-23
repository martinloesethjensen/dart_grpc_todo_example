import 'dart:io';

import 'package:grpc/grpc.dart';
import 'generated/todo.pbgrpc.dart';

class Client {
  ClientChannel _channel;
  TodoClient _stub;

  final todos = [
    TodoItem()
      ..text = 'random text'
      ..id = 1,
    TodoItem()
      ..id = 2
      ..text = 'todo 2',
    TodoItem()
      ..id = 3
      ..text = 'todo 3',
    TodoItem()
      ..id = 4
      ..text = 'todo 4',
  ];

  Future<void> main(List<String> args) async {
    connect();

    final num = args.length > 0 ? args[0] : '0';

    switch (num) {
      case '1':
        await runCreateTodo(TodoItem());
        break;
      case '2':
        await runReadTodos();
        break;
      case '3':
        await runGenerateTodosStream();
        break;
      case '4':
        await runCreateTodos();
        break;
      case '5':
        await runReadTodosStream();
        break;
      case '6':
        await runTodoChat();
        break;
      default:
    }

    await _channel.shutdown();
  }

  Future<void> runCreateTodo(TodoItem todoItem) async {
    await _stub.createTodo(todoItem);
  }

  Future<void> runCreateTodos() async {
    var todoItems = TodoItems();
    for (final todo in todos) {
      todoItems.items.add(todo);
    }
    await _stub.createTodoItems(todoItems);
  }

  Future<void> runReadTodos() async {
    final todos = await _stub.readTodos(voidNoParam());
    todos.items.forEach(print);
  }

  Future<void> runGenerateTodosStream() async {
    Stream<TodoItem> outgoingTodos() async* {
      for (final todo in todos) {
        await Future.delayed(Duration(milliseconds: 500));
        yield todo;
      }
    }

    await _stub.createTodosStream(outgoingTodos());
  }

  Future<void> runReadTodosStream() async {
    await for (final todo in _stub.readTodosStream(voidNoParam())) {
      print(todo);
    }
  }

  Future<void> runTodoChat() async {
    Stream<TodoItem> outgoingTodos() async* {
      final tempTodos = [
        TodoItem()
          ..id = 8888
          ..text = 'from client todo 8888',
        TodoItem()
          ..id = 7777
          ..text = 'from client todo 7777',
        TodoItem()
          ..id = 6666
          ..text = 'from client todo 6666',
      ];

      for (final todo in tempTodos) {
        await Future.delayed(Duration(milliseconds: 500));
        yield todo;
      }
    }

    final call = _stub.todoChat(outgoingTodos());
    await for (var todoBack in call) {
      print('Got Todo back from server: $todoBack');
    }
  }

  connect() {
    _channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _stub = TodoClient(_channel);
  }
}
