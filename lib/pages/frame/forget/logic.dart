import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/common/widgets/toast.dart';

import 'bloc.dart';

class ForgetLogic {
  final BuildContext context;

  ForgetLogic({
    required this.context,
  });

  handleEmailForgot() async{
    final state = context.read<ForgetBloc>().state;
    String emailAddress = state.email;
    if(emailAddress.isEmpty){
      toastInfo(msg: "Email not empty!");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();

  }


}