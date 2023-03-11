This project was made in MATLAB and its purpose is to recreate a given image with a set of thousands of small images in order to give a "mosaic effect". It has 3 types of image reconstruction and each gives a different result.

A more detailed description of the project can be found below:

The purpose of this project is to create mosaic images. A picture of mosaic type is obtained by replacing the blocks of pixels in an image. reference with small images from a data collection. The replacement of pixel blocks with pieces is done so that the resulting mosaic approximates the reference image as well as possible.

![image](https://user-images.githubusercontent.com/95239028/224484222-14a5809c-03e3-4192-abdd-f9aafbc0fff0.png)

Mosaic image: For the reference image on the left we get the mosaic on the right. The mosaic pieces are chosen from a collection of 1000 images. Each piece represents a flower.

There are 3 functions:

-incarcaPieseMozaic: The function "incarcaPieseMozaic.m" displays the first 100 pieces of the mosaic read from the chosen directory in a figure.

-calculeazaPieseMozaic: In order to obtain a mosaic that is as similar as the reference image we will build a mosaic of modified dimensions. The parameter called "numarPieseMozaicOrizontala" (set by default with the value 100) defines the number of horizontal pieces of the mosaic. Based on this parameter, the initial dimensions of the reference image and the dimensions of the pieces (30 × 40 pixels) we can determine the size of the mosaic we will build. In the construction of the mosaic we will use the reference image properly resized.

-adaugaPieseMozaic: The pieces are added in order to obtain a mosaic as similar as the resized reference image. In this implementation, the parts are added from left to right and from top to bottom Each piece is selected based on a criterion. In this project there are 3 possible criteria:

Random(aleator):using this criterion, the pixel blocks in the resized reference image are replaced by randomly selected parts. Consequently, the mosaic obtained will not resemble the reference image. This criterion is already implemented in Matlab but works only for color images (grayscale images do not work).

Based on the euclidean distance between average colors(pe baza distantei euclidiene dintre culorile medii): using this criterion, the pixel blocks in the resized reference image are replaced with pieces chosen so that the average color of the piece is as close as possible (in the sense of the euclidean distance) to the average color of the block.

Based on the euclidean distance of all colors(pe baza distantei euclidiene dintre toate culorile ): using this criterion, the pixel blocks in the resized reference image are replaced with pieces chosen so that the sum of the euclidean distances between all the colors of the pixels of a piece and the pixels in the corresponding block is as small as possible.

!!It is necessary to unzip the "data" file and to put all the matlab functions, along with the mosaic pieces in a single folder.
