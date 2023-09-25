import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .32,
            child: const ShimmerWidget(),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const SizedBox(
                width: 71,
                height: 20,
                child: ShimmerWidget(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 22),
            child: SizedBox(
              height: height * .3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: 150,
                        height: height * .3,
                        child: const ShimmerWidget(),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 3,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 71.w,
                height: 20.h,
                child: const ShimmerWidget(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 22),
            child: SizedBox(
              height: height * .3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: 150.w,
                        height: height * .3,
                        child: const ShimmerWidget(),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 3,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.white70,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
