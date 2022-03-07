import 'package:angular/angular.dart';
import 'package:todo/src/container/todo-list/todo_list.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent],
)
class AppComponent {}
