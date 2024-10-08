// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../logic/modules/leave_model.dart';

class DeclineApproveLeaveListScreen extends StatelessWidget {
  DeclineApproveLeaveListScreen(this.leaveStatus, {Key? key}) : super(key: key);

  int leaveStatus;
  @override
  Widget build(BuildContext context) {
    List<Leave> leaveList = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);

    leaveListRaw?.forEach(
      (element) {
        if (element.status == leaveStatus) {
          leaveList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: leaveStatus == 1
            ? Text(
                'Approved Leave',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                'Declined Leave',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      body: leaveList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: leaveList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.1, color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    leaveList[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text('Room - ${leaveList[index].roomNo}'),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    leaveList[index]
                                            .dateOfLeave
                                            .day
                                            .toString() +
                                        '/' +
                                        leaveList[index]
                                            .dateOfLeave
                                            .month
                                            .toString() +
                                        '/' +
                                        leaveList[index]
                                            .dateOfLeave
                                            .year
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              leaveList[index].status == 0
                                  ? Text(
                                      'Pending',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          214,
                                          108,
                                          22,
                                        ),
                                      ),
                                    )
                                  : leaveList[index].status == 1
                                      ? Text('Approved',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold))
                                      : Text(
                                          'Declined',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                87,
                                238,
                                238,
                                238,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(
                                  157,
                                  158,
                                  158,
                                  158,
                                ),
                              ),
                            ),
                            child: Text(
                              leaveList[index].leaveReason,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nodata.jpg',
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    'No Complaints :)',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }
}
