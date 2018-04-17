[Home](./index.md)


[Previous: Effects](./effects.md)

## Limitations
We faced several limitations during the process of creating this vocal harmonizer. Only two harmonies were implemented. This may not be the most user-friendly situation, because it would be nicer if the user had the option select how many upper or lower voices they wanted. Although the Max/MSP patch could be modified to do so, the user would need to have a background in music theory and Max/MSP to apply the correct intervals above and/or below the main voice into the patch. Moreover, the intervals in the `coll` tables were not calculated for non-diatonic notes. However, if the user sings a non-diatonic note, the ratio of pitch shift will be the same as the previously sung note, which will likely be a third anyway. The user must also be able to sing in tune in order for the pitch shift to work properly. This is because the accuracy of the pitch-shift it contingent on how `retune~` detects the pitch, and essentially, the ratios of pitch-shift. Additionally, it would be difficult to sing a song that modulates, because modulations may have small occurrences of multiple keys, so the user would have to change the key very quickly, which could become distracting for the performance.

Our initial idea was to create the harmonizer entirely in Max/MSP. This meant prototyping the signal pre processing and spectral analysis in MATLAB, and then writing externals that could perform these functions. During the implementation process, we didn't have enough time to implement the externals, so we ended up creating a VST plugin in MATLAB for the pre processing step. 

## Outlook
If this project were to be expanded on, we would like to consider connecting our vocal harmonizer to a MIDI controller. This would allow the user to more easily control the key, volume of each voice, and parameters of the delay and feedback for each voice. We would also like to give more options for the number of harmonized voices. This would allow our vocal harmonizer to provide options that cater to the user’s preferences. We could also add a chorus effect, to make the harmonizer resemble a choir. We would also like to refine the pre processing and spectral envelope analysis further, and implement it as an external to make a more efficient interface.




[Next: References](./references.md)
