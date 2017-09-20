<%@ Page Title="Добавление новой задачи" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true"
    CodeFile="AddNewTask.aspx.cs" Inherits="Pages.Pages_Tasks_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Добавление новой задачи</h3>
    <table cellspacing="15" class="table-borderless table-condensed table-hover">
        <tr>
            <td style="width: 80px">
                <b>Заголовок:</b>
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="*Введите заголовок задачи"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Содержание:</b>
            </td>
            <td>
                <asp:TextBox ID="txtContent" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtContent" ErrorMessage="*Введите текст задачи"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Добавить" class="btn btn-warning pull-right loginButton" onclick="btnSave_Click" />
</asp:Content>
