int calculateReadingTime(String content) {
  const wordsPerMinute = 225;
  //final words = content.trim().split(' ').length;
  final wordCount = content.split(RegExp(r'\s+')).length;
  return (wordCount / wordsPerMinute).ceil();
}
