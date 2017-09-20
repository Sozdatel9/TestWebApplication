<%@ Page Title="Административная панель" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Pages.Account.Pages_Account_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="sdsUsers" ForeColor="Black" DataKeyNames="userId"
        GridLines="Vertical" class="table" OnRowUpdating = "GridView1_OnRowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />           
            <asp:BoundField DataField="name" HeaderText="Имя" SortExpression="name" />
      <asp:TemplateField HeaderText="Пароль">
            <EditItemTemplate>
              <asp:TextBox ID="pass" runat="server" Text='<%# Bind("pass") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
              <asp:TextBox ID="pass" Enabled="False" TextMode="Password" runat="server" Text='<%# Bind("pass") %>'></asp:TextBox>
            </ItemTemplate>
          </asp:TemplateField>
            <asp:BoundField DataField="lastlogindate" HeaderText="Дата последнего входа" 
                ReadOnly="True" SortExpression="Дата последнего входа" />    
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TestWebApplicationConnectionString %>"       
        SelectCommand="SELECT * FROM [Users] where [UserId] = @userId" 
        UpdateCommand="UPDATE [Users] SET [Name] = @name, [Pass] = @pass WHERE [UserId] = @userId">     
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="pass" Type="String" />
            <asp:Parameter Name="userId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter Name="userId" ControlID="hdnUserID" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:HiddenField ID="hdnUserID" runat="server" />
</asp:Content>