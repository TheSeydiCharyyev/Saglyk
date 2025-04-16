import 'package:app/common/entities/entities.dart';
import 'package:app/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'logic.dart';
import 'widget.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() =>_AllPageState();
}

class _AllPageState extends State<AllPage> {
  var title = "All Doctor";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if (mounted) {
        var data = ModalRoute.of(context)?.settings.arguments;
        if(data==null){
          Logic(context:context).handleAll(-1);
        }else{
        var value =  data as CategoryData;
        setState(() {
          title = value.title??"All Doctor";
        });
        Logic(context:context).handleAll(value.id);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<AllBloc, AllState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar(title),
        backgroundColor: Theme.of(context).cardColor,
        body: CustomScrollView(slivers: [

          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.w,
                horizontal: 16.w,
              ),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  var item = state.allList.elementAt(index);
                  return BuildListItem(item:item);
                },
                childCount: state.allList.length,
              ),
              )
          ),
        ]),
      );
    });
  }
}


