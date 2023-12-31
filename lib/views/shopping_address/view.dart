import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/views/adding_address/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_text.dart';

class ShoppingAddressView extends StatelessWidget {
  const ShoppingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Shipping Addresses',
          fontSize: 18.sp,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.navigateTo(const AddingAddressView());
        },
        backgroundColor: black,
        child: const Icon(
          Icons.add_rounded,
          color: white,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, state) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: ShoppingAddressItem(),
                  );
                },
                itemCount: 3,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class ShoppingAddressItem extends StatelessWidget {
  const ShoppingAddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    return Container(
      width: width,
      height: height * 0.172,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Jane Doe',
                  fontSize: 14,
                ),
                AppText(
                  text: 'Edit',
                  fontSize: 14,
                  color: primaryAppColor,
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 235.w,
              child: const AppText(
                text: '3 Newbridge Court Chino Hills, CA 91709, United States',
                fontSize: 14,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const CheckBoxTile(
              text: 'Use as the shipping address',
            )
          ],
        ),
      ),
    );
  }
}

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({super.key, required this.text});
  final String text;

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  _CheckBoxTileState();

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      child: CheckboxListTile(
        title: AppText(
          text: widget.text,
          fontSize: 14,
        ),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue!;
          });
        },

        controlAffinity: ListTileControlAffinity.leading,
        activeColor: black,
        side: const BorderSide(color: black),
        contentPadding: EdgeInsets.zero,
        //  <-- leading Checkbox
      ),
    );
  }
}
