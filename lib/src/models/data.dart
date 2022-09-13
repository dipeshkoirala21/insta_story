import 'audience/audience.dart';

import 'user-story/user_story.dart';

final UserStory user = UserStory(
  fullName: 'John Doe',
  profileUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);
final List<Audience> stories = [
  Audience(
      url:
          'https://images.unsplash.com/photo-1661796428181-ffc414240d58?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80',
      media: MediaType.image,
      duration: const Duration(seconds: 3),
      user: user,
      xCoords: 100.0,
      yCoords: 200.0),
  Audience(
    url:
        'https://images.unsplash.com/photo-1661831870991-570c7172edfb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
    media: MediaType.image,
    user: UserStory(
      fullName: 'John Doe',
      profileUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
    ),
    duration: const Duration(seconds: 4),
  ),
  Audience(
    url:
        'https://images.unsplash.com/photo-1661831870991-570c7172edfb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Audience(
    url:
        'https://images.unsplash.com/photo-1657299170950-87e5b0eaf77c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];
