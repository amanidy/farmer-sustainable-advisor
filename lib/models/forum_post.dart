class Comment {
  final String author;
  final String content;

  Comment({
    required this.author,
    required this.content,
  });
}

class ForumPost {
  final String title;
  final String content;
  final String author;
  final List<Comment> comments;

  ForumPost({
    required this.title,
    required this.content,
    required this.author,
    this.comments = const [],
  });

  void addComment(Comment comment) {
    comments.add(comment);
  }
}
