# Marathon runner docker image

A docker image containing the [Marathon Test Runner](https://github.com/Malinskiy/marathon). This image
has been created to facilitate controlling one or more Android devices (it includes adb) and using them
in tests. 

NOTE: this image does not contain an ADB key by default. You will have to supply your own key. 

## Usage

Tο enter the docker image you can use the following command (which will also mount a directory named `external` in your current path to the `/external` directory inside the image:
```
docker run -it --rm -v $PWD/external:/external -w /external gmetal/marathon-runner:0.5.2 marathon -m /external/Marathonfile
```

You can supply a set of public/private keys, by copying them to the `external` directory, and binding them to the docker container as follows:

```
docker run -it --mount type=bind,source=$PWD/external/adbkey,target=/root/.android/adbkey --mount type=bind,source=$PWD/external/adbkey.pub --rm -v $PWD/external:/external -w /external gmetal/marathon-runner:0.5.2 marathon -m /external/Marathonfile
```

You can also give access to your USB bus (the `-privileged` flag shoud be used with caution) and try it out with a local device:

```
docker run --privileged -v /dev/bus/usb:/dev/bus/usb -it --mount type=bind,source=$PWD/external/adbkey,target=/root/.android/adbkey --mount type=bind,source=$PWD/external/adbkey.pub,target=/root/.android/adbkey.pub --rm -v $PWD/external:/external -w /external gmetal/marathon-runner:0.5.2 marathon -m /external/Marathonfile
```
