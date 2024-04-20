import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/ui/chat/functions/glow_remove_scroll_behaviour.dart';

enum ScrollType { fixedHeader, floatingHeader, chatPage }

class FlatPageWrapper extends StatelessWidget {
  const FlatPageWrapper({
    required this.onRefresh,
    super.key,
    this.children,
    this.backgroundColor,
    this.header,
    this.scrollType,
    this.footer,
    this.reverseBodyList,
    this.controller,
  });
  final List<Widget>? children;
  final Color? backgroundColor;
  final Widget? header;
  final ScrollType? scrollType;
  final Widget? footer;
  final bool? reverseBodyList;
  final void Function()? onRefresh;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Theme.of(context).primaryColorLight,
      child: _PageBodyWidget(
        scrollType: scrollType,
        header: header,
        footer: footer,
        reverseBodyList: reverseBodyList ?? false,
        onRefresh: onRefresh,
        controller: controller,
        children: children ?? [],
      ),
    );
  }
}

class _PageBodyWidget extends StatefulWidget {
  const _PageBodyWidget({
    required this.onRefresh,
    this.children,
    this.header,
    this.scrollType,
    this.footer,
    this.reverseBodyList,
    this.controller,
  });
  final List<Widget>? children;
  final Widget? header;
  final ScrollType? scrollType;
  final Widget? footer;
  final bool? reverseBodyList;
  final void Function()? onRefresh;
  final ScrollController? controller;
  @override
  State<_PageBodyWidget> createState() => _PageBodyWidgetState();
}

class _PageBodyWidgetState extends State<_PageBodyWidget> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double inputPadding() {
      if (widget.scrollType == ScrollType.floatingHeader) {
        return 24;
      } else {
        return 0;
      }
    }

    double bottomPadding() {
      if (widget.scrollType == ScrollType.floatingHeader) {
        return 0;
      } else {
        return 12;
      }
    }

    if (widget.scrollType == ScrollType.floatingHeader) {
      return Column(
        children: [
          // Header
          widget.header ?? Container(),

          // Body
          Expanded(
            child: ScrollConfiguration(
              behavior: GlowRemoveScrollBehaviour(),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: widget.children ?? [],
                ),
              ),
            ),
          ),

          // Footer
          Padding(
            padding: EdgeInsets.only(
              left: inputPadding(),
              right: inputPadding(),
              bottom: inputPadding(),
            ),
            child: widget.footer ?? Container(),
          ),
        ],
      );
    } else if (widget.scrollType == ScrollType.chatPage) {
      return Column(
        children: [
          // Header
          widget.header ?? Container(),

          // Body
          Expanded(
            child: ScrollConfiguration(
              behavior: GlowRemoveScrollBehaviour(),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                key: PageStorageKey(UniqueKey()),
                controller: widget.controller,
                reverse: widget.reverseBodyList ?? false,
                padding: EdgeInsets.only(
                  bottom: bottomPadding(),
                ),
                children: widget.children ?? [],
              ),
            ),
          ),

          // Footer
          Padding(
            padding: EdgeInsets.only(
              left: inputPadding(),
              right: inputPadding(),
              bottom: inputPadding(),
            ),
            child: widget.footer ?? Container(),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          widget.header ?? Container(),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              scrollController: _controller,
              header: const RefreshNullHeader(),
              onRefresh: () async {
                widget.onRefresh?.call();
                await Future<dynamic>.delayed(
                  const Duration(milliseconds: 1000),
                );
                // if failed,use refreshFailed()
                _refreshController.refreshCompleted();
              },
              child: ScrollConfiguration(
                behavior: GlowRemoveScrollBehaviour(),
                child: ListView(
                  reverse: widget.reverseBodyList ?? false,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.children ?? [],
                ),
              ),
            ),
          ),
          widget.footer ?? Container(),
        ],
      );
    }
  }
}
