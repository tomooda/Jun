About
-

This project is to port takenoko, a [Jun for Smalltalk](http://aokilab.kyoto-su.ac.jp/jun/index.html)'s fork distributed under the BSD license.
This repository currently has only basic geometry classes including

* geometric objects
* graphics ojects
* rendering contexts (Canvas-based and OpenGL-based)

and Launcher that gives visual demos.

The source code of the original "takenoko" is available at [here](ftp://ftp.sra.co.jp/pub/lang/smalltalk/takenoko/).

Install
-

```
Metacello new
    baseline: 'Jun';
    repository: 'github://tomooda/Jun';
    load.
```

To embed Jun's 3D object into [GToolkit](https://feenk.com/#gt), please load the ```Jun-Bloc``` package.

Demo
-
[![benzene](http://img.youtube.com/vi/ZgS8Y9gJRFc/0.jpg)](http://www.youtube.com/watch?v=ZgS8Y9gJRFc) Benzene molecule

[![Earth and moon](http://img.youtube.com/vi/liPnWDkEJ4Q/0.jpg)](http://www.youtube.com/watch?v=liPnWDkEJ4Q) Flying by Moon towards Earth

[![T3 in GToolkit](http://img.youtube.com/vi/hGcaeKwsF8k/0.jpg)](http://www.youtube.com/watch?v=hGcaeKwsF8k) Embedding T3 protein into a class comment using GToolkit.
