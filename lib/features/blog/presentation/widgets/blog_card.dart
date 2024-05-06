import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, BlogViewerPage.route(blog));
      },
      child: Card(
        margin: const EdgeInsets.all(16).copyWith(bottom: 4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'by ${blog.posterName ?? ''}',
                              style: const TextStyle(
                                  color: AppPallete.gradient2, fontSize: 13)),
                          TextSpan(
                              text:
                                  '   ${calculateReadingTime(blog.content)} min read',
                              style: const TextStyle(
                                  color: AppPallete.whiteColor, fontSize: 13)),
                        ],
                      ),
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

                    // const SizedBox(height: 5),
                    // const Divider(),
                    // Text(
                    //   blog.content,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(blog.imageUrl, fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
