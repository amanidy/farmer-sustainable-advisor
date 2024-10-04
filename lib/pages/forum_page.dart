import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/data/forum_data.dart';
import 'package:sustainable_farming_advisor/models/forum_post.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
      ),
      body: ListView.builder(
        itemCount: forumPosts.length,
        itemBuilder: (context, index) {
          final post = forumPosts[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(post.title),
              subtitle: Text('Posted by ${post.author}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForumPostDetailPage(post: post),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const AddPostPage(),
            ),
          );
        },
      ),
    );
  }
}

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add New Post'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration:const InputDecoration(labelText: 'Post Title'),
            ),
            TextField(
              controller: _contentController,
              decoration:const InputDecoration(labelText: 'Post Content'),
            ),
            TextField(
              controller: _authorController,
              decoration:const InputDecoration(labelText: 'Author Name'),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPost = ForumPost(
                  title: _titleController.text,
                  content: _contentController.text,
                  author: _authorController.text,
                );
                setState(() {
                  forumPosts.add(newPost);
                });
                Navigator.pop(context);
              },
              child:const Text('Add Post'),
            ),
          ],
        ),
      ),
    );
  }
}


class ForumPostDetailPage extends StatelessWidget {
  final ForumPost post;

 const ForumPostDetailPage({required this.post,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posted by ${post.author}',
              style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 10),
            Text(
              post.content,
              style:const TextStyle(fontSize: 16),
            ),
          const  SizedBox(height: 20),
          const  Text(
              'Comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: post.comments.length,
                itemBuilder: (context, index) {
                  final comment = post.comments[index];

                  return ListTile(
                    title: Text(comment.author),
                    subtitle: Text(comment.content),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
