import processing.video.*;
Movie myMovie;

void setup()
{
  frameRate(60);
  size(800,600);
  myMovie = new Movie(this, "./ball.mp4");
  myMovie.loop();
}

void draw()
{
  background(0);
  image(myMovie,0, 0);
  
   if (key == 'A' || key == 'a')
   {
    myMovie.pause();
   }
   if (key == 's' || key == 'S')
   {
    myMovie.play(); 
   }
}
// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}