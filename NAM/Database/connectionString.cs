using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace NAM.Database
{
    public class connectionString
    {
        public static string conString = ConfigurationManager.ConnectionStrings["conStringName"].ConnectionString;
    }
}