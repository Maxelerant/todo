class Todo {
  Todo({this.id, this.title = '', this.description = '', this.edit = true});

  String id;
  String title;
  String description;
  bool edit;

  Todo.fromMap(Map todo)
      : this(
          id: todo['id'],
          title: todo['title'],
          description: todo['description'],
          edit: todo['edit'] ?? false,
        );

  asMap() => {'title': title, 'description': description};

  void update(Todo todo) {
    title = todo.title;
    description = todo.description;
    edit = todo.edit;
  }
}
