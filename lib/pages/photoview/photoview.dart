import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';
import 'package:app/pages/photoview/bloc/photoview_bloc.dart';
import 'package:photo_view/photo_view.dart' as PhotoImgView;

class PhotoView extends StatefulWidget {
  const PhotoView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => PhotoView());
  }

  @override
  State<PhotoView> createState() => _PhotoViewPage();
}

class _PhotoViewPage extends State<PhotoView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    context.read<PhotoViewBloc>().add(PhotoViewChanged(data["url"]));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: BlocBuilder<PhotoViewBloc, PhotoViewState>(
            builder: (context, state) {
              return state.url.isEmpty
                  ? Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: Colors.black26, strokeWidth: 2)),
              )
                  : Container(
                  child: PhotoImgView.PhotoView(
                    imageProvider: NetworkImage(state.url),
                  )
              );
            })
    )));
  }
  AppBar _buildAppBar() {
    return AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: AppColors.primaryThreeElementText,
              height: 2.0,
            )),
        title: Text(
          "PhotoView",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ));
  }
}
