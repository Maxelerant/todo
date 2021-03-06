import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import '../models/todo.dart';

@Injectable()
class TodoService {
  TodoService() {
    initializeApp(
        apiKey: 'AIzaSyBIrdyBDhpqa64TWfGCnaG6gqT-7QCJpls',
        authDomain: 'todo-ad-970dd.firebaseapp.com',
        projectId: 'todo-ad-970dd',
        databaseURL: 'https://todo-ad-970dd-default-rtdb.firebaseio.com',
        storageBucket: 'todo-ad-970dd.appspot.com',
        messagingSenderId: '707555520130',
        appId: '1:707555520130:web:f1f1ccfba5f731bc05ce9b');

    _db = database();
    _ref = _db.ref('todos').ref;
  }

  Database _db;
  DatabaseReference _ref;

  Future<List<Todo>> getTodos() async {
    final todos = <Todo>[];
    final queryEvent = await _ref.once('value');
    final snapshot = queryEvent.snapshot;
    final tdData = snapshot.val();
    if (tdData != null) {
      tdData.forEach((key, val) {
        var details = val as Map<String, dynamic>;
        details['id'] = key;
        todos.add(Todo.fromMap(details));
      });
    }

    return todos;
  }

  Future addTodo(Todo todo) async {
    var res = await _ref.push(todo.asMap());
    return res.key;
  }

  Future updateTodo(Todo todo) async {
    return await _ref.child(todo.id).set(todo.asMap());
  }

  Future removeTodo(Todo todo) async {
    return await _ref.child(todo.id).remove();
  }
}
