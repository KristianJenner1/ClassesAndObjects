/**
* @description tracks the position of a user in a grid as x and y coordinates. 
* The coordinates are index origin 0. The default position is the top left,
* but the user can specify the position in the constructor.
*/
public with sharing class Grid 
{
    // constants
    public static final Integer GRID_SIZE = 5; // size of the square grid

    // holds the x coordinate within the grid
    public Integer x
    {
        get { return x; }
        set 
        { 
            x = Grid.constrainOrdinate(value);
        }
    }

    // holds the y coordinate within the grid
    public Integer y
    {
        get { return y; }
        set 
        { 
            y = Grid.constrainOrdinate(value);
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

    // move position (x-1,y)
    public void left()
    {
        x--;
    }
    
    // move position (x+1,y)
    public void right()
    {
        x++;
    }

    // move position (x,y-1)
    public void up()
    {
        y--;
    }

    // move position (x,y+1)
    public void down()
    {
        y++;
    }

    // output the grid to the debug log. - character represents empty space 
    // and the * character represents the current position
    public void printGrid()
    {
        for (Integer i = 0; i < GRID_SIZE; i++)
        {
            // sting to hold each row in grid
            List<String> row = new List<String>();
            
            for (Integer j = 0; j < GRID_SIZE; j++)
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

    // method to constrain the supplied ordinate within the grid of size GRID_SIZE
    private static Integer constrainOrdinate(Integer ordinate)
    {
        if (ordinate < 0) 
        {
            return 0;
        } 
        else if (ordinate > (GRID_SIZE - 1))
        {
            return (GRID_SIZE - 1);
        }
        else
        {
            return ordinate;
        }
    }

}
