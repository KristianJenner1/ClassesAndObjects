/**
* @description encapsulates the height and width of a rectangle, which is immutable. 
* It should only be possible to construct a rectangle by supplying a height and width (positive real numbers) 
* - no defaults are provided
*/
public with sharing class Rectangle 
{
    public final Decimal height;
    public final Decimal width;
    public final Decimal surfaceArea;
    public final Boolean isSquare;
  
    public Rectangle(Decimal height, Decimal width) 
    {
        if (height > 0 && width > 0)
        {
            This.height = height;
            This.width = width;
            This.surfaceArea = This.calculateSurfaceArea();
            This.isSquare = This.isSquare();
        }
        else 
        {
            Throw new RectangleException('A rectangle should have a positive width and height');
        }
    }

    private Decimal calculateSurfaceArea()
    {   
        Decimal area = This.height * This.width;
        return area;
    }

    private Boolean isSquare()
    {
        Boolean square = false;

        if (This.height == This.width)
        {
            square = true;
        }

        return square;
    }

    public class RectangleException extends Exception {} 

}
