%Driver program for Blob Detection
clear
tic 
BlobDetector1('../data/butterfly.jpg',1,1.8,10,0.02);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 1st image.\n");


tic 
BlobDetector1('../data/einstein.jpg',1,1.8,10,0.01);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 2nd image.\n");


tic 
BlobDetector1('../data/fishes.jpg',1,1.8,10,0.01);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 3rd image.\n");


tic 
BlobDetector1('../data/sunflowers.jpg',1,1.8,10,0.02);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 4th image.\n");


tic 
BlobDetector1('../data/whitewalker.jpg',1,1.8,10,0.03);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 5th image.\n");

tic 
BlobDetector1('../data/lion.jpg',1,1.8,10,0.03);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 6th image.\n");

tic 
BlobDetector1('../data/dwight.jpeg',1,1.8,10,0.015);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 7th image.\n");

tic 
BlobDetector1('../data/legobatman.jpg',1,1.8,10,0.015);
fprintf("Implementation 1 takes: " + num2str(toc) + " for the 8th image.\n");





tic 
BlobDetector2('../data/butterfly.jpg',1,1.8,10,0.02);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 1st image.\n");

tic 
BlobDetector2('../data/einstein.jpg',1,1.8,10,0.01);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 2nd image.\n");

tic 
BlobDetector2('../data/fishes.jpg',1,1.8,10,0.01);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 3rd image.\n");

tic 
BlobDetector2('../data/sunflowers.jpg',1,1.8,10,0.02);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 4th image.\n");

tic 
BlobDetector2('../data/whitewalker.jpg',1,1.8,10,0.03);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 5th image.\n");

tic 
BlobDetector2('../data/lion.jpg',1,1.8,10,0.03);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 6th image.\n");

tic 
BlobDetector2('../data/dwight.jpeg',1,1.8,10,0.015);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 7th image.\n");

tic 
BlobDetector2('../data/legobatman.jpg',1,1.8,10,0.015);
fprintf("Implementation 2 takes: " + num2str(toc) + " for the 8th image.\n");

