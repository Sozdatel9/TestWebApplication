using System;
using Entities;

namespace Pages.Account
{
    public partial class Pages_Account_Login : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {          

            User user = ConnectionClass.LoginUser(txtLogin.Text, txtPassword.Text);

            if(user != null)
            {
              //Сохраняем в сессии переменные после авторизации (логин и Id пользователя)
              Session["login"] = user.Name;
              Session["userId"] = user.Id;
              ConnectionClass.AddLog("Успешная авторизация пользователя", Convert.ToInt32(Session["userId"]), string.Empty);
              Response.Redirect("~/Pages/Home.aspx");
            }
            else
            {
              //Проверяем число попыток авторизации и если более 5 неудачных попыток, то блокируем на 15 минут
                        
              if (ConnectionClass.UnsuccessfulAttempt())
              {
                 lblError.Text = "Вы превысили число попыток входа. Ваша учетная запись будет заблокиована до " + (ConnectionClass.GetDateOfUnlock());
              }
              else 
              {
                 lblError.Text = "Не удалось авторизоваться";
              }
            }
        }
    }
}