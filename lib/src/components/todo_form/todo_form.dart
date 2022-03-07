import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:todo/src/models/todo.dart';

@Component(
  selector: 'todo-form',
  styleUrls: ['todo_form.css'],
  templateUrl: 'todo_form.html',
  directives: [coreDirectives, formDirectives],
)
class TodoFormComponent implements OnInit {
  @Input()
  Todo todo;
  Todo editedTodo;

  final _formDeleteController = StreamController();
  @Output('onDelete')
  Stream get formDelete => _formDeleteController.stream;

  @override
  Future<Null> ngOnInit() async {
    editedTodo = Todo()..update(todo);
  }

  void updateTodo() {
    todo
      ..update(editedTodo)
      ..edit = false;
  }

  void removeTodo() {
    _formDeleteController.add(null);
  }
}
