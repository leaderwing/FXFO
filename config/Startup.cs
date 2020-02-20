
using Microsoft.AspNet.SignalR;
using Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace VPB_FX
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=316888  
            GlobalHost.Configuration.DefaultMessageBufferSize = 1;
            app.MapSignalR();            
            //System.Data.SqlClient.SqlDependency.Start(ConfigurationManager.ConnectionStrings["VPB_FXFO_TRS"].ConnectionString);
        }
    }
}