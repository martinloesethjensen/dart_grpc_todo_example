import 'package:grpc/grpc.dart' as grpc;

import 'generated/todo.pbgrpc.dart';

class TodoService extends TodoServiceBase {
  var todoItems = TodoItems();

  @override
  Future<voidNoParam> createTodo(
      grpc.ServiceCall call, TodoItem request) async {
    print('Todo: $request');
    todoItems.items.add(request);
    return voidNoParam();
  }

  @override
  Future<TodoItems> readTodos(
      grpc.ServiceCall call, voidNoParam request) async {
    return todoItems;
  }

  @override
  Stream<TodoItem> readTodosStream(
      grpc.ServiceCall call, voidNoParam request) async* {
    for (final todo in todoItems.items) {
      await Future.delayed(Duration(milliseconds: 500));
      yield todo;
    }
  }

  @override
  Future<voidNoParam> createTodoItems(
      grpc.ServiceCall call, TodoItems request) async {
    todoItems = request;
    request.items.forEach(print);
    return voidNoParam();
  }

  @override
  Future<voidNoParam> createTodosStream(
      grpc.ServiceCall call, Stream<TodoItem> request) async {
    await for (final todo in request) {
      todoItems.items.add(todo);
      print(todo);
    }
    return voidNoParam();
  }

  @override
  Stream<TodoItem> todoChat(
      grpc.ServiceCall call, Stream<TodoItem> request) async* {
    await for (var todo in request) {
      yield TodoItem()
        ..id = -1
        ..text = 'Example going back to client';
      print('Got todo from client: $todo');
      todoItems.items.add(todo);
    }
  }
}

class Server {
  Future<void> main(List<String> args) async {
    await start([TodoService()]);
  }

  Future<void> start(List<grpc.Service> services, {port = 50051}) async {
    final server = grpc.Server(services);
    await server.serve(port: port);
    print('Server listening on port ${server.port}...');
  }
}
