import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
Box2DProcessing box2d;
Player player;
StaticObject ground;
StaticObject obstacle;
Goal goal;
void setup()
{
  size(800,600);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  player = new Player(100,600);
  ground = new StaticObject(0,800, width * 2, height);
  obstacle = new StaticObject(400,450,70,110);
  
  goal = new Goal(new PVector(700,475));
}

void draw()
{
  Update();
  Display();
}

void Update()
{
  player.update();
  player.checkIfInGoal(goal.getPosition(), goal.getSize());
  box2d.step();
}
void Display()
{
  background(50);
  player.display();
  ground.display();
  obstacle.display();
  goal.display();
}