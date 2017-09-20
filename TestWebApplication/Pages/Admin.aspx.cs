using System;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Pages.Account
{
    public partial class Pages_Account_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["login"] == null)
            {
              Response.Redirect(FormsAuthentication.LoginUrl + "?ReturnUrl=" + Server.UrlEncode(Request.Url.ToString()));
            }
            else
            {
              hdnUserID.Value = Session["userId"].ToString();
              ConnectionClass.AddLog("Административная панель - главная страница", Convert.ToInt32(Session["userId"]), string.Empty);
            }
        }

       protected void GridView1_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
       {          
            string oldName = (string)e.OldValues["name"].ToString();
            string newName = (string)e.NewValues["name"].ToString();
            string lastLoginDate = (string)e.OldValues["lastlogindate"].ToString();
            ConnectionClass.AddLog("Изменение данных пользователя. " + "Старое имя пользователя: " + oldName + ". Дата последнего входа "
                 + lastLoginDate + "", Convert.ToInt32(Session["userId"]), "Новое имя пользователя: " + newName + "");
       }
    }
}