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
class TodoForm implements OnInit {
  @Input()
  Todo todo;
  @Input()
  String editMode;
  Todo editedTodo;
  bool submitted = false;

  final _formCancelController = StreamController();
  final _formUpdateController = StreamController();
  final _formDeleteController = StreamController();

  @Output('onCancel')
  Stream get formCancel => _formCancelController.stream;
  @Output('onUpdate')
  Stream get formUpdate => _formUpdateController.stream;
  @Output('onDelete')
  Stream get formDelete => _formDeleteController.stream;

  @override
  Future<Null> ngOnInit() async {
    editedTodo = Todo()..update(todo);
  }

  void cancelTodo() {
    _formCancelController.add(null);
  }

  void updateTodo(NgForm form) {
    submitted = true;
    if (form.valid) {
      todo
        ..update(editedTodo)
        ..edit = false;
      _formUpdateController.add(null);
    }
  }

  void removeTodo() {
    _formDeleteController.add(null);
  }
}
