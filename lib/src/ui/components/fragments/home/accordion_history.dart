import 'package:flutter/material.dart';

class AccordionHistory extends StatefulWidget {
  final Widget tileHeader;
  final Widget items;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry bodyPadding;

  const AccordionHistory({
    super.key,
    required this.tileHeader,
    required this.items,
    this.initiallyExpanded = false,
    this.headerPadding = const EdgeInsets.all(16.0),
    this.bodyPadding = const EdgeInsets.all(16.0),
  });

  @override
  State<AccordionHistory> createState() => _AccordionHistoryState();
}

class _AccordionHistoryState extends State<AccordionHistory> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _isExpanded = PageStorage.of(context).readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: _handleTap,
          child: Padding(
            padding: widget.headerPadding,
            child: Row(
              children: <Widget>[
                Expanded(child: widget.tileHeader),
                RotationTransition(
                  turns: _controller.drive(Tween<double>(begin: 0.0, end: 0.5).chain(CurveTween(curve: Curves.easeIn))),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.topLeft,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.bodyPadding,
          child: widget.items,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }
}