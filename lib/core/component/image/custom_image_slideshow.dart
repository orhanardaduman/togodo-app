import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/gallery_image_view_wrapper.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/gallery_item_model.dart';

class CustomImageSlideshow extends StatefulWidget {
  const CustomImageSlideshow({
    required this.children,
    super.key,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.indicatorColor,
    this.indicatorBackgroundColor = Colors.grey,
    this.onPageChanged,
    this.autoPlayInterval,
    this.isLoop = false,
    this.indicatorRadius = 3,
    this.indicatorPadding = 4,
    this.indicatorBottomPadding = 10,
    this.disableUserScrolling = false,
    this.items = const [],
  });

  /// The widgets to display in the [CustomImageSlideshow].
  ///
  /// Mainly intended for image widget, but other widgets can also be used.
  final List<Widget> children;

  /// Width of the [CustomImageSlideshow].
  final double width;

  /// Height of the [CustomImageSlideshow].
  final double height;

  /// The page to show when first creating the [CustomImageSlideshow].
  final int initialPage;

  /// The color to paint the indicator.
  final Color? indicatorColor;

  /// The color to paint behind th indicator.
  final Color? indicatorBackgroundColor;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// Auto scroll interval.
  ///
  /// Do not auto scroll when you enter null or 0.
  final int? autoPlayInterval;

  /// Loops back to first slide.
  final bool isLoop;

  /// Radius of CircleIndicator.
  final double indicatorRadius;

  /// Padding of CircleIndicator.
  final double indicatorPadding;

  /// BottomPadding to Indicator.
  final double indicatorBottomPadding;

  /// Disable page changes by the user.
  final bool disableUserScrolling;
  final List<String> items;

  @override
  CustomImageSlideshowState createState() => CustomImageSlideshowState();
}

class CustomImageSlideshowState extends State<CustomImageSlideshow> {
  late final ValueNotifier<int> _currentPageNotifier;
  late final PageController _pageController;
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  late final ScrollBehavior _scrollBehavior;
  Timer? _timer;

  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
    if (widget.onPageChanged != null) {
      final correctIndex = index % widget.children.length;
      widget.onPageChanged!(correctIndex);
    }
  }

  void _autoPlayTimerStart() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        int nextPage;
        if (widget.isLoop) {
          nextPage = _currentPageNotifier.value + 1;
        } else {
          if (_currentPageNotifier.value < widget.children.length - 1) {
            nextPage = _currentPageNotifier.value + 1;
          } else {
            return;
          }
        }

        goToPage(nextPage);
      },
    );
  }

  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  void buildItemsList(List<String> items) {
    galleryItems.clear();
    for (final item in items) {
      galleryItems.add(
        GalleryItemModel(id: item, imageUrl: item),
      );
    }
  }

// to open gallery image in full screen
  void openImageFullScreen(int indexOfImage) {
    Navigator.push(
      context,
      MaterialPageRoute<GalleryImageViewWrapper>(
        builder: (context) => GalleryImageViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: indexOfImage,
        ),
      ),
    );
  }

  @override
  void initState() {
    _scrollBehavior = widget.disableUserScrolling
        ? const ScrollBehavior().copyWith(
            scrollbars: false,
            dragDevices: {},
          )
        : const ScrollBehavior().copyWith(
            scrollbars: false,
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          );

    _pageController = PageController(
      initialPage: widget.initialPage,
    );

    _currentPageNotifier = ValueNotifier(widget.initialPage);

    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlayTimerStart();
    }
    buildItemsList(widget.items);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            scrollBehavior: _scrollBehavior,
            onPageChanged: _onPageChanged,
            itemCount: widget.isLoop ? null : widget.children.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              final correctIndex = index % widget.children.length;
              return GestureDetector(
                onTap: widget.items.isNotEmpty
                    ? () {
                        openImageFullScreen(index);
                      }
                    : () {},
                child: widget.children[correctIndex],
              );
            },
          ),
          if (widget.children.length > 1)
            Positioned(
              left: 0,
              right: 0,
              bottom: widget.indicatorBottomPadding,
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, value, child) {
                  return CustomIndicator(
                    count: widget.children.length,
                    currentIndex: value % widget.children.length,
                    activeColor: widget.indicatorColor,
                    radius: widget.indicatorRadius,
                    padding: widget.indicatorPadding,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  // Seçili indikatörün genişliği için bir parametre

  const CustomIndicator({
    required this.count,
    required this.currentIndex,
    super.key,
    this.activeColor = Colors.blue,
    this.inactiveColor = MainColors.grey200,
    this.radius = 8.0,
    this.padding = 8,
    this.activeWidth = 32.0, // Seçili indikatörün varsayılan genişliği
  });
  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color inactiveColor;
  final double radius;
  final double padding;
  final double activeWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          width: currentIndex == index ? activeWidth : radius * 2,
          height: radius * 2,
          margin: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: currentIndex == index ? null : inactiveColor,
            borderRadius: BorderRadius.circular(radius),
            gradient: currentIndex == index ? MainColors.gradientBlue : null,
          ),
        );
      }),
    );
  }
}
