import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:webrtc_interface/webrtc_interface.dart';

// This is a stub implementation to avoid Android Gradle issues

class FlutterWebRTC implements WebRTC {
  static FlutterWebRTC _instance = FlutterWebRTC._();
  
  factory FlutterWebRTC() => _instance;

  FlutterWebRTC._();

  @override
  Future<MediaStream> createLocalMediaStream(String label) async {
    return MediaStream._stub();
  }

  @override
  Future<RTCPeerConnection> createPeerConnection(
      Map<String, dynamic> configuration,
      [Map<String, dynamic>? constraints]) async {
    return RTCPeerConnection._stub();
  }

  @override
  Future<RTCPeerConnection> createRTCPeerConnection(
      Map<String, dynamic> configuration,
      [Map<String, dynamic>? constraints]) async {
    return RTCPeerConnection._stub();
  }

  @override
  VideoRenderer createVideoRenderer() {
    return VideoRenderer._();
  }

  @override
  Future<List<MediaDeviceInfo>> enumerateDevices() async {
    return [];
  }

  @override
  Future<MediaStream> getDisplayMedia(
      Map<String, dynamic> mediaConstraints) async {
    return MediaStream._stub();
  }

  @override
  Future<MediaStream> getUserMedia(Map<String, dynamic> mediaConstraints) async {
    return MediaStream._stub();
  }
}

class VideoRenderer extends ValueNotifier<RTCVideoValue> {
  VideoRenderer._() : super(RTCVideoValue(renderVideo: false));

  Future<void> initialize() async {}

  Future<void> dispose() async {
    super.dispose();
  }

  set srcObject(MediaStream? stream) {}

  MediaStream? get srcObject => null;

  Future<bool> audioOutput(String deviceId) async => true;

  Widget createNativeRenderer() => Container();

  Widget createTextureRenderer() => Container();
}

class MediaStream {
  MediaStream._stub();

  String get id => 'stub-id';
  bool get active => false;
  List<MediaStreamTrack> getTracks() => [];
  List<MediaStreamTrack> getAudioTracks() => [];
  List<MediaStreamTrack> getVideoTracks() => [];
  
  Future<void> addTrack(MediaStreamTrack track) async {}
  Future<void> removeTrack(MediaStreamTrack track) async {}
  
  void addListener(void Function(dynamic event) listener) {}
  void removeListener(void Function(dynamic event) listener) {}
  Future<void> dispose() async {}
}

class MediaStreamTrack {
  MediaStreamTrack._stub();

  bool get enabled => false;
  set enabled(bool value) {}
  Future<void> dispose() async {}
  Future<void> stop() async {}
}

class RTCVideoDimensions {
  int width = 0;
  int height = 0;
  RTCVideoDimensions(this.width, this.height);
}

class RTCVideoValue {
  RTCVideoValue({
    this.renderVideo = false,
    this.rotation = 0,
    this.width = 0,
    this.height = 0,
    this.textureId = 0,
  });

  final bool renderVideo;
  final int rotation;
  final int width;
  final int height;
  final int textureId;
}

class RTCPeerConnection {
  RTCPeerConnection._stub();

  void onAddStream(void Function(MediaStream stream) callback) {}
  void onRemoveStream(void Function(MediaStream stream) callback) {}
  void onAddTrack(void Function(MediaStream stream, MediaStreamTrack track) callback) {}
  void onRemoveTrack(void Function(MediaStream stream, MediaStreamTrack track) callback) {}
  void onIceCandidate(void Function(RTCIceCandidate candidate) callback) {}
  void onIceConnectionState(void Function(RTCIceConnectionState state) callback) {}
  void onSignalingState(void Function(RTCSignalingState state) callback) {}
  void onConnectionState(void Function(RTCPeerConnectionState state) callback) {}
  void onDataChannel(void Function(RTCDataChannel dataChannel) callback) {}
  void onRenegotiationNeeded(void Function() callback) {}
  
