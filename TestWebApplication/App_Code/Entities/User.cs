namespace Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public System.DateTime LastLoginDate { get; set; }

        public User(int id, string name, string password, System.DateTime lastloginDate)
        {
            Id = id;
            Name = name;
            Password = password;
            LastLoginDate = lastloginDate;
        }

        public User(string name, string password, System.DateTime lastloginDate)
        {
            Name = name;
            Password = password;
            LastLoginDate = lastloginDate;
        }
    }
}