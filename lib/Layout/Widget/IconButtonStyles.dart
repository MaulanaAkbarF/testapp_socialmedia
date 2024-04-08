import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:like_button/like_button.dart';

class ButtonLike extends StatelessWidget {
  final bool isLiked;
  final Future<bool> Function(bool) onTap;
  final IconData icon;
  final Color likeColor;
  final Color unLikeColor;
  final RxString textCounter = '0'.obs;
  final Icon Function(bool) likeBuilder;

  ButtonLike({
    super.key,
    this.isLiked = false,
    this.icon = Icons.favorite,
    required this.onTap,
    this.likeColor = Colors.red,
    this.unLikeColor = Colors.grey,
    this.likeBuilder = _defaultLikeBuilder,
  });

  static Icon _defaultLikeBuilder(bool isLiked) {
    return Icon(
      isLiked ? Icons.favorite : Icons.favorite_border,
      color: isLiked ? Colors.red : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          LikeButton(
            isLiked: isLiked,
            onTap: onTap,
            likeBuilder: likeBuilder,
          ),
          const SizedBox(width: 10,),
          Obx(() => Text(textCounter()))
        ],
      ),
    );
  }
}
