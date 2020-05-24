import 'package:flutternews2/models/country_model.dart';

List<CountryModel> getCountryModel() {
  List<CountryModel> mCountry = new List<CountryModel>();

  CountryModel countryModel = new CountryModel();

  //1
  countryModel.countryName = "Business";
  //categoryModel.imageUrl ="asset/harley.jpg";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCountry.add(countryModel);

  countryModel = new CountryModel();

  countryModel.countryName = "Technology";
  //categoryModel.imageUrl ="asset/jacob.jpg";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
  mCountry.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Entertainment";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCountry.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Genral";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1567965054272-f4e0619f4145?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCountry.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Science";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCountry.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Health";
  countryModel.imageUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80";
  mCountry.add(countryModel);

  return mCountry;
}
