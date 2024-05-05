import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blog.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'by ${blog.posterName!}',
              style: const TextStyle(color: AppPallete.gradient2, fontSize: 13),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: blog.topics.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppPallete.gradient1),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          blog.topics[index],
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(blog.imageUrl, fit: BoxFit.fitWidth)),
            const SizedBox(height: 5),
            Text(blog.content),
          ],
        ),
      ),
    );
  }
}
