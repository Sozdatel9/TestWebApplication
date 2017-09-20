using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using Entities;
using System;
using System.Globalization;
using System.IO;
using System.Web;

public static class ConnectionClass
{
    private static SqlConnection conn;
    private static SqlConnection conn2;
    private static SqlConnection conn3;
    private static SqlCommand command;
    private static SqlCommand command2;
    private static SqlCommand command3;

    static ConnectionClass()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TestWebApplicationConnectionString"].ToString();
        conn = new SqlConnection(connectionString);
        conn2 = new SqlConnection(connectionString);
        conn3 = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
        command2 = new SqlCommand("", conn2);
        command3 = new SqlCommand("", conn3);
    }

    #region Task

    public static ArrayList GetAllTasks(int userId)
    {   
        ArrayList list = new ArrayList();
        string query = string.Format("SELECT t.TaskId, t.Title, t.Content, t.Added, t.DateOfComplete, t.Completed FROM Tasks t LEFT JOIN UsersAndTasks ut ON ut.TaskId = t.TaskId WHERE ut.UserId =  '{0}'", userId);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string title = reader.GetString(1);
                string content = reader.GetString(2);
                string added = reader.GetSqlDateTime(3).ToString();
                string dateofcomplete = reader.GetSqlDateTime(4).ToString();
                string CompletedType = Convert.ToInt32(reader.GetBoolean(5)).ToString();
                Task task = new Task(id, title, content, added, dateofcomplete, CompletedType);
                list.Add(task);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }

    public static void AddTask(Task task, int userId)
    {  
        string query = string.Format(
            @"INSERT INTO Tasks VALUES ('{0}', '{1}', '{2}', NULL, '0')",
            task.Title, task.Content, System.DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss"));
        string query2 = string.Format(
            @"INSERT INTO dbo.UsersAndTasks (UserId, TaskId) VALUES({0},scope_identity())", userId);
        command.CommandText = query;    
        try
        {
            conn.Open();
            command.ExecuteNonQuery();
            command.CommandText = query2;
            command.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
    }

    public static bool CompleteTask(int task_Id)
    {
        bool result = false;
        string query = string.Format("UPDATE Tasks SET DateOfComplete = '{0}', Completed = '1' WHERE TaskId = '{1}'", System.DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss"), task_Id);
        command.CommandText = query;  
        try
        {
            conn.Open();
            command.ExecuteNonQuery();
            result = true;
        }
        finally
        {
            conn.Close();
            conn2.Close();
            command.Parameters.Clear();
            query = string.Format("SELECT Title, Content, ut.UserId FROM TestWebApplication.dbo.Tasks t LEFT JOIN UsersAndTasks ut ON ut.TaskId = t.TaskId WHERE t.TaskId = '{0}'", task_Id.ToString());
            command2.CommandText = query;
            conn2.Open();
            string[] a = new string[2]; 
           
            SqlDataReader r = command2.ExecuteReader();
            int uId = 0;
            while (r.Read())
            {   
                a[0] = r.GetString(0);
                a[1] = r.GetString(1);
                uId = r.GetInt32(2);
            }
            ConnectionClass.AddLog("Отметка о выполнении задачи", uId, "Название: " + a[0] + ", описание: " + a[1]);
            conn2.Close();
            command2.Parameters.Clear();
        }
        return result;
    }

    public static bool UnCompleteTask(int task_Id)
    {
        bool result = false;
        string query = string.Format("UPDATE Tasks SET DateOfComplete = NULL, Completed = '0' WHERE TaskId = '{0}'", task_Id);
        command.CommandText = query;
        try
        {
            conn.Open();
            command.ExecuteNonQuery();
            result = true;
        }
        finally
        {
            conn.Close();
            conn2.Close();
            command.Parameters.Clear();
            query = string.Format("SELECT Title, Content, ut.UserId FROM TestWebApplication.dbo.Tasks t LEFT JOIN UsersAndTasks ut ON ut.TaskId = t.TaskId WHERE t.TaskId = '{0}'", task_Id.ToString());
            command2.CommandText = query;
            conn2.Open();
            string[] a = new string[2];

            SqlDataReader r = command2.ExecuteReader();
            int uId = 0;
            while (r.Read())
            {
                a[0] = r.GetString(0);
                a[1] = r.GetString(1);
                uId = r.GetInt32(2);
            }
            ConnectionClass.AddLog("Снятие отметки о выполнении задачи", uId, "Название: " + a[0] + ",описание: " + a[1]);
            conn2.Close();
            command2.Parameters.Clear();
        }
        return result;
    }


    #endregion

    #region Users
    public static User LoginUser(string name, string password)
    {   
        //Проверяем, существует ли пользователь
        string query = string.Format("SELECT COUNT(*) FROM TestWebApplication.dbo.users WHERE Name = '{0}'", name);
        command.CommandText = query;
        try
        {
            conn.Open();
            int amountOfUsers = (int)command.ExecuteScalar();

            if (amountOfUsers == 1)
            {
                //Пользователь существует, проверяем правильность ввода пароля
                query = string.Format("SELECT Pass FROM Users WHERE Name = '{0}'", name);
                command.CommandText = query;
                string dbPassword = command.ExecuteScalar().ToString();

                if (dbPassword == password)
                {
                    //Пароли соответствуют, логин и пароль существует
                    //Считываем соответствующие данные из базы
                    query = string.Format("SELECT UserId FROM Users WHERE Name = '{0}'", name);
                    command.CommandText = query;
                    int userId = Convert.ToInt32(command.ExecuteScalar().ToString());
                    SqlDataReader reader = command.ExecuteReader();
                    User user = null;

                    while (reader.Read())
                    {
                       user = new User(userId, name, password, System.DateTime.Now);
                    } 
                    reader.Close();
                    query = string.Format("UPDATE Users SET LastLoginDate='{0}' WHERE UserId = '{1}'", System.DateTime.Now, user.Id);
                    command.CommandText = query;
                    command.ExecuteNonQuery();

                    //Снимаем блокировку в случае успешной авторизации
                    query = string.Format("DELETE FROM UnsuccessAuth");
                    command.CommandText = query;
                    command.ExecuteNonQuery();
      
                    return user;
                }
                else
                {
                    //Неправильный пароль
                    return null;
                }
            }
            else
            {
                //Пользователь отсутствует
                return null;
            }
        }
        finally
        {
            conn.Close();
        }
    }

    public static string RegisterUser(User user)
    {
        //Проверяем, существует ли пользователь
        string query = string.Format("SELECT COUNT(*) FROM Users WHERE Name = '{0}'", user.Name);
        command.CommandText = query;
        try
        {
            conn.Open();
            int amountOfUsers = (int)command.ExecuteScalar();

            if (amountOfUsers < 1)
            {
                //Пользователь отсутствует, регистрируем его
                query = string.Format("INSERT INTO Users VALUES ('{0}', '{1}', '{2}')", user.Name, user.Password, string.Empty
                                    );
                command.CommandText = query;
                command.ExecuteNonQuery();
                return "Регистрация пользователя успешно завершена !";
            }
            else
            {
                //Пользователь уже существует
                return "Пользователь с таким именем уже зарегистрирован";
            }
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
    }
    #endregion

    #region CheckAuthorizationAttempts

    public static string GetDateOfUnlock()
    {
        string dateTime = "";
        DateTime d1;
        string query = string.Format("SELECT TOP 1 Locked FROM UnsuccessAuth");
        command2.CommandText = query;
        try
        {
            conn2.Open();
            Boolean lockedStatus = false;
            var _lockedStatus = command2.ExecuteScalar();
            if (_lockedStatus != DBNull.Value)
            {
               lockedStatus = Convert.ToBoolean(_lockedStatus);
            }
            else
            {
                lockedStatus = false;
            }
         
            if (lockedStatus)
            {
                query = string.Format("SELECT TOP 1 LastAttemptDate FROM UnsuccessAuth");
                command2.CommandText = query;
                dateTime = (string)command2.ExecuteScalar().ToString();                
                DateTime.TryParse(dateTime, out d1);
                d1 = d1.AddMinutes(15);
                dateTime = d1.ToString();
            }
            else { dateTime = null; }
            return dateTime;
        }
        finally
        {
            conn2.Close();
        }
    }

    public static Boolean UnsuccessfulAttempt()
    {
        Boolean Locked = false;
        //Проверяем, были ли неудачные попытки авторизации раннее
        string query = string.Format("SELECT TOP 1 TotalAttempts FROM UnsuccessAuth");
        command.CommandText = query;
        try
        {
            conn.Open();
            int amountOfAttempts = 0;
            var _attempts = command.ExecuteScalar();
            if (_attempts != DBNull.Value)
            {
                amountOfAttempts = Convert.ToInt32(_attempts);
            }
            else
            {
                amountOfAttempts = 0;
            }
                 
            if (amountOfAttempts == 0)
            {
                //Если попыток входа не было, то создаем соответствующую таблицу
                query = string.Format("INSERT INTO UnsuccessAuth VALUES ('{0}', '{1}', '{2}')", System.DateTime.Now, "1", "0");
                command.CommandText = query;
                command.ExecuteNonQuery();
            }
            else if ((amountOfAttempts > 0) && (amountOfAttempts < 5))
            {
                //Если число попыток входа больше 0, но меньше 6, то просто увеличиваем счетчик попыток
                query = string.Format("UPDATE TOP (1) UnsuccessAuth SET LastAttemptDate = '{0}', TotalAttempts = TotalAttempts + 1", System.DateTime.Now);
                command.CommandText = query;
                command.ExecuteNonQuery();      
            }

            else {
                //Если 6 попыток, то блокируем вход на 15 минут
                query = string.Format("UPDATE TOP (1) UnsuccessAuth SET Locked = '{0}', TotalAttempts = TotalAttempts + 1", "1");
                command.CommandText = query;
                command.ExecuteNonQuery();
                Locked = true;
                string a = GetDateOfUnlock();
                DateTime d;
                DateTime.TryParse(GetDateOfUnlock(), out d);          
                if (DateTime.Now > d) //если попытка неудачная и прошло более 15 минут, то обнуляем информацию о попытках входа
                {
                  query = string.Format("UPDATE TOP (1) UnsuccessAuth SET LastAttemptDate = '{0}', TotalAttempts = '1', Locked = '{1}'", System.DateTime.Now, "0");
                  command.CommandText = query;
                  command.ExecuteNonQuery();
                  Locked = false;
                }  
              }            

         return Locked;
        }
        finally
        {
            conn.Close();
        }
    }
    #endregion

    #region Logging
    public static void AddLog(string parameter, int userId, string otherInfo)
    { //INSERT INTO dbo.Log (UserId, UserName, Period, Actions, OtherInfo) VALUES (3, (SELECT Name from Users WHERE UserId=3), getdate(), 'gjjkljkl', '34tgtr')
        string query = string.Format(
            @"INSERT INTO Log VALUES ('{0}', (SELECT Name FROM Users WHERE UserId='{0}'), '{1}', '{2}', '{3}')", userId, 
            System.DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss"), parameter, otherInfo);
   
        command3.CommandText = query;
        try
        {
            conn3.Open();
            command3.ExecuteNonQuery();
        }
        finally
        {
            conn3.Close();
            command3.Parameters.Clear();
        }
    }

    public static ArrayList GenerateLog()
    {
        ArrayList logsList = new ArrayList();
        string query = string.Format("SELECT LogId, UserId, UserName, Period, Actions, OtherInfo FROM Log WHERE datediff(day, Period, getdate()) = 0 ORDER BY Period DESC");       
        try
        {
            conn3.Open();
            command3.CommandText = query;
            SqlDataReader reader = command3.ExecuteReader();

            while (reader.Read())
            {
                int logId = reader.GetInt32(0);
                int userId = reader.GetInt32(1);
                string userName = reader.GetString(2);
                string period = reader.GetSqlDateTime(3).ToString();
                string actions = reader.GetString(4);
                string otherInfo = reader.GetString(5);
                Log log = new Log(logId, userId, userName, period, actions, otherInfo);
                logsList.Add(log); 
            }           
        }
        finally
        {
            conn3.Close();
        }

        return logsList;
    }

    // 

    public static string DownloadLog()
    {
        string fileName;
        fileName = "Log" + DateTime.Now.Date.ToString("yyyyMMdd") + ".txt";
        ArrayList logsArr = ConnectionClass.GenerateLog();
        using (StreamWriter newLog = new StreamWriter(new FileStream(
           Path.Combine(HttpContext.Current.Server.MapPath("~"), "Logs", fileName), FileMode.Create)))
        {
            foreach (Log l in logsArr)
            {
                newLog.WriteLine(l.Period + " | " + l.UserName + " | " + l.Actions + " | " + l.OtherInfo + " (userId = " + l.UserId + ")");
            }
        }
        return Path.Combine(HttpContext.Current.Server.MapPath("~"), "Logs", fileName);
    }

    #endregion
}