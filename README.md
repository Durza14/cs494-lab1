# Spirograph Lab
For lab 1, I chose the spirograph lab, so depending on input, the program will output an interesting spirograph.
## Compilation
To compile, simply run the makefile using make; you can use make clean if you want to get rid of all pdfs and jpgs first.
The makefile will automatically generate the 5 pdfs and jpgs corresponding to the input files provided.
Please note C++17 is required.

## Running the program
A standard usage of the program is `./spiro int double < input1.txt | jgraph > test1.ps`, where the int is the number of teeth in the outer gear, and the double is the radius of the outer gear. If necessary, these values can be changed in the makefile to change the outputted pdfs and jpgs. The output is then taken and put into jgraph, which produces a PostScript file.

For example, the first input file contains:
```
1 0 0 45 0.0 4.0
0 1 0 45 0.5 4.0
0 0 1 45 1.0 4.0
```
The numbers correspond to red, blue, green, number of teeth on wheel, starting position of wheel, and hole distance from the center of the wheel respectively.

With this input, as well as the outer gear input of 96 teeth and a radius of 10.0, we find this spirograph to be produced.

![spiro1](https://github.com/user-attachments/assets/4b10fbae-ad63-43a0-a558-8a615e43dd6c)

The jpg is somewhat low quality, but the lines can be better seen in the pdf when the program is run.

However, if we double the number of outer gear teeth and radius, we get this instead:

<img width="251" height="208" alt="image" src="https://github.com/user-attachments/assets/07bd2afd-4f56-4d57-882f-24094c385c46" />


Though it looks similar in shape and colors, change is immediately noticeable.
Changing the inner wheel input results in even more drastic changes, and you can pretty much create whatever spirograph you want if you edit the input files, but I'll leave that for you to discover in the other 4 input files included.
