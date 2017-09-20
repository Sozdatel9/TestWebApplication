using System;
using System.Web.Security;
using System.Collections;
using System.Web.UI.WebControls;
using System.Data;

namespace Pages
{
    public partial class Pages_Tasks_Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Проверим, авторизовался ли пользователь
            if (Session["login"] != null)
            {
                ConnectionClass.AddLog("Просмотр списка задач", Convert.ToInt32(Session["userId"]), string.Empty);
                ArrayList tasksList = ConnectionClass.GetAllTasks(Convert.ToInt32(Session["userId"]));
                if (tasksList.Count < 1) 
                { 
                    lblUserName.Text = "У пользователя " + Session["Login"]+" нет запланированных задач !"; 
                }
                else
                {
                   lblUserName.Text = "Список задач пользователя " + Session["login"]+" (всего " + tasksList.Count.ToString() + ") :";
                }
                lblUserName.Visible = true;
            }
            else
            {
                lblUserName.Visible = false;
                Response.Redirect(FormsAuthentication.LoginUrl + "?ReturnUrl=" + Server.UrlEncode(Request.Url.ToString()));        
            } 
        }

        protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "completeTaskCmd")
            {
                int t = Convert.ToInt32(e.CommandArgument);
                if (ConnectionClass.CompleteTask(t)) {
                 GridView1.DataBind();
                }
            }
            else if (e.CommandName == "unCompleteTaskCmd")
            {
                int t = Convert.ToInt32(e.CommandArgument);
                if (ConnectionClass.UnCompleteTask(t)) {
                 GridView1.DataBind();
                }
            }
        }

        protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string titleStr = (string)e.Values["Title"].ToString();
            string content = (string)e.Values["Content"].ToString();
            string added = (string)e.Values["Added"].ToString();
            string dateOfComplete = (string)e.Values["DateOfComplete"].ToString();
            ConnectionClass.AddLog("Удаление задачи", Convert.ToInt32(Session["userId"]), "Название: " + titleStr + ", описание: "
                 + content + "Дата добавления  " + added.ToString() + "Дата выполнения "
                 + dateOfComplete);          
        }

        protected void GridView1_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string titleStr = (string)e.OldValues["Title"].ToString();
            string content = (string)e.OldValues["Content"].ToString();
            string added = (string)e.OldValues["Added"].ToString();
            string newTitleStr = (string)e.NewValues["Title"].ToString();
            string newContent = (string)e.NewValues["Content"].ToString();          

            ConnectionClass.AddLog("Изменение задачи. " + "Название: " + titleStr + ", описание: "
                 + content + ". Дата добавления  " + added.ToString() + "", Convert.ToInt32(Session["userId"]), "Новые данные. Название: " + newTitleStr + ", описание: "
                 + newContent);
        }
    }
}