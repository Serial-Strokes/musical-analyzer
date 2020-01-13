import librosa


def track(file):
    y, sr = librosa.load(file)
    bpm, beat_frames = librosa.beat.beat_track(y=y, sr=sr)
    beat_times = librosa.frames_to_time(beat_frames, sr=sr)
    return bpm, beat_times
