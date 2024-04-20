import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/utils/chat_constants.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({
    required this.source,
    required this.onDelete,
    super.key,
  });

  /// Path from where to play recorded audio
  final ap.AudioSource source;

  /// Callback when audio file should be removed
  /// Setting this to null hides the delete button
  final VoidCallback onDelete;

  @override
  AudioPlayerState createState() => AudioPlayerState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ap.AudioSource>('source', source))
      ..add(ObjectFlagProperty<VoidCallback>.has('onDelete', onDelete));
  }
}

class AudioPlayerState extends State<AudioPlayer> {
  static const double _controlSize = 56;
  static const double _deleteBtnSize = 24;

  final ap.AudioPlayer _audioPlayer = ap.AudioPlayer();
  late StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.playerStateStream.listen((ap.PlayerState state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _positionChangedSubscription = _audioPlayer.positionStream
        .listen((Duration position) => setState(() {}));
    _durationChangedSubscription = _audioPlayer.durationStream
        .listen((Duration? duration) => setState(() {}));
    _init();

    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(widget.source);
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildControl(),
            _buildSlider(constraints.maxWidth),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color(0xFF73748D),
                size: _deleteBtnSize,
              ),
              onPressed: () {
                // ignore: always_specify_types
                _audioPlayer.stop().then((value) => widget.onDelete());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildControl() {
    Icon icon;
    Color color;

    if (_audioPlayer.playerState.playing) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.play_arrow, color: theme.primaryColor, size: 30);
      color = MainColors.primary;
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child:
              SizedBox(width: _controlSize, height: _controlSize, child: icon),
          onTap: () {
            if (_audioPlayer.playerState.playing) {
              pause();
            } else {
              play();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    final position = _audioPlayer.position;
    final duration = _audioPlayer.duration;
    var canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    var width = widgetWidth - _controlSize - _deleteBtnSize;
    width -= _deleteBtnSize;

    return SizedBox(
      width: width,
      child: Slider(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.secondary,
        onChanged: (double v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            _audioPlayer.seek(Duration(milliseconds: position.round()));
          }
        },
        value: canSetValue && duration != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

  Future<void> play() {
    return _audioPlayer.play();
  }

  Future<void> pause() {
    return _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    return _audioPlayer.seek(Duration.zero);
  }
}

class AudioRecorder extends StatefulWidget {
  const AudioRecorder({
    required this.onStop,
    required this.onDelete,
    super.key,
  });

  final void Function(String path) onStop;
  final void Function() onDelete;

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(String path)>.has('onStop', onStop),
    );
  }
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();

  @override
  void initState() {
    _start();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRecordStopControl(),
        _buildTimer(),
        InkWell(
          onLongPress: () {},
          onTap: () {
            _isRecording ? _stop() : _start();
          },
          child: Container(
            decoration: const BoxDecoration().addCustomShadow(
              color: MainColors.transparentBlue.withOpacity(0.1),
              offsetX: 4,
              offsetY: 8,
              blurRadius: 24,
            ),
            child: CustomCircleButton(
              backgroundColor: MainColors.primary,
              iconPath: _isRecording
                  ? Assets.icons.bold.send.path
                  : Assets.icons.bold.voice.path,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    icon = const Icon(Icons.delete, color: Colors.red, size: 30);
    color = Colors.red.withOpacity(0.1);

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          onTap: _clear,
          child: SizedBox(width: 56, height: 56, child: icon),
        ),
      ),
    );
  }

  Widget _buildTimer() {
    final minutes = _formatNumber(_recordDuration ~/ 60);
    final seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    var numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  Future<void> _start() async {
    try {
      await vibrates();
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        final isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _clear() async {
    // Kayıt durumunu ve süresini sıfırla
    _isRecording = false;
    _recordDuration = 0;
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop();
    // Eğer kaydedilen bir ses dosyası varsa, onu sil
    if (path != null && File(path).existsSync()) {
      await File(path).delete();
    }
    widget.onDelete();

    // UI güncellemesi için setState çağrı
    setState(() {});
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop();
    widget.onStop(path!);

    setState(() => _isRecording = false);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      setState(() {});
    });
  }
}
