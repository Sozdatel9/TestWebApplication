using System;
using Entities;

namespace Pages.Account
{
    public partial class Pages_Account_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["login"] != null) || (Session["userId"]) != null)
           {
               ConnectionClass.AddLog("Страница регистрации нового пользователя", Convert.ToInt32(Session["userId"]), string.Empty);
           }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Создадим нового пользователя
            User user = new User(txtName.Text, txtPassword.Text, System.DateTime.Now);

            //Регистрируем пользователя и возвращаем сообщение с результатом
            lblResult.Text = ConnectionClass.RegisterUser(user);
        }
    }
}