import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../models/historical_data_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../../widgets/bezier_container.dart';
import '../../widgets/general_button.dart';
import 'package:intl/intl.dart';

class EntityDataPage extends StatefulWidget {
  const EntityDataPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _EntityDataPageState createState() => _EntityDataPageState();
}

class _EntityDataPageState extends State<EntityDataPage> {
  late HomeBloc _newsBloc;
  @override
  void initState() {
    super.initState();
    _newsBloc = BlocProvider.of<HomeBloc>(context);
    _newsBloc.add(HomeVacantsList());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .25,
              right: -MediaQuery.of(context).size.width * .45,
              child: const BezierContainer()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .1),
                  _title(),
                  SizedBox(height: height * .1),
                  Container(
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width,
                    child: _buildListData(),
                  ),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }

  _buildListData() {
    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context),
      //create: (_) => _newsBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return _buildLoading();
            } else if (state is HomeLoading) {
              return _buildLoading();
            } else if (state is HomeLoaded) {
              //return _dataTable(context, state.vacants);
              return _pruebatable(context, state.vacants);
            } else if (state is HomeError) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sin Vacantes",
                  style: TextStyle(
                      color: eclipse,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child:
                  const Icon(Icons.keyboard_arrow_left, color: primaryPurple),
            ),
            const Text(back,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryPurple))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(days,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: primaryPurple));
  }

  _dataTable(BuildContext context, HistoricalDataModel model) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          var a = model.chart!.result![0].timestamp!;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: index,
              itemBuilder: ((contextb, indexA) {
                print("PRUEBA:$indexA");
                return Text(Utils.readTimestamp(indexA));
              }));

          /*
          return Text(
              // "${model.chart!.result![index].indicators!.quote!.map((e) => null).toList()}"//quizas es con .map
              //"${model.chart!.result![0].timestamp!}" //quizas es con .map
              bi.toString());
          */
        });
  }

  _pruebatable(BuildContext context, HistoricalDataModel model) {
    var timestampData = model.chart!.result![0].timestamp!;
    var openData = model.chart!.result![0].indicators!.quote![0].open!;
    var highData = model.chart!.result![0].indicators!.quote![0].high;
    var lowData = model.chart!.result![0].indicators!.quote![0].low;
    var closeData = model.chart!.result![0].indicators!.quote![0].close;
    var volumeData = model.chart!.result![0].indicators!.quote![0].volume;
    var adjCloseData = model.chart!.result![0].indicators!.adjclose;
    return Table(
      children: [
        const TableRow(children: [
          Text(date),
          Text(open),
          Text(high),
          Text(low),
          Text(close),
          Text(adjClose),
          Text(volume)
        ]),
        TableRow(children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: timestampData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Text(Utils.readTimestamp(timestampData[index]));
            },
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: openData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Text(openData[index].toString());
            },
          ),
          //_dataList(timestampData.length,Utils.readTimestamp(timestampData.toString())),
        ])
      ],
    );
  }

  _dataList(int itemCountData,  List<int> textData){
    return ListView.separated(
            shrinkWrap: true,
            itemCount: itemCountData,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Text(textData[index].toString());
            },
          );
  }
}
