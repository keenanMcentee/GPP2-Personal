// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/
import java.util.*;
Random generator;

/*
Name: Keenan McEntee
SID: C00201892
Subject: GPP
Summary: Added random generator to generate random size of circles.
*/

void setup() {
  size(2000,2000);
  background(0);
  smooth();
  generator = new Random();
  frameRate(4);

}

void draw() {
  //create an alpha blended background
  fill(0,1);
  rect(0,0,width,height);

  //get 3 gaussian random numbers w/ mean of 0 and standard deviation of 1.0
  float r = (float) generator.nextGaussian();
  float g = (float) generator.nextGaussian();
  float b = (float) generator.nextGaussian();

  //define standard deviation and mean
  float sd = 50; float mean = 255;
  //scale by standard deviation and mean
  //also constrain to between (0,255) since we are dealing with color
  r = constrain((r * sd) + mean,0,255);

  //repeat for g & b
  sd = 20; mean = 200;
  g = constrain((g * sd) + mean,0,255);
  sd = 50; mean = 0;
  b = constrain((b * sd) + mean,0,255);

  //get more gaussian numbers, this time for location
  float xloc = (float) generator.nextGaussian();
  float yloc = (float) generator.nextGaussian();
  sd = width/10;
  mean = width/2;
  xloc = ( xloc * sd ) + mean;
  yloc = ( yloc * sd ) + mean;
  
  //draw an ellipse with gaussian generated color and location
  noStroke();
  fill(r,g,b);
  float size = (float)generator.nextGaussian() * sd;
  ellipse(xloc,yloc,size ,size);
}