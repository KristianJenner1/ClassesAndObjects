/**
* @description tracks the position of a user in a 5x5 grid as x and y coordinates. 
* The coordinates are index origin 0. The default position is the top left,
* but the user can specify the position in the constructor.
*/
public with sharing class Grid 
{
    // holds the x coordinate within the 5x5 grid
    public Integer x
    {
        get { return x; }
        set 
        { 
            if (value < 0) 
            {
                x = 0;
            } 
            else if (value > 4)
            {
                x = 4;
            }
            else
            {
                x = value;
            }
        }
    }

    // holds the y coordinate within the 5x5 grid
    public Integer y
    {
        get { return y; }
        set 
        { 
            if (value < 0) 
            {
                y = 0;
            } 
            else if (value > 4)
            {
                y = 4;
            }
            else
            {
                y = value;
            }
        }
    }

    // no-arguent constructor, x,y = (0,0) 
    public Grid() 
    {
        This.x = 0;
        This.y = 0;
    }
    
    // constructor, specify initial x,y coordinates
    public Grid(Integer x, Integer y)
    {
        This.x = x;
        This.y = y;
    }

    // move position (x-1,y), if within 5x5 grid
    public void left()
    {
        if (x > 0)
        {
            x--;
        }
    }
    
    // move position (x+1,y), if within 5x5 grid
    public void right()
    {
        if (x < 4)
        {
            x++;
        }
    }

    // move position (x,y-1), if within 5x5 grid
    public void up()
    {
        if (y > 0)
        {
            y--;
        }
    }

    // move position (x,y+1), if within 5x5 grid
    public void down()
    {
        if (y < 4)
        {
            y++;
        }
    }

    // output the grid to the debug log. - character represents empty space 
    // and the * character represents the current position
    public void printGrid()
    {
        for (Integer i = 0; i < 5; i++)
        {
            // sting to hold each row in grid
            List<String> row = new List<String>();
            
            for (Integer j = 0; j < 5; j++)
            {
                if (x == j && y == i)
                {
                    row.add('*');
                }   
                else
                {
                    row.add('-');
                }     
            }
            system.debug(string.join(row,''));
        }
    }

}
