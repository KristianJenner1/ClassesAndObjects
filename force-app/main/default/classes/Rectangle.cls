/**
* @description encapsulates the height and width of a rectangle, which is immutable. 
* It should only be possible to construct a rectangle by supplying a height and width (positive real numbers) 
* - no defaults are provided
*/
public with sharing class Rectangle 
{
    public Decimal height;
    public Decimal width;
  
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

    private Decimal calculateSurfaceArea()
    {   
        Decimal area = this.height * this.width;
        return area;
    }

    private Boolean isSquare()
    {
        Boolean square = false;

        if (this.height == this.width)
        {
            square = true;
        }

        return square;
    }

    public class RectangleException extends Exception {} 

}
