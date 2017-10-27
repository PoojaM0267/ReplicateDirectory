using System;
using System.Configuration;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace ReplicateDirectory
{
    /// <summary>
    /// Summary description for UploadService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)] 
    [ScriptService]
    public class UploadService : WebService
    {
        /// <summary>
        /// Uploads the file.
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public string UploadFile()
        {
            try
            {
                var xmlFile = new HttpPostedFileWrapper(HttpContext.Current.Request.Files["XMLFileData"]);
                if (xmlFile != null)
                {
                    var path = ConfigurationManager.AppSettings.Get("DirectoryFolderPath");
                    var guid = Guid.NewGuid();
                    var fileName = xmlFile.FileName.Insert(0, guid.ToString() + "_");
                    xmlFile.SaveAs(path + fileName);
                    return xmlFile.FileName + " has been uploaded.";
                }

                return "Something went wrong. Please try again later.";
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
