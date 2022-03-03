import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARFittingRoom extends StatefulWidget {
  @override
  _ARFittingRoomState createState() => _ARFittingRoomState();
}

class _ARFittingRoomState extends State<ARFittingRoom> {
  late ARKitController arkitController;
  ARKitNode? head;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ARKitSceneView(
          configuration: ARKitConfiguration.bodyTracking,
          onARKitViewCreated: onARKitViewCreated,
          // debug: true,
          // autoenablesDefaultLighting: true
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if ((anchor is! ARKitBodyAnchor)) {
      // debugPrint("body anchor not found");
      return;
    }
    final transform =
        anchor.skeleton.modelTransformsFor(ARKitSkeletonJointName.head);
    debugPrint("body anchor is found");
    head = _createSphere(transform!);
    arkitController.add(head!, parentNodeName: anchor.nodeName);
  }

  ARKitNode _createSphere(Matrix4 transform) {
    debugPrint("sphere is created");
    // return ARKitNode(geometry: ARKitSphere(radius: 0.1), position: position);
    return ARKitReferenceNode(
      url: 'models.scnassets/aloha-shirt.dae',
      scale: vector.Vector3.all(0.15),
      position: _createPosition(transform),
    );
  }

  void _handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitBodyAnchor && mounted) {
      final transform =
          anchor.skeleton.modelTransformsFor(ARKitSkeletonJointName.head)!;
      head?.position = _createPosition(transform);
      // debugPrint("anchor is update");
    }
  }

  vector.Vector3 _createPosition(Matrix4 transform) {
    return vector.Vector3(
      transform.getColumn(3).x,
      transform.getColumn(3).y - 0.6,
      transform.getColumn(3).z,
    );
  }
}
