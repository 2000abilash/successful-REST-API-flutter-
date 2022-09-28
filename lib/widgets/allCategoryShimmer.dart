import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatefulWidget {
  const CategoryShimmerWidget({Key? key}) : super(key: key);

  @override
  State<CategoryShimmerWidget> createState() => _CategoryShimmerWidgetState();
}

class _CategoryShimmerWidgetState extends State<CategoryShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,

                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,

                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,

                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,

                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,

                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
