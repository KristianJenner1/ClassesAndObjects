/**
* @description  classes to model an author and the books that they have written.
*/
public with sharing class Author 
{
    public final String firstName;
    public final String lastName;
    public final String emailAddress;
    public Map<String,Book> draftBooksbyTitle;
    public Map<Date,List<Book>> publishedBooksbyDate;

    public Author(String firstName, String lastName, String emailAddress)
    {
        This.firstName = firstName;
        This.lastName = lastName;
        This.emailAddress = emailAddress;
        This.draftBooksbyTitle = new Map<String,Book>();
        This.publishedBooksbyDate = new Map<Date,List<Book>>();
    }

    // publish a book based on its title, locates and removes the book from the 
    // draft collection execute the publish method on the book add the book to 
    // the published collection, using it’s published date as the key
    public void publishBook(String title)
    {
        for (Book b : This.draftBooksbyTitle.values())
        {
            if (b.title == title)
            {
                // publish the book
                b.publish();

                // remove the book from the Author's drafts
                draftBooksbyTitle.remove(title);

                // add the book to the author's published books
                List<Book> publishedBooksOnDate = publishedBooksbyDate.get(b.publishedDate);
                if (null == publishedBooksOnDate)
                {
                    publishedBooksbyDate.put(b.publishedDate,new List<Book>{b});
                }
                else
                {
                    publishedBooksOnDate.add(b);
                }
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
                if (This.status != 'Published') 
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
                if (This.status != 'Published') 
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
                if (This.status != 'Published') 
                {
                    genre = value;
                } 
            }
        }
        public String status;
        public Date publishedDate;

        public Book(Author author, String title, Integer numberOfPages, String genre)
        {
            This.title = title;
            This.numberOfPages = numberOfPages;
            This.genre = genre;
            This.status = 'Draft';
            // add the book to the author's drafts
            author.draftBooksbyTitle.put(This.title,This);
        }

        // invoking this method changes the state to Published and sets the published 
        // date to today’s date
        public void publish()
        {
            This.status = 'published';
            This.publishedDate = Date.Today();
        }

    }
}
