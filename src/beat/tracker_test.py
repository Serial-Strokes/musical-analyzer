import librosa
import beat.tracker as bt


def test_track():
    file = librosa.util.example_audio_file()
    print(f'Audio file path: {file}')

    bpm, beat_times = bt.track(file)

    assert bpm == 129.19921875
    assert len(beat_times) == 129
    assert beat_times[0] == 0.11609977324263039
    assert beat_times[128] == 59.14122448979592
