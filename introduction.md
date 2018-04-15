[previous](./)


## Introduction
We were inspired by watching live performances that use a vocal harmonizer. In these live performances, a singer gets to sing and harmonize with themselves just by singing into a machine. We found this fascinating, and we thought it would be fun to implement by using concepts covered in our class. You can see an [example here](https://youtu.be/sd7GLvMYSHI?t=31s).

Our main goals were to find a way to implement a vocal harmonizer in real-time. We wanted it to pitch shift a singer’s voice, so that it would sound like the singer is singing harmonies in addition to the melody. We also wanted to replace fricative sounds with noise, so that we were not applying pitch shifts to the fricative sounds. In order for the harmonies to sound convincing, we also wanted to retain the spectral envelope (formants) of the singer’s voice, and apply it to each harmony voice. Another goal was to make the vocal harmonizer as user-friendly as possible. We wanted the user to be able to select a key and sing into the harmonizer, without having to do much else. We will walk you through each of these components in this website.


[next](./interface.md]
