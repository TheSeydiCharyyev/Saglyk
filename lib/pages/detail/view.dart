import 'package:app/common/entities/entities.dart';
import 'package:app/common/widgets/app.dart';
import 'package:app/pages/detail/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'logic.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var title = "";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        var data = ModalRoute.of(context)?.settings.arguments as DoctorData;
        setState(() {
          title = data.name??"Doctor Detail";
        });
        Logic(context: context).handleInit(data.id);
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
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: buildAppBar(title),
          body: CustomScrollView(slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverToBoxAdapter(child: BannerView()),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverToBoxAdapter(child: DetailTitleView()),
            ),
          ]),
        ),
      );
    });
  }
}
