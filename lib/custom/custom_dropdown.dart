import 'package:flutter/material.dart';
import 'package:flutternews2/models/source_model.dart';

class CustomDropDown extends StatefulWidget {
  List<SourceModel> mSourceList;

  CustomDropDown({this.mSourceList});

  var selected;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<DropdownMenuItem<SourceModel>> _dropdownMenuItem;
  SourceModel selectedSource;

  @override
  void initState() {
    // TODO: implement initState
    _dropdownMenuItem = buildDropDownMenuItems(widget.mSourceList);
    selectedSource =
        _dropdownMenuItem != null ? _dropdownMenuItem[0].value : "Selected";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text("Select Source"),
          value: selectedSource,
          items: _dropdownMenuItem,
          onChanged: onChangedDropDownItem,
        ),
      ),
    );
  }

  List<DropdownMenuItem<SourceModel>> buildDropDownMenuItems(List mSourceName) {
    List<DropdownMenuItem<SourceModel>> items = List();
    for (SourceModel sourceModel in mSourceName) {
      items.add(DropdownMenuItem(
        value: sourceModel,
        child: Text(sourceModel.name),
      ));
    }
    return items;
  }

  void onChangedDropDownItem(SourceModel value) {
    setState(() {
      selectedSource = value;
    });
  }
}
