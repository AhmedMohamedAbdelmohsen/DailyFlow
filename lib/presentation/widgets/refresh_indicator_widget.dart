import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';

class RefreshWidget extends StatefulWidget {
  final Widget widgetChild;
  final Future Function() onRefresh;

  const RefreshWidget(
      {Key? key, required this.widgetChild, required this.onRefresh})
      : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) => buildAndroidList();

  // Platform.isAndroid ? buildAndroidList() : buildIosList();

  Widget buildAndroidList() => RefreshIndicator(
        onRefresh: widget.onRefresh,
        color: ColorManager.darkGreyBlueLight,
        child: widget.widgetChild,
      );

  ///if error happen add wrap = true & primary = false to the list
  Widget buildIosList() => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
          SliverToBoxAdapter(child: widget.widgetChild)
        ],
      );
}
