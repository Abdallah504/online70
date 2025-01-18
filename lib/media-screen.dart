import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  final ImagePicker _picker  =ImagePicker();
  XFile? _pickedFile;
  VideoPlayerController? _videoPlayerController;
  late AudioPlayer _audioPlayer;
  bool isAudioPlaying = false;
  String? _pickfilePath;



  Future<void>pickImage()async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = image;
      _disposeMedia();
    });
  }

  Future<void>pickVideo()async{
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if(video !=null){
      _disposeMedia();
      _videoPlayerController = VideoPlayerController.file(File(video.path))
      ..initialize().then((v){
        setState(() {
          _pickedFile = video;
        });
        _videoPlayerController!.play();
      });

    }
  }

  Future<void>pickedAudio()async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio
    );
    
    if(result!=null){
      final filePath = result.files.single.path;
      setState(() {
        _pickfilePath = filePath;
        print('file : $filePath');
      });
      await _audioPlayer.setAudioSource(AudioSource.file(filePath!)).then((v){
        _audioPlayer.play();
        print('I am playing');
      });

      setState(() {

        isAudioPlaying = true;
      });
    }
  }

@override
  void initState() {
    _audioPlayer = AudioPlayer();
    super.initState();
  }

@override
  void dispose() {
  _disposeMedia();
    super.dispose();
  }


  void _disposeMedia(){
    _videoPlayerController?.dispose();
    _videoPlayerController = null;

    if(_audioPlayer !=null){
      _audioPlayer!.dispose();
      isAudioPlaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_pickedFile !=null)
              _videoPlayerController !=null?
                  SizedBox(
                    height: 200,
                  width: 100,

                  child: VideoPlayer(_videoPlayerController!),
                  ):
                      Image.file(File(_pickedFile!.path),
                      height: 200,
                        width: 200,
                      ),
            
            Row(
              children: [
                ElevatedButton(onPressed: pickImage, child: Text('Pick image')),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: pickVideo, child: Text('Pick Video')),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: pickedAudio, child: Text('Pick Audio'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
