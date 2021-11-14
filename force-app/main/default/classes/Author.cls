/**
* @description  classes to model an author and the books that they have written.
*/
public with sharing class Author 
{
    // constants
    public static final String PUBLISHED_STATUS = 'Published';

    public String firstName
    {
        get { return firstName; }
        set 
        { 
            if (null != firstName) 
            {
                firstName = value;
            }
        }
    }
    public String lastName
    {
        get { return lastName; }
        set 
        { 
            if (null != lastName) 
            {
                lastName = value;
            }
        }
    }
    public String emailAddress;
    public Map<String,Book> draftBooksbyTitle;
    public Map<Date,List<Book>> publishedBooksbyDate;

    public Author(String firstName, String lastName, String emailAddress)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.draftBooksbyTitle = new Map<String,Book>();
        this.publishedBooksbyDate = new Map<Date,List<Book>>();
    }

    // publish a book based on its title, locates and removes the book from the 
    // draft collection execute the publish method on the book add the book to 
    // the published collection, using it’s published date as the key
    public void publishBook(String title)
    {
        Book draftBook = this.draftBooksByTitle.get(title);
       
        if (null != draftBook)
        {
            // publish the book
            draftBook.publish();

            // remove the book from the Author's drafts
            draftBooksbyTitle.remove(title);

            // add the book to the author's published books
            List<Book> publishedBooksOnDate = publishedBooksbyDate.get(draftBook.publishedDate);
            if (null == publishedBooksOnDate)
            {
                publishedBooksbyDate.put(draftBook.publishedDate,new List<Book>{draftBook});
            }
            else
            {
                publishedBooksOnDate.add(draftBook);
            }
        }

    }

    // inner class for book
    public class Book
    {
        public String title
        {
            get { return title; }
            set 
            { 
                if (this.status != 'Published') 
                {
                    title = value;
                } 
            }
        }
        public Integer numberOfPages
        {
            get { return numberOfPages; }
            set 
            { 
                if (this.isPublished()) 
                {
                    numberOfPages = value;
                } 
            }
        }
        public String genre
        {
            get { return genre; }
            set 
            { 
                if (this.isPublished()) 
                {
                    genre = value;
                } 
            }
        }
        public String status;
        public Date publishedDate;

        public Book(Author author, String title, Integer numberOfPages, String genre)
        {
            this.title = title;
            this.numberOfPages = numberOfPages;
            this.genre = genre;
            this.status = 'Draft';
            // add the book to the author's drafts
            author.draftBooksbyTitle.put(this.title,this);
        }

        // invoking this method changes the state to Published and sets the published 
        // date to today’s date
        public void publish()
        {
            this.status = PUBLISHED_STATUS;
            this.publishedDate = Date.Today();
        }

        public boolean isPublished()
        {
            boolean published = false;
            
            if(this.status == PUBLISHED_STATUS)
            {
                published = true;
            }

            return published;
        }

    }
}
