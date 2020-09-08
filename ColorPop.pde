PImage img;
String saveLocation="K:/op2.jpg";//put the address where you wanna save the processed image
void setup()
{
  //put the images width and height in size function(check in properties of the particular image)
  size(1024,768);
  img=loadImage("img.jpg");//put name of the image you want to edit. 
  img.loadPixels();
  loadPixels();
  
}
float thres=0;
void draw()
{
    for(int y=0;y<img.height;y++)
    {
      for(int x=0;x<img.width;x++)
      {
        int index=(y*img.width)+x;
          float r=red(img.pixels[index]);
          float g=green(img.pixels[index]);
          float b=blue(img.pixels[index]);
          if(diff(img.pixels[index],img.pixels[(mouseY*img.width)+mouseX])<thres)
          pixels[index]=color(r,g,b);
          else
          pixels[index]=color(brightness(img.pixels[index]));
          //float b=brightness(img.pixels[index]);
          //pixels[index]=color(b);
      }
    }
  updatePixels();
  fill(0);
  noStroke();
  text(thres,10,10);
}
float diff(color a,color b)
{
  return dist(red(a),green(a),blue(a),red(b),green(b),blue(b));
}
void keyPressed()
{
  if(keyCode==UP)
  thres++;
  if(keyCode==DOWN)
  thres--;
  if(key=='s')
  saveFrame(saveLocation);
}
