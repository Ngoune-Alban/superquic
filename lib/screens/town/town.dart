import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: "kTitle",
//       home: Town(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

class Town extends StatefulWidget {
 Town({
    Key? key,
  }) : super(key: key);
  @override
  _Town createState() => _Town();
}

class _Town extends State<Town> {
  /// This is list of city which will pass to the drop down.
  final List<SelectedListItem> _listOfCities = [
    SelectedListItem(
      name: "Yaounde",
      value: "TYO",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Douala",
      value: "NY",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Bafoussam",
      value: "LDN",
      isSelected: false,
    ),
    SelectedListItem(name: "Dschang"),
    SelectedListItem(name: "Mbouda"),
    SelectedListItem(name: "Buea"),
    SelectedListItem(name: "Bamenda"),
    SelectedListItem(name: "Bertoua"),
    SelectedListItem(name: "Garoua"),
    SelectedListItem(name: "Maroua"),
    SelectedListItem(name: "Limbe"),
    SelectedListItem(name: "Kribi"),
  ];

  /// This is register text field controllers.
  // final TextEditingController _fullNameTextEditingController = TextEditingController();
  // final TextEditingController _emailTextEditingController = TextEditingController();
  // final TextEditingController _phoneNumberTextEditingController = TextEditingController();
  final TextEditingController _cityTextEditingController = TextEditingController();
  // final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // _fullNameTextEditingController.dispose();
    // _emailTextEditingController.dispose();
    // _phoneNumberTextEditingController.dispose();
    _cityTextEditingController.dispose();
    // _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _mainBody(),
      ),
    );
  }

  /// This is Main Body widget.
  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Text(
            "Dans quelle ville vous vous trouvez ?",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
         
          AppTextField(
            textEditingController: _cityTextEditingController,
            title: "Ville",
            hint: "nom de la ville",
            isCitySelected: true,
            cities: _listOfCities,
          ),
          
          const SizedBox(
            height: 15.0,
          ),
          _AppElevatedButton(),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController = TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          "Villes disponibles",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        submitButtonChild: const Text(
          'Fini',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Suivant",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF083D77),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}