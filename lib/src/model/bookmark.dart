class Bookmark {
  String id;
  String title;
  String description;
  String url;
  bool edit;

  Bookmark({
    this.id,
    this.title = '',
    this.description = '',
    this.url = '',
    this.edit = true,
  });

  Bookmark.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            url: json['url'],
            edit: json['edit'] ?? false);

  Map<String, dynamic> asMap() => {
        'id': id,
        'title': title,
        'description': description,
        'url': url,
      };

  void update(Bookmark bookmark) {
    id = bookmark.id;
    title = bookmark.title;
    description = bookmark.description;
    url = bookmark.url;
    edit = bookmark.edit;
  }
}
