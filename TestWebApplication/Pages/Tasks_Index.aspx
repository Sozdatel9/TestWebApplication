<%@ Page Title="Список задач" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Tasks_Index.aspx.cs" Inherits="Pages.Pages_Tasks_Index" %>

<asp:Content ID="ActiveMenuTasks" ContentPlaceHolderID="ActiveMenuTasks" Runat="Server">
active
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3><asp:Label ID="lblUserName" class="lblUserName" runat="server" Text=""></asp:Label></h3>
    <p>
        <asp:LinkButton ID="LinkButton11" runat="server" 
            PostBackUrl="~/Pages/AddNewTask.aspx">Добавить новую задачу</asp:LinkButton>
    </p>    
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            CellSpacing="4" OnRowCommand="GridView1_OnRowCommand" DataKeyNames="taskId" DataSourceID="sds_coffee" ForeColor="Black" 
            GridLines="Vertical" Class="table"  OnRowDeleting="GridView1_OnRowDeleting" OnRowUpdating = "GridView1_OnRowUpdating" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="taskId" HeaderText="TaskId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="taskId" Visible="False"/>
                <asp:TemplateField HeaderText="№">   
                 <ItemTemplate>
                         <%# Container.DataItemIndex + 1 %>   
                 </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="Заголовок" SortExpression="Title" />
                <asp:BoundField DataField="Content" HeaderText="Содержание" SortExpression="Content" />
                <asp:BoundField DataField="Added" HeaderText="Дата добавления" SortExpression="Added" ReadOnly="True"/>
                <asp:BoundField DataField="DateOfComplete" HeaderText="Дата завершения" SortExpression="DateOfComplete" ReadOnly="True" />       
                <asp:TemplateField HeaderText="Завершено">
	                <ItemTemplate>
		                <%# Convert.ToBoolean(Eval("Completed")) ? "Да" : "Нет" %>
	                </ItemTemplate>
                </asp:TemplateField>     
                  <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                <asp:Button ID="CompletedBtn" runat="server" CausesValidation="false"  class="btn btn-success" CommandName="completeTaskCmd"
                    Text="Завершить задачу" CommandArgument='<%# Eval("taskId") %>' />
            </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField ShowHeader="False" >
               <ItemTemplate>
               <asp:Button ID="UnCompletedBtn" runat="server" CausesValidation="false" class="btn btn-danger" CommandName="unCompleteTaskCmd"
                Text="Снять отметку о завершении" CommandArgument='<%# Eval("taskId") %>' />
            </ItemTemplate>
        </asp:TemplateField>
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
        </asp:GridView>   <!-- SelectCommand="SELECT [TaskId], [Title], [Content],  [Added], [DateOfComplete], [Completed] FROM [Tasks]"     -->
        <asp:SqlDataSource ID="sds_coffee" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TestWebApplicationConnectionString %>" 
            DeleteCommand="DELETE FROM [Tasks] WHERE [TaskId] = @taskId" 
            InsertCommand="INSERT INTO [Tasks] ([Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (@Title, @Content, @Added, @DateOfComplete, @Completed)"        
            SelectCommand="SELECT * FROM [Tasks] t LEFT JOIN UsersAndTasks ut ON ut.TaskId = t.TaskId WHERE ut.UserId = @UserId"            
            UpdateCommand="UPDATE [Tasks] SET [Title] = @Title, [Content] = @Content WHERE [TaskId] = @taskId">
            <DeleteParameters>
                <asp:Parameter Name="taskId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Content" Type="String" />   
                <asp:Parameter Name="Added" Type="String" />
                <asp:Parameter Name="DateOfComplete" Type="String" />
                <asp:Parameter Name="Completed" Type="String" />               
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Content" Type="String" />    
                <asp:Parameter Name="Added" Type="String" />                    
                <asp:Parameter Name="taskId" Type="Int32" />
            </UpdateParameters>
            <Selectparameters>
		        <asp:SessionParameter Name="UserId" sessionfield="userId" type="Int32" />
	        </Selectparameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

