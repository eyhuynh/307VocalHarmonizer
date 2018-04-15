[previous](./formantanalysis.md)

## Effects
We wanted to implement digital delay lines to add effects to either the singer’s voice, the upper harmony, the lower harmony, or any combination of the voices. Our goal was to provide user-control of the delay and feedback (i.e., echo).

> general image of subpatch

### Delay and Feedback: `tapin~` and `tapout~`
We used the `tapin~` and `tapout~` objects to create delay lines. The subpatch for this implementation was based on the ‘MSP Delay Tutorial 2’ from the Max/MSP documentation, with some modifications. The user can specify how long (in milliseconds) they want the delay to be, with a maximum of 2s. The user can also specify the wet to dry ratio, meaning the ratio of how loud the dry signal (non-delayed) is to the wet signal (delayed). The user can also control how much feedback (i.e., echo) they want to hear. This was implemented by scaling and feeding the delayed signal back into the delay buffer. This ensured that the delayed signal would be quieter each time it was fed back into the delay line.



[next](./limitations.md)
