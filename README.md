# dart_grpc_todo_example

Have [dart installed](https://dart.dev/get-dart). 

Activate `protoc` to generate stub files.

```bash
pub global activate protoc_plugin
```

> To generate stubs with protoc: `protoc --dart_out=grpc:lib/src/generated -Iprotos protos/todo.proto`

[Follow the prerequisites for dart on grpc.io](https://grpc.io/docs/languages/dart/quickstart/#prerequisites)

First get the packages

```bash 
pub get
```

Start the server

```bash 
dart bin/server.dart
```

Run client with args 

```bash 
dart bin/client.dart {1|2|3|4|5|6}
```

> Scenarios can be found in the code [here](https://github.com/martinloesethjensen/dart_grpc_todo_example/blob/062aaa5edc5525d35dfdb49b099438c1cf348ba7/lib/src/client.dart#L35)
