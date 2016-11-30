using System;
using System.IO;
using System.Web.UI;

namespace DotMercy.custom
{
    public partial class DownloadFile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                string fileName = "";
                if (Request.QueryString["type"] == "ric")
                {
                    fileName = "~/App_Data/SampleFile/ReportSummaryAlteration_C250AMG_0516.pdf";
                }
                else if (Request.QueryString["type"] == "jc")
                {
                    fileName = "~/App_Data/SampleFile/C250AMG PM05-2016.pdf";
                }
                string filePath = Server.MapPath(fileName);
                if (!File.Exists(filePath))
                {
                    Response.SuppressContent = false;
                    Response.Write("No file is found");
                    Response.End();
                    return;
                }

                Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.ContentType = "application/pdf";
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}