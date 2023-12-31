import '/backend/backend.dart';
import '/components/create_comment_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animal_details_model.dart';
export 'animal_details_model.dart';

class AnimalDetailsWidget extends StatefulWidget {
  const AnimalDetailsWidget({
    Key? key,
    required this.animalDocument,
  }) : super(key: key);

  final AnimalsRecord? animalDocument;

  @override
  _AnimalDetailsWidgetState createState() => _AnimalDetailsWidgetState();
}

class _AnimalDetailsWidgetState extends State<AnimalDetailsWidget>
    with TickerProviderStateMixin {
  late AnimalDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -140.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0.6, 0.6),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0.0, 120.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimalDetailsModel());

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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<AnimalsRecord>(
      stream: AnimalsRecord.getDocument(widget.animalDocument!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final animalDetailsAnimalsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 240.0,
                        child: Stack(
                          alignment: AlignmentDirectional(-0.95, -0.7),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                width: 600.0,
                                height: 240.0,
                                fit: BoxFit.cover,
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation']!),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, -0.55),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pop();
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['cardOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'obyrn1rb' /* Animal Name */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.animalDocument?.name,
                                      'Animal',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              ],
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x2B000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.mark_chat_unread,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: 120.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: Color(0x4D91D0E8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.pets_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.animalDocument?.animalType,
                                  'Tipo',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ecbeopja' /* Breed */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation3']!),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'xf6clrz6' /* Head of Procurement */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation4']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'kl55bl1c' /* Local */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation5']!),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'nh9bkr5i' /* ACME Co. */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation6']!),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 12.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ).animateOnPageLoad(
                          animationsMap['dividerOnPageLoadAnimation']!),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'dkyygm1d' /* measurements */,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation7']!),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 16.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'p82rjlf3' /* Alexandria Smith */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2s53b50t' /* 1m ago */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderRadius: 30.0,
                                        borderWidth: 2.0,
                                        buttonSize: 50.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.add_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x9A000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 370.0,
                                                  child: CreateCommentWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rnaiavvh' /* Lorem ipsum dolor sit amet, co... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 120.0,
                constraints: BoxConstraints(
                  maxWidth: 700.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x19000000),
                      offset: Offset(0.0, -2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'suvzdvvk' /* View Company */,
                        ),
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ],
          ),
        );
      },
    );
  }
}
