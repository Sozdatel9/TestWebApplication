<%@ Page Title="Регистрация пользователя" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Pages.Account.Pages_Account_Registration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                  <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="sidebar-header">Регистрация нового пользователя</div>
                     </div>   	
	                   <div class="panel-body">                       
                           <div class="form-group">
                           Логин:
               <asp:TextBox ID="txtName" runat="server"  class="form-control input-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredRegFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*Вы не ввели логин"></asp:RequiredFieldValidator>
                           </div>
                           <div class="form-group">
                           Пароль:
                <asp:TextBox ID="txtPassword" Name="txtPassword" runat="server" TextMode="Password" class="form-control input-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredRegFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="*Вы не ввели пароль"></asp:RequiredFieldValidator>
                           </div>
						   
                           <div class="form-group">
                           Подтверждение пароля:
                <asp:TextBox ID="txtConfirm" Name="txtConfirm" runat="server" TextMode="Password" class="form-control input-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredRegFieldValidator3" runat="server" 
                    ControlToValidate="txtConfirm" ErrorMessage="*Вы не ввели подтверждение пароля"></asp:RequiredFieldValidator>
                           </div>
                          
                         <p>  <asp:Button ID="btnRegister" class="btn btn-warning pull-right loginButton" runat="server" Text="Регистрация" 
                    onclick="btnRegister_Click" />
           
                
                <asp:Label ID="lblResult" runat="server"></asp:Label></p>
                <input ID="genPasswordBtn" class="btn btn-warning pull-left loginButton" value="Генерировать пароль" 
                    onClick="javascript: genPassword()"  />  
                    <br /><br />
             
                    <table><tr><td><label style="font-weight: normal;">Введите длину пароля (от 3 до 20 символов):</label></td><td>&nbsp;</td>
                    <td><asp:TextBox ID="passLengthTextBox" name="passLengthTextBox" class="form-control input-sm" runat="server" width="70px"></asp:TextBox></td></tr></table><br />
                    <Label ID="generatedPassLbl" style="font-weight: normal;"></Label><br />
                    <asp:RangeValidator ID="passLengthValidator" Type="Integer" 
MinimumValue="3" MaximumValue="20" runat="server" 
 ControlToValidate="passLengthTextBox"  ErrorMessage="Указана неправильная длина пароля - она должна быть не менее 3 и не более 20"> </asp:RangeValidator> <br /> 
       <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtConfirm" ControlToValidate="txtPassword" 
                    ErrorMessage="Пароли должны совпадать"></asp:CompareValidator>
    
   
                     </div> 	
	 </div>
                
</asp:Content>

