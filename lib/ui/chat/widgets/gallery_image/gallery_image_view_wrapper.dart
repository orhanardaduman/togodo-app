// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:togodo/core/component/image/custom_image_slideshow.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/index.dart';

// to view image in full screen
class GalleryImageViewWrapper extends StatefulWidget {
  GalleryImageViewWrapper({
    required this.galleryItems,
    super.key,
    this.loadingBuilder,
    this.titleGallery,
    this.backgroundDecoration,
    this.initialIndex,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex ?? 0);
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final int? initialIndex;
  final PageController pageController;
  final List<GalleryItemModel> galleryItems;
  final Axis scrollDirection;
  final String? titleGallery;

  @override
  State<StatefulWidget> createState() {
    return _GalleryImageViewWrapperState();
  }
}

class _GalleryImageViewWrapperState extends State<GalleryImageViewWrapper> {
  final minScale = PhotoViewComputedScale.contained * 0.8;
  late final ValueNotifier<int> _currentPageNotifier;
  late final PageController _pageController;
  final maxScale = PhotoViewComputedScale.covered * 8;
  // ignore: use_setters_to_change_properties
  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPageNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildImage,
                itemCount: widget.galleryItems.length,
                loadingBuilder: widget.loadingBuilder,
                backgroundDecoration: widget.backgroundDecoration,
                pageController: widget.pageController,
                scrollDirection: widget.scrollDirection,
                onPageChanged: _onPageChanged,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.router.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20), // Sol boşluk
                  child: Assets.icons.lightOutline.arrowLeft.svg(
                    width: 28,
                    height: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              if (widget.galleryItems.length > 1)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 100,
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentPageNotifier,
                    builder: (context, value, child) {
                      return CustomIndicator(
                        count: widget.galleryItems.length,
                        currentIndex: value % widget.galleryItems.length,
                        activeColor: MainColors.primary,
                        radius: 4,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

// build image with zooming
  PhotoViewGalleryPageOptions _buildImage(BuildContext context, int index) {
    final item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions.customChild(
      child: CachedNetworkImage(
        imageUrl: item.imageUrl,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: minScale,
      maxScale: maxScale,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
