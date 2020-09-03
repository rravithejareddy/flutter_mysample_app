
import 'package:flutter_sample_app/widgets/card_list_item.dart';
import 'package:flutter_sample_app/widgets/check_box_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_app/blocs/crops/crops.dart';
import 'package:flutter_sample_app/blocs/filtered_crops/filtered_crops.dart';
import 'package:flutter_sample_app/models/crop.dart';
import 'package:flutter_sample_app/models/filter.dart';


class CropSearchPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  void _closeEndDrawer() {
    //Navigator.of(context).pop();
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CropSearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Drawer Demo')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<FilteredCropsBloc, FilteredCropsState>(
          key: key,
          builder: (context, state) {
            if (state is FilteredCropsLoadInProgress) {
              return buildLoading();
            } else if (state is FilteredCropsLoadSuccess) {

              return buildDashboard(state.filteredCrops);
            } else {
              return buildLoading();
            }
          },
        ),
      ),
      endDrawer: Drawer(child:
          BlocBuilder<FilteredCropsBloc, FilteredCropsState>(
              key: key,
              builder: (context, state) {

        if (state is FilteredCropsLoadSuccess) {
          return CheckBoxList(
              onSelected: (Filter filter) => {
                    BlocProvider.of<FilteredCropsBloc>(context)
                        .add(FilterUpdated(filter))
                  },
              filter: state.filter);
        }
        else{
          return buildLoading();
        }
      })),

      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildDashboard(List<Crop> crops) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        // alignment: Alignment.center,
        child: CustomScrollView(
          slivers: <Widget>[
            //  SearchForm(),
            sliverApp(),
            horizontalScroll(crops),
            bodyList(crops)
          ],
        ));
  }

  Widget postCard(BuildContext context, Crop crop) {
    return Card(
        color: Colors.grey.shade300,
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                   // return VillageListPage(zipcode: crop.zipcode);
                  },
                ),
              );
            },
            child: Column(
              children: [
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                    )),
                    child: Text(
                      crop.zipcode.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text('Top crops',
                    style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                Text('Red Gram:' + crop.grade.toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                Text('Green Gram:' + crop.quantity.toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                Text('Cotton:' + crop.cropType,
                    style: TextStyle(color: Colors.grey[800], fontSize: 15))
              ],
            )));
  }

  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        elevation: 2.0,
        title: Text("Feed"),
        forceElevated: true,
        pinned: true,
        floating: true,
        // bottom: bottomBar(),
      );

  Widget bodyList(List<Crop> posts) => SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0,

          ///mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
          //childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: postCard(context, posts[index]),
          );
        }, childCount: posts.length),
      );

  Widget grid(List<Crop> crops) => SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      );

  Widget sliverApp() => SliverAppBar(
          expandedHeight: 250.0,
          pinned: true,
          snap: false,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Available seats'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Add new entry',
              onPressed: () {
                /* ... */
              },
            ),
          ]);

  Widget horizontalScroll(List<Crop> crops) => SliverToBoxAdapter(
          child: Container(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 100.0,
              child: Card(
                child: Text('data'),
              ),
            );
          },
        ),
      ));

  Widget bottomBar() => PreferredSize(
      preferredSize: Size(double.infinity, 50.0),
      child: Container(
          color: Colors.black,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "All Posts",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )));
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Drawer Demo')),
      body: Center(
        child: RaisedButton(
          onPressed: _openEndDrawer,
          child: Text('Open End Drawer'),
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              RaisedButton(
                onPressed: _closeEndDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,
    );
  }
}
