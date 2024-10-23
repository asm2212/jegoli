import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jegoli/co_widget/round_icon_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';

class AddCartScreen extends StatefulWidget {
  const AddCartScreen({super.key});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  TextEditingController textCardNumber = TextEditingController();
  TextEditingController textCardMonth = TextEditingController();
  TextEditingController textCardYear = TextEditingController();
  TextEditingController textCardCode = TextEditingController();
  TextEditingController textFirstName = TextEditingController();
  TextEditingController textLastName = TextEditingController();
  bool isAnyTime = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      width: media.width,
      decoration: BoxDecoration(
          color: ColorExtension.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView( // Added SingleChildScrollView here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Credit/Debit Card",
                  style: TextStyle(
                    color: ColorExtension.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: ColorExtension.primaryText,
                    size: 25,
                  ),
                ),
              ],
            ),
            Divider(
              color: ColorExtension.secondaryText.withOpacity(0.1),
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextfield(
              hintText: "Card Number",
              controller: textCardNumber,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Expiry",
                  style: TextStyle(
                      color: ColorExtension.primaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                SizedBox(
                  width: 80,
                  child: RoundTextfield(
                    hintText: "MM",
                    controller: textCardMonth,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 80,
                  child: RoundTextfield(
                    hintText: "YYYY",
                    controller: textCardYear,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextfield(
              hintText: "Security Code",
              controller: textCardCode,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextfield(
              hintText: "First Name",
              controller: textFirstName,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextfield(
              hintText: "Last Name",
              controller: textLastName,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "you can remove this card at anytime",
                    style: TextStyle(
                      color: ColorExtension.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Spacer(),
                Switch(
                  value: isAnyTime,
                  activeColor: ColorExtension.primary,
                  onChanged: (value) {
                    setState(() {
                      isAnyTime = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RoundIconButton(
              onPressed: () {},
              title: "Add Card",
              icon: "assets/images/add.png",
              color: ColorExtension.primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
