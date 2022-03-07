import 'package:angular/angular.dart';
import 'package:todo/src/components/todo_form/todo_form.dart';
import 'package:todo/src/services/todo_service.dart';
import '../../models/todo.dart';

@Component(
    selector: 'todo-list',
    styleUrls: ['todo_list.css'],
    templateUrl: 'todo_list.html',
    directives: [coreDirectives, TodoForm],
    providers: [ClassProvider(TodoService)])
class TodoList implements OnInit {
  TodoList(this._todoService);
  final TodoService _todoService;
  String editMode = '';
  List todos = [];
  bool isLoading = true;
  Todo editedTodo;

  String emptyImg = 'packages/todo/src/assets/svgs/empty.svg';

  @override
  Future<Null> ngOnInit() async {
    todos = await _todoService.getTodos();
    isLoading = false;
  }

  void addTodo() {
    editMode = 'add';
    todos.add(Todo());
  }

  void editTodo(int index) {
    editMode = 'edit';
    todos[index].edit = true;
  }

  void cancelTodo(index) {
    todos[index].edit = false;
    if (editMode == 'add') {
      todos.removeAt(index);
    }
    editMode = '';
  }

  void updateTodo(int index) async {
    var todo = todos[index];

    if (todo.id == null) {
      var resId = await _todoService.addTodo(todo);
      todo.id = resId;
    } else {
      await _todoService.updateTodo(todo);
    }
    editMode = '';
  }

  void removeTodo(int index) async {
    await _todoService.removeTodo(todos[index]);
    todos.removeAt(index);
    editMode = '';
  }
}
