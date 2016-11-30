using System;
using System.Web.UI;
using DotWeb.Repositories;
using DotWeb.Utils;

namespace DotMercy.custom
{
    public partial class CgisSync : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            try
            {
                AppLogger.Info("Process Synchronized Data at " + DateTime.Now);
                bool isSuccess = CgisFilterRepository.ProcessSyncData(dtPackingMonth.Text,
                    Convert.ToInt32(cboTypes.SelectedItem.Value));
                if (isSuccess)
                {
                    AppLogger.Info("Synchronized data successfull at " + DateTime.Now);
                    Page.ClientScript.RegisterStartupScript(GetType(), "script", "EndProcessSync('Success')", true);
                }
                else
                {
                    AppLogger.Info("Synchronized data failed at " + DateTime.Now);
                    Page.ClientScript.RegisterStartupScript(GetType(), "script", "EndProcessSync('Failed')", true);
                }

                AppLogger.Info("Synchronized data finish at " + DateTime.Now);
            }
            catch (Exception ex)
            {
                AppLogger.LogError(ex);
            }
        }
    }
}