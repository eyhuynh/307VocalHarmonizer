
# MUMT 307 Vocal Harmonizer

This vocal harmonizer was created using Max/MSP and MATLAB and was submitted as final project for MUMT 307: Music and Audio Computing 2. Presented by Camilo Gómez and Erica Huynh a.k.a Huynez & Co.

## Introduction
> discuss motivation and goals

## The Interface
> screenshot of the entire interface on Max/MSP
> remember to comment the patch before uploading image

## Pre-processing
> Camilo's zero-crossing vs short-term energy detection
> why do we have to do this?
> include the citations of books and online resources
> include code and graphs

### Comparing VST Plugin to Max External
> describe thought process in choices

## Pitch-shifting
> on Max/MSP
> decided to have one upper and lower harmony and explain why
> wanted it to be user friendly, so that anyone can use it without requiring music theory background

### gizmo~: Pitch Shift
> how it works, benefits, cons
> include image

### retune~: Pitch Detection
> how it works, benefits, cons
> how it enhances
> explain how pitch shift calculations are made... user friendly
> include images

## Formant Analyses
> god bless us
> #Pray4Huynez2k18

## Effects
> cool stuff
> general image of subpatch

### Delay
> explain parameters
> tapin~ and tapout~

### Feedback
> how it was implemented

## Limitations and Outlook
> what we would have done differently
> limitations in general
> is it usable to the public?

## References
Cycling ‘74. (2018). Max 7.3.5.

Lerch, A. (2012). Instantaneous features. In <i>An Introduction to Audio Content Analysis: Applications in Signal Processing and Music Informatics </i>(31–70). Hoboken, New Jersey: John Wiley & Sons Inc.

MathWorks. (2018). MATLAB.

Steinberg Media Technologies GmbH. (2016). Audio Systems Toolbox  - A Matlab Toolbox.




### Header 3

```js
// Javascript code with syntax highlighting.
var fun = function lang(l) {
  dateformat.i18n = require('./lang/' + l)
  return true;
}
```

```ruby
# Ruby code with syntax highlighting
GitHubPages::Dependencies.gems.each do |gem, version|
  s.add_dependency(gem, "= #{version}")
end
```

#### Header 4

*   This is an unordered list following a header.
*   This is an unordered list following a header.
*   This is an unordered list following a header.

##### Header 5

1.  This is an ordered list following a header.
2.  This is an ordered list following a header.
3.  This is an ordered list following a header.

###### Header 6

| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://assets-cdn.github.com/images/icons/emoji/octocat.png)

### Large image

![Branching](https://guides.github.com/activities/hello-world/branching.png)


### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
