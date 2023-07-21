import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_pass_model.dart';
export 'change_pass_model.dart';

class ChangePassWidget extends StatefulWidget {
  const ChangePassWidget({Key? key}) : super(key: key);

  @override
  _ChangePassWidgetState createState() => _ChangePassWidgetState();
}

class _ChangePassWidgetState extends State<ChangePassWidget>
    with TickerProviderStateMixin {
  late ChangePassModel _model;

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePassModel());

    _model.passwordController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.passwordController,
      obscureText: !_model.passwordVisibility,
      decoration: InputDecoration(
        labelText: FFLocalizations.of(context).getText(
          '6gnbylgc' /* Password */,
        ),
        labelStyle: FlutterFlowTheme.of(context).bodySmall,
        hintText: FFLocalizations.of(context).getText(
          'vl8uvbuc' /* Enter your email here... */,
        ),
        hintStyle: FlutterFlowTheme.of(context).bodySmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryBackground,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 24.0, 24.0),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => _model.passwordVisibility = !_model.passwordVisibility,
          ),
          focusNode: FocusNode(skipTraversal: true),
          child: Icon(
            _model.passwordVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 22.0,
          ),
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      validator: _model.passwordControllerValidator.asValidator(context),
    ).animateOnPageLoad(animationsMap['textFieldOnPageLoadAnimation']!);
  }
}
