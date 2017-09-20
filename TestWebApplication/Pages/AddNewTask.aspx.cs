using System;
using System.Collections;
using System.IO;
using Entities;
using System.Web.Security;

namespace Pages
{
  public partial class Pages_Tasks_Add : System.Web.UI.Page
  {
      protected void Page_Load(object sender, EventArgs e)
      {
          //Проверим, авторизовался ли пользователь
          if (Session["login"] == null)
          {
              Response.Redirect(FormsAuthentication.LoginUrl + "?ReturnUrl=" + Server.UrlEncode(Request.Url.ToString()));
          }
          else
          {
              ConnectionClass.AddLog("Добавление новой задачи", Convert.ToInt32(Session["userId"]), string.Empty);
          }
      }

        private void ClearTextFields()
        {
            txtTitle.Text = "";
            txtContent.Text = "";            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        { 
          try
          {
            string title = txtTitle.Text;
            string content = txtContent.Text;
            Task task = new Task(title, content, DateTime.Now.ToString("yyyy-MM-ddThh:mm:ss"), "0");
            ConnectionClass.AddTask(task, Convert.ToInt32(Session["userId"]));
            lblResult.Text = "Задача успешно добавлена!";
            ConnectionClass.AddLog("Добавление новой задачи", Convert.ToInt32(Session["userId"]), "Название: " + title + ",описание: " + content);
            ClearTextFields();
          }
          catch (Exception)
          {
            lblResult.Text = "Во время добавления задачи произошла неизвестная ошибка!";
          }                  
        }
    }
}