<%@ Page Title="Авторизация" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages.Account.Pages_Account_Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                  <div class="panel panel-info">
                  <div class="panel-heading">
                        <div class="sidebar-header">Авторизация пользователя</div>
                     </div>
                     <div class="panel-body">                     
                           <div class="form-group">
                           Логин:                             
                               <asp:TextBox ID="txtLogin" runat="server" class="form-control input-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*Вы не ввели логин" ControlToValidate="txtLogin"></asp:RequiredFieldValidator>
                           </div>
                           <div class="form-group">
                           Пароль:                             
                               <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control input-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*Вы не ввели пароль" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                           </div>
                           
                         <p>  <asp:Button ID="btnLogin" runat="server" Text="Вход" 
                    onclick="btnLogin_Click" class="btn btn-warning pull-right loginButton" />
               </p>
               <p> <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label></p>             
                     </div>
                  </div>
</asp:Content>

