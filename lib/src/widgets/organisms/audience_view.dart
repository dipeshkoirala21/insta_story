import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/audience/audience.dart';
import '../atoms/animated_bar.dart';
import '../atoms/polls.dart';
import '../atoms/user_info.dart';

class AudienceView extends StatefulWidget {
  final List<Audience> stories;

  const AudienceView({Key? key, required this.stories}) : super(key: key);

  @override
  State<AudienceView> createState() => _AudienceViewState();
}

class _AudienceViewState extends State<AudienceView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final AnimationController _animController =
      AnimationController(vsync: this);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final Audience firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Audience story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        onLongPress: () => _animController.stop(),
        child: Stack(children: <Widget>[
          PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Audience story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                        imageUrl: story.url, fit: BoxFit.cover);
                  case MediaType.video:
                    // TODO: Handle this case.
                    break;
                  case MediaType.video:
                    // TODO: Handle this case.
                    break;
                }
                return const SizedBox.shrink();
              }),
          Positioned(
            top: 40.0,
            left: 10.0,
            right: 10.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: widget.stories
                      .asMap()
                      .map((i, e) {
                        return MapEntry(
                          i,
                          AnimatedBar(
                            animController: _animController,
                            position: i,
                            currentIndex: _currentIndex,
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1.5,
                    vertical: 10.0,
                  ),
                  child: UserInfo(
                    user: story.user,
                  ),
                ),
              ],
            ),
          ),
          if (story.xCoords != null)
            Transform.translate(
                offset: const Offset(10, 700),
                child: const Polls(
                  fullWidth: true,
                )),
        ]),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Audience story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      _animController.forward();
      //TODO: Handle story.media == MediaType.vide

    }
  }

  void _loadStory({required Audience story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        //TODO: Handle this case
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
