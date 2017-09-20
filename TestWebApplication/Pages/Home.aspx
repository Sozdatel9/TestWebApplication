<%@ Page Title="Главная страница" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages.Pages_Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ActiveMenuIndex" Runat="Server">
active
</asp:Content>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<p>Добро пожаловать !</p>
<p> Для начала работы с порталом вам необходимо  <a href="~/Pages/Account/Login.aspx" runat="server">авторизоваться</a> или <a href="~/Pages/Account/Registration.aspx" runat="server">зарегистрироваться</a> , если у вас нет учетной записи</p>
</asp:Content>
