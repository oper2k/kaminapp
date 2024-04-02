import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Должен быть email';
    }
    return null;
  }

  // State field(s) for Pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  String? _passControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passVisibility = false;
    passControllerValidator = _passControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passFocusNode?.dispose();
    passController?.dispose();
  }
}
