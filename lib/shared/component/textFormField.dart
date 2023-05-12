import 'package:flutter/material.dart';

class defaultTextFormField extends StatelessWidget {
  Function(String)? oncange;
  Function(String)? onsubmited;
  Icon? sufixIcon;
  String hintText;
  String? Function(String?)? validator;
  TextInputType? textinputType = TextInputType.name;
  TextEditingController? textControler = TextEditingController();
  Function()? onTap;
  defaultTextFormField(
      {required this.hintText,
      this.onTap,
      this.textControler,
      this.sufixIcon,
      this.oncange,
      this.textinputType,
      this.validator,
      this.onsubmited});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .06,
        right: MediaQuery.of(context).size.width * .06,
        top: MediaQuery.of(context).size.height * .03,
      ),
      child: 
      TextFormField(
        onTap: onTap,
        validator: validator,
        onChanged: oncange,
        onFieldSubmitted: onsubmited,
        keyboardType: textinputType,
        style: TextStyle(color: Colors.black, fontSize: 16),
        controller: textControler,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.black)),
          hintText: '$hintText',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          suffixIcon: sufixIcon,
          prefixIcon: IconButton(
              onPressed: () {
                textControler?.clear();
              },
              icon: Icon(Icons.clear),
              color: Colors.black),
          contentPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .01,
              top: MediaQuery.of(context).size.height * .01,
              right: MediaQuery.of(context).size.width * .02),
        ),
      ),
    );
  }
}
