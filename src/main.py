import click
import beat.tracker as bt


def beat_tracker(file):
    """Print the estimated tempo and beat times of the input audio file"""
    print(f'Audio file path: {file}')

    bpm, beat_times = bt.track(file)

    print(f'Estimated tempo: {bpm} BPM')
    print(f'Beat times: {beat_times}')


@click.command()
@click.argument('command', type=click.Choice(['beat_tracker']))
@click.argument('file', type=click.Path(exists=True))
def main(command=None, file=None):
    globals()[command](file)


if __name__ == '__main__':
    main()
