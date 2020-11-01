# GLaDOS voice pack builder

Give some personality to your Xiaomi vacuum by creating your own GLaDOS voice pack.

The script reads the text from the csv file in GLaDOS' voice and packages it for upload to your vacuum. It's been tested with a gen1 running [Valetudo](https://valetudo.cloud/) but should also work with other generations and with other ways of installing the voice pack.

Want to hear what it sounds like first? Check out [GLaDOS voice generator](https://glados.c-net.org/).

## Requirements

- curl to call the GLaDOS voice generator API.
- [ffmpeg](http://ffmpeg.org/) and ffmpeg-normalize (`pip install ffmpeg-normalize`) to normalize the volume of the voice files.
- ccrypt to package the wav files.

## Usage

- `git clone` this repo
- Change the lines in the csv file from the xiaomi default to something you want GLaDOS to say.
- Run `./01-speak.sh` to generate the speech.
- Run `./02-process.sh` to normalize the volume.
- Run `./03-package.sh` to package the wav files.
- Visit Valetudo in your browser (the IP of your vacuum) and go to Settings -> Sound and voice. Upload the generated .pkg file from the output/result directory and press 'Upload Voice Pack'.
- Done!

If you created a custom csv file, please be so kind to share it back so others can benefit from it.

## Tips

### Original samples

You can't beat the actual GLaDOS with her expression and cynicism, so why not replace some of the wav files with original samples from the game?

- Find the right samples, for instance on [here](http://www.portal2sounds.com/#w=glados).
- Download (via 'direct link') and give them the appropriate filenames (see the csv file).
- Convert mp3 to wav like this: `for i in *.mp3; do ffmpeg -i "$i" "${i%.*}.wav"; done`.
- Replace the respective files in the `output/result` directory and run the package script.

### Speak when bumping into something

Now we have this great voice installed, wouldn't it be great if GLaDOS would speak a bit more? How about a custom voice pack and configuration for this: [roborock-oucher](https://github.com/porech/roborock-oucher)?

### Further automations

If you are using [Home Assistant](https://www.home-assistant.io/), you can combine the control of your vacuum with other automations. How about a [soundtrack](https://www.youtube.com/watch?v=Y6ljFaKRTrI) or some light effects? The only limit is your willingness to release your inner geek - you know you want to ;).

## Credits

- Thanks to the folks over at [DustCloud](https://github.com/dgiese/dustcloud) for freeing our vacuums (and [transcribing the default voice](https://github.com/dgiese/dustcloud/blob/master/devices/xiaomi.vacuum/audio_generator/language/audio_en.csv)).
- [Valetudo](https://valetudo.cloud/) for the great ux.
- [b01t](https://dhampir.no/) for providing an API to his [GLaDOS voice generator](https://glados.c-net.org/).
