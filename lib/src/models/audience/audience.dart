import '../user-story/user_story.dart';

enum MediaType { image, video }

class Audience {
  Audience(
      {required this.url,
      required this.media,
      required this.duration,
      required this.user,
      this.xCoords,
      this.yCoords,
      this.pollsType});
  String url;
  MediaType media;
  Duration duration;
  UserStory user;
  double? xCoords;
  double? yCoords;
  String? pollsType;
}
