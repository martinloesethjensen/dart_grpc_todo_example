///
//  Generated code. Do not modify.
//  source: todo.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todo.pb.dart' as $0;
export 'todo.pb.dart';

class TodoClient extends $grpc.Client {
  static final _$createTodo = $grpc.ClientMethod<$0.TodoItem, $0.voidNoParam>(
      '/todoPackage.Todo/createTodo',
      ($0.TodoItem value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value));
  static final _$createTodoItems =
      $grpc.ClientMethod<$0.TodoItems, $0.voidNoParam>(
          '/todoPackage.Todo/createTodoItems',
          ($0.TodoItems value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value));
  static final _$createTodosStream =
      $grpc.ClientMethod<$0.TodoItem, $0.voidNoParam>(
          '/todoPackage.Todo/createTodosStream',
          ($0.TodoItem value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value));
  static final _$readTodos = $grpc.ClientMethod<$0.voidNoParam, $0.TodoItems>(
      '/todoPackage.Todo/readTodos',
      ($0.voidNoParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoItems.fromBuffer(value));
  static final _$readTodosStream =
      $grpc.ClientMethod<$0.voidNoParam, $0.TodoItem>(
          '/todoPackage.Todo/readTodosStream',
          ($0.voidNoParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value));
  static final _$todoChat = $grpc.ClientMethod<$0.TodoItem, $0.TodoItem>(
      '/todoPackage.Todo/todoChat',
      ($0.TodoItem value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value));

  TodoClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.voidNoParam> createTodo($0.TodoItem request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createTodo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.voidNoParam> createTodoItems($0.TodoItems request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createTodoItems, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.voidNoParam> createTodosStream(
      $async.Stream<$0.TodoItem> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$createTodosStream, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.TodoItems> readTodos($0.voidNoParam request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$readTodos, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.TodoItem> readTodosStream($0.voidNoParam request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$readTodosStream, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.TodoItem> todoChat($async.Stream<$0.TodoItem> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$todoChat, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class TodoServiceBase extends $grpc.Service {
  $core.String get $name => 'todoPackage.Todo';

  TodoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TodoItem, $0.voidNoParam>(
        'createTodo',
        createTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value),
        ($0.voidNoParam value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoItems, $0.voidNoParam>(
        'createTodoItems',
        createTodoItems_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoItems.fromBuffer(value),
        ($0.voidNoParam value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoItem, $0.voidNoParam>(
        'createTodosStream',
        createTodosStream,
        true,
        false,
        ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value),
        ($0.voidNoParam value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.voidNoParam, $0.TodoItems>(
        'readTodos',
        readTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value),
        ($0.TodoItems value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.voidNoParam, $0.TodoItem>(
        'readTodosStream',
        readTodosStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value),
        ($0.TodoItem value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoItem, $0.TodoItem>(
        'todoChat',
        todoChat,
        true,
        true,
        ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value),
        ($0.TodoItem value) => value.writeToBuffer()));
  }

  $async.Future<$0.voidNoParam> createTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TodoItem> request) async {
    return createTodo(call, await request);
  }

  $async.Future<$0.voidNoParam> createTodoItems_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TodoItems> request) async {
    return createTodoItems(call, await request);
  }

  $async.Future<$0.TodoItems> readTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$0.voidNoParam> request) async {
    return readTodos(call, await request);
  }

  $async.Stream<$0.TodoItem> readTodosStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.voidNoParam> request) async* {
    yield* readTodosStream(call, await request);
  }

  $async.Future<$0.voidNoParam> createTodo(
      $grpc.ServiceCall call, $0.TodoItem request);
  $async.Future<$0.voidNoParam> createTodoItems(
      $grpc.ServiceCall call, $0.TodoItems request);
  $async.Future<$0.voidNoParam> createTodosStream(
      $grpc.ServiceCall call, $async.Stream<$0.TodoItem> request);
  $async.Future<$0.TodoItems> readTodos(
      $grpc.ServiceCall call, $0.voidNoParam request);
  $async.Stream<$0.TodoItem> readTodosStream(
      $grpc.ServiceCall call, $0.voidNoParam request);
  $async.Stream<$0.TodoItem> todoChat(
      $grpc.ServiceCall call, $async.Stream<$0.TodoItem> request);
}
