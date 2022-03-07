class Todo {
  Todo({this.title = '', this.description = '', this.edit = true});

  Todo.fromMap(Map todo)
      : this(
          title: todo['title'],
          description: todo['description'],
          edit: todo['edit'],
        );

  void update(Todo todo) {
    title = todo.title;
    description = todo.description;
    edit = todo.edit;
  }

  String title;
  String description;
  bool edit;
}
