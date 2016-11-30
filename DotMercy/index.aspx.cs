using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotWeb.Models;
using DotWeb.Repositories;

namespace DotMercy
{
    public partial class _index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {         
            try
            {
                string username = "Test01";
                gvNotification.DataSource = NotificationAppRepository.getNotification(username);
                gvPendingTask.DataSource = PendingTaskRepository.getPendingTask(username);
            }
            catch (Exception Ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Error: " + Ex.Message + " !');", true);
            }
            gvNotification.DataBind();
            gvPendingTask.DataBind();
        }
    }
}