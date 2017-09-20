using System;
using System.Collections.Generic;
using System.Web;
using System.Collections;
using System.IO;
using Entities;

public partial class Pages_DownloadLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      this.Response.Clear();
      this.Response.Buffer = true;
      this.Response.AddHeader("Content-Disposition", "attachment; filename = Log" + DateTime.Now.Date.ToString("yyyyMMdd") + ".txt" + ";");
      this.Response.ContentType = "text/plain";
      //this.Response.WriteFile(ConnectionClass.DownloadLog());
      this.Response.TransmitFile(ConnectionClass.DownloadLog());
      this.Response.Flush();
      this.Response.End();      
    }
}