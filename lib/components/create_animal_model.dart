import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAnimalModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? localName = '';

  String? localType = '';

  String? localDescription = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for animalName widget.
  TextEditingController? animalNameController;
  String? Function(BuildContext, String?)? animalNameControllerValidator;
  // State field(s) for animalType widget.
  TextEditingController? animalTypeController;
  String? Function(BuildContext, String?)? animalTypeControllerValidator;
  // State field(s) for animalDescription widget.
  TextEditingController? animalDescriptionController;
  String? Function(BuildContext, String?)? animalDescriptionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    animalNameController?.dispose();
    animalTypeController?.dispose();
    animalDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
