import 'package:sustainable_farming_advisor/models/forum_post.dart';

List<ForumPost> forumPosts = [
  ForumPost(
    title: 'How to prevent soil erosion?',
    content:
        'What are some effective techniques to prevent soil erosion in hilly areas?',
    author: 'Farmer Joe',
    comments: [
      Comment(
          author: 'Farmer Jane',
          content: 'I use terracing and mulching to prevent erosion.'),
      Comment(
          author: 'Farmer Mike',
          content: 'Cover crops can also help in preventing erosion.'),
    ],
  ),
  ForumPost(
    title: 'Best practices for organic farming',
    content:
        'What are the best practices for transitioning to organic farming?',
    author: 'Organic Guru',
    comments: [
      Comment(
          author: 'Green Grower',
          content: 'Use compost and avoid synthetic fertilizers.'),
    ],
  ),
];
