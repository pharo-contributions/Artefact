# Tutorial: learn how to hunt a white rabbit

In this tutorial, we will create a clock, which is basically a circle and two arrows. This element will be drawed depending on the provided time and properties (size, colors, thickness).


## Create the clock

First create the class of your element:

```Smalltalk
PDFComposite subclass: #PDFClockElement
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Artefact-Tutorial'
```

Don't forget to comment your class ;-).

As you can see, we create an instance variable that will contain the *time* to display.

Then, create or generate accessors methods to this variable.

The only two required method by Artefact is:
- #getSubElementsWith: aGenerator styleSheet: aStyleSheet 

This method must return a collection of PDFElements (basics or composites).

- #defaultStyle

This method must return a symbol that associate the composite element with a style definition. However it's not necessary to define this style in your document, Artefact will use the default style instead.

Define the default style:

```Smalltalk
defaultStyle
    ^ #clock
```

Then define the method that will draw the clock.
At the beginning, this method will just return the circle:

```Smalltalk
getSubElementsWith: aGenerator styleSheet: aStyleSheet
	^ { PDFCircleElement from: self from to: self to }
```
The circle will be drawed depending on this composite position and size. We are using *#from:to:* for the circle instead of *#center:radius:* because it's easier for us to create a clock using the boundary box of the circle.

Now we will create the clock hands with two **PDFArrowElements** and a filled little circle in the middle:

```Smalltalk
getSubElementsWith: aGenerator styleSheet: aStyleSheet
	| hourAngle minuteAngle |
	hourAngle := Float pi / 2 - (time hour12 * 2 * Float pi / 12).
	minuteAngle := Float pi / 2 - (time minute * 2 * Float pi / 60).

	^ {(PDFCircleElement from: self from to: self to).
    	(PDFCircleElement center: self center radius: self dimension x * 0.05).
		(PDFArrowElement from: self center angle: hourAngle length: dimension x * 0.25).
		(PDFArrowElement from: self center angle: minuteAngle length: dimension x * 0.45)}
```

Don't be afraid about the two angle calculus, it's just to convert hours and minutes to radian angles.

At this time, your **PDFClockElement** is already usable and fully integrated into Artefact.

We can insert it into a PDF document and export it:

```Smalltalk
PDFDocument new
	add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current));
    exportTo: 'clockTutorialStep1.pdf' asFileReference writeStream
```

## Make the clock personalizable

Your clock is already personnalizable independently of other elements because you previously define its style as #clock.

```Smalltalk
| doc |
doc := PDFDocument new.
doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
doc exportTo: 'clockTutorialStep2.pdf' asFileReference writeStream
```
You can also personnalize the subelements of your clock by their own default style.

```Smalltalk
| doc |
doc := PDFDocument new.
doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
doc styleSheet > #clock > #arrow drawColor: (PDFColor r:0 g: 45 b:200).
doc exportTo: 'clockTutorialStep3.pdf' asFileReference writeStream
```

At this time, you don't have defined specific styles for sub elements of your clock. Consequently, you will not be able to personalize each element with different styles (so you cannot have hands of differents colors for example).

To increase personalization possibilities, you should define specific styles for sub elements you reuse.

```Smalltalk
getSubElementsWith: aGenerator styleSheet: aStyleSheet
	| hourAngle minuteAngle |
	hourAngle := Float pi / 2 - (time hour12 * 2 * Float pi / 12).
	minuteAngle := Float pi / 2 - (time minute * 2 * Float pi / 60).
	^ {(PDFCircleElement from: self from to: self to).
	(PDFCircleElement center: self center radius: self dimension min * 0.05).
	((PDFArrowElement from: self center angle: hourAngle length: dimension min * 0.25) style: #hourHand).
	((PDFArrowElement from: self center angle: minuteAngle length: dimension min * 0.45) style: #minuteHand)}
```

As you can see, we just send #style: on each subelement that we want to define a specific style.

Now, we can personalize each hand like that:

```Smalltalk
| doc |
doc := PDFDocument new.
doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
doc styleSheet > #clock > #hourHand drawColor: (PDFColor r:0 g: 45 b:200).
		doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r:0 g: 200 b:45).
doc exportTo: 'clockTutorialStep4.pdf' asFileReference writeStream
```
As you can see, the clock hands have different colors.

Moreover, like any element in Artefact, you can specify a style on an instance of a PDFClockElement that allow you to reuse and adapt each clock:

```Smalltalk
| doc |
doc := PDFDocument new.
doc add:
    (PDFPage new
        add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current);
        add: ((PDFClockElement from: 12 cm @ 2 cm to: 20 cm @ 10 cm)
                time: Time current;
                style: #apocalypseClock)).
doc styleSheet > #clock
    drawColor: (PDFColor r: 180 g: 24 b: 24);
    fillColor: (PDFColor r: 230 g: 230 b: 10).
doc styleSheet > #clock > #hourHand drawColor: (PDFColor r: 0 g: 45 b: 200).
doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r: 0 g: 200 b: 45).
doc styleSheet > #apocalypseClock
    fillColor: (PDFColor r: 244 g: 221 b: 25);
    thickness: 2 mm;
    roundCap: true.
doc styleSheet > #apocalypseClock > #minuteHand
    drawColor: (PDFColor r: 240 g: 6 b: 7);
    thickness: 1 mm.
doc exportTo: 'clockTutorialStep5.pdf' asFileReference writeStream
```
That's all Folks!!!