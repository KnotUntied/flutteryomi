import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class WheelNumberPicker extends StatelessWidget {
  const WheelNumberPicker({
    super.key,
    required this.items,
    this.startIndex = 0,
    this.size = const Size(128.0, 128.0),
    this.onSelectionChanged = _defaultOnSelectionChanged,
    this.backgroundContent = _defaultBackgroundContent,
  });

  final List<num> items;
  final int startIndex;
  final Size size;
  final void Function(int index) onSelectionChanged;
  final Widget Function(Size size)? backgroundContent;

  static void _defaultOnSelectionChanged(int _) {}
  static Widget _defaultBackgroundContent(Size size) {
    return WheelPickerDefaultBackground(size: size);
  }

  @override
  Widget build(BuildContext context) {
    return _WheelPicker(
      startIndex: startIndex,
      items: items,
      size: size,
      onSelectionChanged: onSelectionChanged,
      manualInputType: TextInputType.number,
      backgroundContent: backgroundContent,
      itemContent: (text) => WheelPickerDefaultItem(text: text.toString()),
    );
  }
}

class WheelTextPicker extends StatelessWidget {
  const WheelTextPicker({
    super.key,
    required this.items,
    this.startIndex = 0,
    this.size = const Size(128.0, 128.0),
    this.onSelectionChanged = _defaultOnSelectionChanged,
    this.backgroundContent = _defaultBackgroundContent,
  });

  final List<String> items;
  final int startIndex;
  final Size size;
  final void Function(int index) onSelectionChanged;
  final Widget Function(Size size)? backgroundContent;

  static void _defaultOnSelectionChanged(int _) {}
  static Widget _defaultBackgroundContent(Size size) {
    return WheelPickerDefaultBackground(size: size);
  }

  @override
  Widget build(BuildContext context) {
    return _WheelPicker(
      startIndex: startIndex,
      items: items,
      size: size,
      onSelectionChanged: onSelectionChanged,
      backgroundContent: backgroundContent,
      itemContent: (text) => WheelPickerDefaultItem(text: text),
    );
  }
}

class _WheelPicker<T> extends StatefulWidget {
  const _WheelPicker({
    super.key,
    required this.items,
    this.startIndex = 0,
    this.size = const Size(128.0, 128.0),
    this.onSelectionChanged = _defaultOnSelectionChanged,
    this.manualInputType,
    this.backgroundContent = _defaultBackgroundContent,
    required this.itemContent,
  });

  final List<T> items;
  final int startIndex;
  final Size size;
  final void Function(int index) onSelectionChanged;
  final TextInputType? manualInputType;
  final Widget Function(Size size)? backgroundContent;
  final Widget Function(T item) itemContent;

  static void _defaultOnSelectionChanged(int _) {}
  static Widget _defaultBackgroundContent(Size size) {
    return WheelPickerDefaultBackground(size: size);
  }

  @override
  State<_WheelPicker> createState() => __WheelPickerState();
}

class __WheelPickerState<T> extends State<_WheelPicker<T>> {
  bool showManualInput = false;
  late FixedExtentScrollController scrollController;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    scrollController = FixedExtentScrollController(
      initialItem: widget.startIndex,
    );
  }

  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void onSelectionChanged(int newIndex) {
    scrollController.jumpToItem(newIndex);
    widget.onSelectionChanged(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: [
          if (widget.backgroundContent != null)
            widget.backgroundContent!(widget.size),
          showManualInput
              ? TextField(
                  controller: textController,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  decoration: const InputDecoration(border: InputBorder.none),
                  keyboardType: widget.manualInputType!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                  textAlign: TextAlign.center,
                  onSubmitted: (text) {
                    final newIndex = widget.items.indexWhere(
                      (it) => it.toString() == textController.text,
                    );
                    if (newIndex >= 0) onSelectionChanged(newIndex);
                    setState(() => showManualInput = false);
                  },
                )
              : GestureDetector(
                  onTap: widget.manualInputType != null
                      ? () => setState(() => showManualInput = true)
                      : null,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: widget.size.height /
                          _rowCount *
                          ((_rowCount - 1) / 2),
                    ),
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: widget.size.height / _rowCount,
                      controller: scrollController,
                      onSelectedItemChanged: (selectedItem) {
                        setState(() {});
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: widget.items.length,
                        builder: (context, index) {
                          final item = widget.items[index];
                          // TODO: Fade other items
                          return Container(
                            alignment: Alignment.center,
                            width: widget.size.width,
                            height: widget.size.height / _rowCount,
                            child: widget.itemContent(item),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class WheelPickerDefaultBackground extends StatelessWidget {
  const WheelPickerDefaultBackground({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(MaterialPadding.medium),
          ),
        ),
      ),
    );
  }
}

class WheelPickerDefaultItem extends StatelessWidget {
  const WheelPickerDefaultItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: 1,
    );
  }
}

const _rowCount = 3;
