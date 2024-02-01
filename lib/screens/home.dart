import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:product_list/screens/web_view/view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../config/app_settings.dart';
import '../constant/colors.dart';
import '../constant/text_style.dart';
import '../customWidgets/CustomTextField.dart';
import '../customWidgets/root_containers.dart';
import '../models/notes_model.dart';
import '../style/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> filteredNotes = [];
  List<Note> sampleNotes = [];
  bool sorted = false;
//new
  List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> _searchNote = [];
  final TextEditingController _headLineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String noteDate = DateFormat("dd-MM-yyyy hh:mm aaa").format(DateTime.now());
  final _openBox = Hive.box('open_note');
  //slider
  List imageList = [
    {"id": 1, "image_path": 'res/images/slider_images/banner.png'},
    {"id": 2, "image_path": 'res/images/slider_images/bestsellersbanner.png'},
    {"id": 3, "image_path": 'res/images/slider_images/banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  void _showEdit(BuildContext context, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _headLineController.text = existingItem['title'];
      _descriptionController.text = existingItem['content'];
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        backgroundColor: Color(0xFFFFF8E1),
        builder: (context) => SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: RootContainers.instance
                      .getBoxDecorations(AppColors.priceShowColor, 5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '■ Product Name :',
                              style: getTextStyle(15, FontWeight.normal,
                                  AppColors.textFieldTopColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        CustomTextFields(
                            "", _headLineController, TextInputType.text),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '■ Product Details :',
                              style: getTextStyle(15, FontWeight.normal,
                                  AppColors.textFieldTopColor),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, bottom: 5),
                            decoration: new BoxDecoration(
                                color: AppColors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                )),
                            child: TextField(
                                controller: _descriptionController,
                                maxLines: 5,
                                minLines: 5,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write details..'.tr,
                                  hintStyle: getTextStyle(
                                      14, FontWeight.normal, Colors.grey),
                                ),
                                style: getTextStyle(
                                    16, FontWeight.normal, Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 5),
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                if (_headLineController.text.isEmpty &&
                                    _descriptionController.text.isEmpty) {
                                  Fluttertoast.showToast(msg: 'Empty field!');
                                } else if (itemKey == null) {
                                  createItem({
                                    "title": _headLineController.text,
                                    "content": _descriptionController.text,
                                    "noteDate": noteDate
                                  });
                                  Navigator.pop(context);
                                } else {
                                  editItem(itemKey, {
                                    "title": _headLineController.text.trim(),
                                    "content":
                                        _descriptionController.text.trim(),
                                    "noteDate": noteDate.trim()
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: const Icon(Icons.save),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )).whenComplete(() => setState(() {
          _headLineController.text = '';
          _descriptionController.text = '';
        }));
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _openBox.add(newItem);
    print('>>>>>>>>>>>${_openBox.length}');
    refreshItems();
  }

  Future<void> editItem(int itemKey, Map<String, dynamic> item) async {
    await _openBox.put(itemKey, item);
    print('>>>>>>>>>>>${_openBox.length}');
    refreshItems();
  }

  Future<void> deleteItem(int itemKey) async {
    await _openBox.delete(itemKey);
    print('>>>>>>>>>>>${_openBox.length}');
    refreshItems();
  }

  void refreshItems() {
    final data = _openBox.keys.map((key) {
      final item = _openBox.get(key);
      return {
        "key": key,
        "title": item["title"],
        "content": item["content"],
        "noteDate": item["noteDate"]
      };
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print('____________${_items.length}');
    });
  }

  @override
  void initState() {
    super.initState();
    refreshItems();
    filteredNotes = sampleNotes;
  }

  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;

    return notes;
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = filteredNotes[index];
      filteredNotes.removeAt(index);
      sampleNotes.remove(note);
    });
    //db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorAccentLightFade,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product List',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomDialogBox(Get.context!, 'Please Confirm'.tr,
                          'Want to Exit?'.tr, null, null, onConfirm: () {
                        SystemNavigator.pop();
                      }, onCancel: () {
                        Get.back();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 0),
                      child: Image(
                        image: AssetImage(
                            ImageLocation.dashboard + "/ic_exit.png"),
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.red
                                    : Colors.teal),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: (){
                  Get.to(()=> WebViewPage());

                },
                child: Container(
                    width: double.infinity,
                    decoration: RootContainers.instance.getBoxDecorations(AppColors.takaColor, 5),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Google Map', style:
                          getTextStyle(15, FontWeight.normal, AppColors.white)),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  _showEdit(context, null);
                },
                child: Container(
                  width: double.infinity,
                  decoration: RootContainers.instance
                      .getBoxDecorations(AppColors.priceShowColor, 5),
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                    title: Text(
                      'Product Add',
                      style:
                          getTextStyle(15, FontWeight.normal, AppColors.black),
                    ),
                    trailing: Icon(
                      Icons.add_shopping_cart,
                      size: 22,
                      color: AppColors.greenButton,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentItem = _items[index];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: GestureDetector(
                            onTap: () async {
                              _showEdit(context, currentItem['key']);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: getRandomColor(),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x320E151B),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Hero(
                                      tag: 'ControllerImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          image: AssetImage(
                                              ImageLocation.dashboard +
                                                  "/product.jpg"),
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Text(
                                                'Product name: ' +
                                                    currentItem["title"],
                                                style: getTextStyle(
                                                    12,
                                                    FontWeight.normal,
                                                    Colors.blueAccent),
                                              ),
                                            ),
                                            Text(
                                              'Details: ',
                                              style: getTextStyle(
                                                  12,
                                                  FontWeight.normal,
                                                  Colors.red),
                                            ),
                                            Divider(
                                                thickness: 1,
                                                color: Color(0xffBCCCCCC)),
                                            Text(
                                              '${currentItem["content"]} \n',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: getTextStyle(
                                                  12,
                                                  FontWeight.normal,
                                                  Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Color(0xFFE86969),
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        final result =
                                            await confirmDialog(context);
                                        if (result != null && result) {
                                          deleteItem(currentItem['key']);
                                          //deleteNote(index);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFE6F9FF),
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Are you sure you want to delete?',
              style: TextStyle(color: Colors.black),
            ),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ]),
          );
        });
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
