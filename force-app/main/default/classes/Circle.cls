/**
* @description encapsulates a circle, which is immutable. 
* It is be possible to construct a circle by providing either it’s radius 
* or a string representation of its diameter
*/
public with sharing class Circle 
{
    private Static final Decimal pi = 3.14159; // PI to 5dp
    public final Decimal radius;
    public final Decimal circumference;
    public final Double surfaceArea;

    public Circle(Decimal radius) 
    {
        if (radius > 0)
        {
            This.radius = radius;
            This.circumference = This.calculateCircumference();
            This.surfaceArea = This.calculateSurfaceArea();
        }
        else
        {
            Throw new CirclePositiveRadiusException('The radius must be > 0');
        }
    }

    public Circle(String diameter) 
    {   
        if (0.5 * decimal.valueOf(diameter)> 0)
        {
            This.radius = 0.5 * decimal.valueOf(diameter);
            This.circumference = This.calculateCircumference();
            This.surfaceArea = This.calculateSurfaceArea();
        }
        else
        {
            Throw new CirclePositiveRadiusException('The diameter must be > 0');
        }    
    }

    public Decimal calculateCircumference()
    {
        Decimal circumference = (pi * This.radius * 2).setScale(5);
        return circumference;
    }

    public Double calculateSurfaceArea()
    {
        Double surfaceArea = (pi * Math.pow(Double.valueOf(This.radius), 2)).setScale(5);
        return surfaceArea;
    }

    public class CirclePositiveRadiusException extends Exception {}

}
