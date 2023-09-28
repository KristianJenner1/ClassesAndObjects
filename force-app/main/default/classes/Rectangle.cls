/**
* @description encapsulates the height and width of a rectangle. 
* It should only be possible to construct a rectangle by supplying a height and width (positive real numbers) 
* - no defaults are provided
*/
public with sharing class Rectangle 
{
    // instance variables
    public Decimal height;
    public Decimal width;
  
    // constructor
    public Rectangle(Decimal height, Decimal width) 
    {
        if (height > 0 && width > 0)
        {
            this.height = height;
            this.width = width;
        }
        else 
        {
            Throw new RectangleException('A rectangle should have a positive width and height');
        }
    }

    // public method to calculate the area of the rectangle
    public Decimal calculateSurfaceArea()
    {   
        Decimal area = this.height * this.width;
        return area;
    }

    // public method to return true if the rectangle is a square
    public Boolean isSquare()
    {
        Boolean square = false;

        if (this.height == this.width)
        {
            square = true;
        }

        return square;
    }

    // inner class to handle exceptions
    private class RectangleException extends Exception {} 

}
