// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    required this.isLiked,
    required this.onLikeChanged,
    required this.theme,
    this.likeCount,
    this.isRow = false,
    this.isShowCount = false,
    this.style,
    this.width,
    super.key,
  });
  final bool isLiked;
  final bool isShowCount;
  final bool isRow;
  final int? likeCount;
  final AppTheme theme;
  final TextStyle? style;
  final double? width;

  final void Function({required bool isLiked}) onLikeChanged;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !widget.isLiked) {
          // Animasyon tamamlandığında ve beğeni kaldırıldıysa, animasyonu başa sar
          _controller.reset();
        }
      });

    if (widget.isLiked) {
      // Eğer başlangıçta beğenilmişse animasyonun sonunu göster
      _controller.value = _controller.upperBound;
    }
  }

  void _handleOnTap() {
    setState(() {
      if (widget.isLiked) {
        _controller.forward();
      } else {
        _controller.reverse(from: 0);
      }
      widget.onLikeChanged(isLiked: widget.isLiked);
    });
  }

  @override
  void didUpdateWidget(covariant LikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Dışarıdan gelen yeni değer ile iç durumu güncelle
    try {
      if (widget.isLiked != oldWidget.isLiked) {
        if (widget.isLiked) {
          _controller.forward();
        } else {
          _controller.reverse(from: 0);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: widget.isRow
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                likeIcon(),
                if (widget.isShowCount) likeCount(),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                likeIcon(),
                if (widget.isShowCount)
                  Positioned(
                    bottom: 0,
                    child: likeCount(),
                  ),
                Container(
                  height: 72,
                ),
              ],
            ),
    );
  }

  PrimaryText likeCount() {
    return PrimaryText(
      '${widget.likeCount}',
      style: widget.style ??
          widget.theme.textTheme.bodyLarge.copyWith(
            color: MainColors.white,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  ColorFiltered likeIcon() {
    return ColorFiltered(
      colorFilter: widget.isLiked
          ? const ColorFilter.mode(
              Colors.transparent,
              BlendMode.multiply,
            )
          : ColorFilter.mode(
              widget.isRow ? MainColors.primary : MainColors.white,
              BlendMode.srcATop,
            ),
      child: Lottie.asset(
        Assets.lottie.like2, // Animasyon dosyanızın yolu
        width: widget.width,
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
        },
        frameRate: FrameRate.max,
      ),
    );
  }

/*   @override
  void didUpdateWidget(covariant LikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Dışarıdan gelen yeni değer ile iç durumu güncelle
    if (widget.isLiked != oldWidget.isLiked) {
      _isLikedInternal = widget.isLiked;
      if (_isLikedInternal) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  } */

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