  Future<void> dispose() async {}
  Future<RTCSessionDescription?> getLocalDescription() async => null;
  Future<void> setLocalDescription(RTCSessionDescription description) async {}
  Future<RTCSessionDescription?> getRemoteDescription() async => null;
  Future<void> setRemoteDescription(RTCSessionDescription description) async {}
  Future<RTCSessionDescription> createOffer([Map<String, dynamic>? constraints]) async {
    return RTCSessionDescription('', '');
  }
  Future<RTCSessionDescription> createAnswer([Map<String, dynamic>? constraints]) async {
    return RTCSessionDescription('', '');
  }
  Future<void> addCandidate(RTCIceCandidate candidate) async {}
  Future<void> addStream(MediaStream stream) async {}
  Future<void> removeStream(MediaStream stream) async {}
  Future<void> close() async {}
  RTCPeerConnectionState get connectionState => RTCPeerConnectionState.RTCPeerConnectionStateClosed;
  RTCIceConnectionState get iceConnectionState => RTCIceConnectionState.RTCIceConnectionStateClosed;
  RTCSignalingState get signalingState => RTCSignalingState.RTCSignalingStateClosed;
  List<MediaStream> get localStreams => [];
  List<MediaStream> get remoteStreams => [];
  Future<RTCRtpSender> addTrack(MediaStreamTrack track, MediaStream stream) async {
    return RTCRtpSender._stub();
  }
  Future<void> removeTrack(RTCRtpSender sender) async {}
  Future<List<RTCRtpSender>> getSenders() async => [];
  Future<List<RTCRtpReceiver>> getReceivers() async => [];
  Future<List<RTCRtpTransceiver>> getTransceivers() async => [];
  Future<RTCDataChannel> createDataChannel(String label, RTCDataChannelInit init) async {
    return RTCDataChannel._stub();
  }
}

class RTCIceCandidate {
  RTCIceCandidate(this.candidate, this.sdpMid, this.sdpMLineIndex);
  
  final String candidate;
  final String sdpMid;
  final int sdpMLineIndex;
}

class RTCSessionDescription {
  RTCSessionDescription(this.sdp, this.type);
  
  final String sdp;
  final String type;
}

class RTCDataChannelInit {
  bool ordered = true;
  int maxRetransmitTime = -1;
  int maxRetransmits = -1;
  String protocol = 'sctp';
  bool negotiated = false;
  int id = 0;
}

class RTCDataChannel {
  RTCDataChannel._stub();
  
  String get label => 'stub-label';
  int get id => 0;
  RTCDataChannelState get state => RTCDataChannelState.RTCDataChannelClosed;
  
  void onDataChannel(void Function(RTCDataChannel channel) callback) {}
  void onMessage(void Function(RTCDataChannelMessage message) callback) {}
  void onOpen(void Function() callback) {}
  void onClose(void Function() callback) {}
  void onError(void Function(dynamic error) callback) {}
  
  Future<void> send(RTCDataChannelMessage message) async {}
  Future<void> close() async {}
}

class RTCDataChannelMessage {
  RTCDataChannelMessage(this.binary);
  
  final bool binary;
  String get text => '';
  Uint8List get binary8 => Uint8List(0);
}

class RTCRtpSender {
  RTCRtpSender._stub();
  
  Future<void> replaceTrack(MediaStreamTrack track) async {}
  Future<void> setParameters(RTCRtpParameters parameters) async {}
  Future<RTCRtpParameters> getParameters() async {
    return RTCRtpParameters();
  }
  Future<void> dispose() async {}
}

class RTCRtpParameters {
  List<RTCRtpEncoding> encodings = [];
}

class RTCRtpEncoding {
  bool active = true;
  double? maxBitrate;
  double? minBitrate;
  int? maxFramerate;
  double? scaleResolutionDownBy;
  String? rid;
}

class RTCRtpReceiver {
  RTCRtpReceiver._stub();
  
  MediaStreamTrack get track => MediaStreamTrack._stub();
  Future<void> dispose() async {}
}

class RTCRtpTransceiver {
  RTCRtpTransceiver._stub();
  
  RTCRtpTransceiverDirection get direction => RTCRtpTransceiverDirection.RecvOnly;
  set direction(RTCRtpTransceiverDirection value) {}
  
  RTCRtpSender get sender => RTCRtpSender._stub();
  RTCRtpReceiver get receiver => RTCRtpReceiver._stub();
  Future<void> stop() async {}
  Future<void> dispose() async {}
} 