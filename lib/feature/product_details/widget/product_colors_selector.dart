import 'package:flutter/material.dart';

import 'package:silver_market/core/model/models.dart';

class ProductColorSelector extends StatelessWidget {
  const ProductColorSelector({
    Key? key,
    required this.selectedColor,
    required this.productColors,
    this.onColorSelected,
  }) : super(key: key);

  final ProductColor selectedColor;
  final List<ProductColor> productColors;
  final Function(ProductColor)? onColorSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productColors.length,
      itemBuilder: (_, index) => _ProductColorItem(
        productColor: productColors[index],
        isSelected: selectedColor == productColors[index],
        onClick: () => onColorSelected?.call(productColors[index]),
      ),
    );
  }
}

class _ProductColorItem extends StatefulWidget {
  const _ProductColorItem({
    Key? key,
    required this.productColor,
    this.isSelected = false,
    this.onClick,
  }) : super(key: key);

  final ProductColor productColor;
  final bool isSelected;
  final VoidCallback? onClick;

  @override
  State<_ProductColorItem> createState() => _ProductColorItemState();
}

class _ProductColorItemState extends State<_ProductColorItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_animationController);
    if (widget.isSelected) {
      _animationController.value = 1.0;
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ProductColorItem oldWidget) {
    if (widget.isSelected) {
      _animationController.forward();
    }
    if (!widget.isSelected) {
      _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (_, __) {
        return InkWell(
          onTap: () => widget.onClick?.call(),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Color(widget.productColor.value),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  widget.productColor.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: widget.isSelected ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
