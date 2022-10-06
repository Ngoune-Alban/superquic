import 'package:flutter/material.dart';
import 'package:superking/size_config.dart';

const kPrimaryColor = Color(0xFF083D77);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF083D99), Color(0xFF083D77)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Veuillez entrer votre adresse e-mail";
const String kInvalidEmailError = "Veuillez entrer une adresse e-mail valide";
const String kPassNullError = "Veuillez entrer votre mot de passe";
const String kShortPassError = "Le mot de passe est trop court";
const String kMatchPassError = "Les mots de passe ne correspondent pas";
const String kNamelNullError = "Veuillez entrer votre nom";
const String kPhoneNumberNullError =
    "Veuillez entrer votre numéro de téléphone";
const String kAddressNullError = "Veuillez entrer votre adresse";
const String kUserNotFound = "Utilisateur non trouvé";
const String kUserEmailAlreadyExist = "Cet email est déjà pris";
const String kWrongPassword = "Mot de passe incorrect";
const String kUnknownError = "Erreur inattendue, veuillez réessayer";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
