import 'package:flutter/material.dart';
import 'package:to_do_list/models/category.dart';
import 'package:to_do_list/service/category_service.dart';

import 'Home_screen.dart';
class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  var _CategoryNameContorller = TextEditingController();
  var _CategoryDescriptionController = TextEditingController();
  var _category = Category();
  var _categoryService = CategoryService();


@override
  void initState(){
    super.initState();
    getAllCategories();

  }
  List<Category> _categoryList = List<Category>();
  getAllCategories()async {
    _categoryList = List<Category>();
    var categories = await _categoryService.readCategory();
    categories.forEach((category){
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id = category['id'];
        _categoryList.add(categoryModel);

      });
    });

  }

  _showFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true, builder:(param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
            color: Colors.yellow,
              onPressed: ()async{
              _category.name = _CategoryNameContorller.text;
              _category.description = _CategoryDescriptionController.text;
              _categoryService.saveCategory(_category);
              var result = await _categoryService.saveCategory(_category);
              print(result);
              },
              child: Text('Save')),
          FlatButton(
              color: Colors.green,
              onPressed:()=>Navigator.pop(context),
              child: Text('Cancel'))
        ],
        title: Text('Category from'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
               controller: _CategoryNameContorller,
                decoration: InputDecoration(
                  hintText: 'Write Categories',
                  labelText: 'Categories'
                ),
              ),
              TextField(
                controller: _CategoryDescriptionController,
                decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Write Descriptions'
                ),
              )
            ],
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(onPressed: (
            )=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
        child: Icon(Icons.arrow_back, color: Colors.white,),
          elevation: 0.0,
          color: Colors.blue,
        ),
        title: Text('Categories'),
      ),
      body: ListView.builder(itemCount: _categoryList.length, itemBuilder:(context, index){
        return Padding(
          padding:EdgeInsets.only(top:2.0, left: 2.0, right: 2.0),
          child: Card(
            elevation: 1.0,
            child: ListTile(
              leading: IconButton(icon: Icon(Icons.edit),onPressed: (){}),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_categoryList[index].name),
                  IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: (){},)

                ],
              ),
              subtitle: Text(_categoryList[index].description),
            )
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
