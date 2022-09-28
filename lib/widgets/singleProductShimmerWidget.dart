import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailShimmerWidget extends StatefulWidget {
  const ProductDetailShimmerWidget({Key? key}) : super(key: key);

  @override
  State<ProductDetailShimmerWidget> createState() => _ProductDetailShimmerWidgetState();
}

class _ProductDetailShimmerWidgetState extends State<ProductDetailShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 130,),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 260,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 28,),
                Container(
                  height: 40,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 28,),
                Container(
                  height: 36,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 130,
              width: 336,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
