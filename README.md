# GoFont
Proof of Concept - Is it possible to generate a font via code

## Babysteps - How does one create a simple font?
###1. Learn about font fundamentals
![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/on-web-typography.jpg)
It's important to know how typography is structured before you can actually start making your own. Personally, I found that 'On Web Typography' - Written by Jason Santa Maria was a good starting point. It goes into detail, but it can definitely get you started.
However, I've written down the most important things you should know to start a font below.

* **Baseline:** Where all the letters sit. This is basicly the bottom of all the letters.
* **Overhang:** Letters like 'O' or 'B' can dip below the actual bottom of all other letters. (baseline)
* **X-height:** A line used to define the height of all lowercase letters.
* **Cap Height:** A line used to define the height of all uppercase letters.
* **Ascender height:** Letters like 'k' or 'h' have an ascender that ascends the normal x-height. The height of these ascenders are called 'ascender height'.
* **Descender height:** Letters like 'p' or 'q' have a descender that descends lower than baseline. The height of these descenders are called 'descender height'.

###2. Start by hand
Whenever designing a font, one should start by drawing/designing a few letters to get a feel of what the font should look like.
Often called 'control characters', you would start designing the latin characters:

'n' and 'o' - lowercase letters.
'H' and 'O' - uppercase letters.

Consequently, you would add more letters to those to form the word: _adhesion_. This word is often use to get a feel of how the typeface should be proportioned.

![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/handdrawings.jpg)

###3. Digitize your drawings
Outline your drawed letters and fill the insides with a black marker. Take a picture with your smartphone and upload it to your computer.

###4. Choose your software
Unfortunately, creating typefaces seems to be a Mac business. Most people recommend software like [Glyps](www.glyphsapp.com) or [RoboFont](http://doc.robofont.com/). I cannot use these apps, so I will need to find a Windows alternative. FontForge seems to be a common program to use, although be it with a learning curve.

###5. Use the software
There seems to be some documentation online. However, the program will require some training. Luckily for us, FontForge is an open-source project, wich means there are alot of people making sure people can use the software as efficient as possible.
I will be following this guide in order to make my first typeface - [GitHub FontForge guide](http://designwithfontforge.com/en-US/Configuring_FontForge.html)
