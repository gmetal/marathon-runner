# Marathon runner docker image

A docker image containing the [Marathon Test Runner](https://github.com/Malinskiy/marathon). This image
has been created to facilitate controlling one or more Android devices (it includes adb) and using them
in tests. 

NOTE: this image does not contain an ADB key by default. You will have to supply your own key (or have it generate a random key).

## Usage

Tο enter the docker image you can use the following command (which will also mount a directory named `external` in your current path to the `/external` directory inside the image:
```
docker run -it --rm -v $PWD/external:/external -w /external gmetal/marathon-runner:0.5.1 marathon -m /external/Marathonfile
```
