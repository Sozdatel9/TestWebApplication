namespace Entities
{
    public class Task
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Added { get; set; }
        public string DateOfComplete { get; set; }
        public string Completed { get; set; }

        public Task(int id, string title, string content, string added, string dateOfComplete, string completed)
        {
            Id = id;
            Title = title;
            Content = content;
            Added = added;
            DateOfComplete = dateOfComplete;
            Completed = completed;
        }

        public Task(string title, string content, string added, string dateOfComplete, string completed)
        {
            Title = title;
            Content = content;
            Added = added;
            DateOfComplete = dateOfComplete;
            Completed = completed;
        }

        public Task(string title, string content, string added, string completed)
        {
            Title = title;
            Content = content;
            Added = added;
            Completed = completed;
        }
    }
}