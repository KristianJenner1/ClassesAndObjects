/**
* @description encapsulates a circle, which is immutable. 
* It is be possible to construct a circle by providing either it’s radius 
* or a string representation of its diameter
*/

public with sharing class Circle 
{
    // constants
    private Static final Decimal PI = 3.14159; // PI to 5dp
    
    // instance variables
    public Decimal radius;

    // constructors
    public Circle(Decimal radius) 
    {
        if (radius > 0)
        {
            this.radius = radius;
        }
        else
        {
            Throw new CircleException('The radius must be > 0');
        }
    }

    public Circle(String diameter) 
    {   
        if (0.5 * decimal.valueOf(diameter)> 0)
        {
            this.radius = 0.5 * decimal.valueOf(diameter);
        }
        else
        {
            Throw new CircleException('The diameter must be > 0');
        }    
    }

    // public method to calculate circumference
    public Decimal calculateCircumference()
    {
        Decimal circumference = (PI * this.radius * 2).setScale(5);
        return circumference;
    }

    // public method to calculate surface area
    public Double calculateSurfaceArea()
    {
        Double surfaceArea = (PI * Math.pow(Double.valueOf(this.radius), 2)).setScale(5);
        return surfaceArea;
    }

    // inner class for custom exception
    public class CircleException extends Exception {}

}
