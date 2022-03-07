import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:todo/src/components/todo_form/todo_form.dart';

import '../../models/todo.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list.css'],
  templateUrl: 'todo_list.html',
  directives: [coreDirectives, formDirectives, TodoFormComponent],
)
class TodoListComponent {
  final List todos = [
    Todo(title: 'Creating', description: 'Description', edit: false)
  ];
  Todo editedTodo;

  void addTodo() {
    todos.add(Todo());
  }

  void editTodo(int index) {
    todos[index].edit = true;
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
