using System;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        //Проверим, авторизовался ли пользователь
        if(Session["login"] != null)
        {
            lblLogin.Text = "Добро пожаловать, " + Session["login"];
            lblLogin.Visible = true;
            LinkButton1.Text = "Выйти";
        }
        else
        {
            lblLogin.Visible = false;
            LinkButton1.Text = "Войти";            
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Пользователь авторизовался
        if(LinkButton1.Text == "Войти")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
        else
        {
            //Пользователь вышел
            Session.Clear();
            Response.Redirect("~/Pages/Home.aspx");
        }
    }
}
