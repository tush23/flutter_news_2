import 'package:flutternews2/models/category_model.dart';

List<CategoryModel> getCategoryModel(){

  List<CategoryModel> mCategory = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  //categoryModel.imageUrl ="asset/harley.jpg";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCategory.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  //categoryModel.imageUrl ="asset/jacob.jpg";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
  mCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Genral";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1567965054272-f4e0619f4145?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  mCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80";
  mCategory.add(categoryModel);

 return mCategory;

}