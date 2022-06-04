import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../models/historical_data_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../../widgets/bezier_container.dart';
class EntityDataPage extends StatefulWidget {
  const EntityDataPage({
    Key? key,
    this.title,
  }) : super(key: key);

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
    return SafeArea(
      child: Scaffold(
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
                    _backButton(),
                    SizedBox(height: height * .1),
                    _title(),
                    SizedBox(height: height * .1),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: _buildListData(),
                    ),
                    SizedBox(height: height * .055),
                  ],
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      )),
    );
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

  _pruebatable(BuildContext context, HistoricalDataModel model) {
    var timestampData = model.chart!.result![0].timestamp!;
    var openData = model.chart!.result![0].indicators!.quote![0].open!;
    var highData = model.chart!.result![0].indicators!.quote![0].high!;
    var lowData = model.chart!.result![0].indicators!.quote![0].low!;
    var closeData = model.chart!.result![0].indicators!.quote![0].close!;
    var volumeData = model.chart!.result![0].indicators!.quote![0].volume!;
    var adjCloseData =
        model.chart!.result![0].indicators!.adjclose![0].adjclose!;
    List<DataRow> dataRowsFinal = [];

    for (var i = 0; i < timestampData.length; i++) {
      dataRowsFinal.add(DataRow(cells: [
        DataCell(Text(Utils.readTimestamp(timestampData[i]))),
        DataCell(Text(openData[i].toString())),
        DataCell(Text(highData[i].toString())),
        DataCell(Text(lowData[i].toString())),
        DataCell(Text(closeData[i].toString())),
        DataCell(Text(adjCloseData[i].toString())),
        DataCell(Text(volumeData[i].toString())),
      ]));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataTable(
            showBottomBorder: true,
            headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            headingRowColor:
                MaterialStateProperty.resolveWith((states) => malibu),
            columns: const [
              DataColumn(
                label: Center(
                  child: Text(
                    date,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DataColumn(
                label: Text(open),
              ),
              DataColumn(
                label: Text(high),
              ),
              DataColumn(
                label: Text(low),
              ),
              DataColumn(
                label: Text(close),
              ),
              DataColumn(
                label: Text(adjClose),
              ),
              DataColumn(
                label: Text(volume),
              ),
            ],
            rows: dataRowsFinal,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .05),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(closeNote)),
          SizedBox(height: MediaQuery.of(context).size.width * .01),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(closeNote2)),
        ],
      ),
    );
  }
}
