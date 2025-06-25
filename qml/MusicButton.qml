//to play music
import Felgo
import QtQuick
import QtQuick.Controls
import QtMultimedia
Button {
    property alias backgroundMusicSource:_backgroundMusic.source
    property alias backgroundMusic: _backgroundMusic
    property bool playMusic:false
    background: Rectangle{
        id:rectangle;color:"transparent";border.color:"transparent"
        width: 60;height: 30
        Row{
            Image{
                width:25;height:25
                id:musicImage
                source:"../assets/music.png"
            }
            Image {
                width:30;height: 30
                id: frame
                source:playMusic? "../assets/options_checkbox1.png" : "../assets/options_checkbox0.png"
            }
        }

        TapHandler{
            onTapped: {
                if(playMusic){
                    playMusic = false
                    _backgroundMusic.stop()
                    console.log("playMusic :",playMusic)
                } else {
                    playMusic = true
                    _backgroundMusic.play()
                    console.log("playMusic :",playMusic)
                }
            }
        }
    }
    MediaPlayer{
        id:_backgroundMusic
        source:""
        loops: MediaPlayer.Infinite  // 无限循环播放
        audioOutput: AudioOutput {
            id:_audioOutput
        }
    }
}
