<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadXml.aspx.cs" Inherits="ReplicateDirectory.UploadXml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Replicate Directory</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Custom.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top navbarBg">
        <div>
            <div class="navbar-header">
                <a class="navbar-brand textWhite" runat="server" href="#">Replicate Directory</a>
            </div>
        </div>
    </div>

    <div class="container bodyContent">
        <div class="col-md-12 col-sm-12 col-xs-12 uploadFormContainer">
            <h2>Upload XML File: </h2>
            <div class="col-md-6 col-sm-12 col-xs-12 innerContainerDiv">
                <form id="uploadForm" runat="server">
                    <label>
                        <span>Browse:</span>
                        <input type="file" id="inputFile" required="required" />
                    </label>
                    <br />
                    <input type="submit" id="submitBtn" class="btn btn-primary" runat="server" onclick="uploadFile()" value="Upload" />
                </form>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 innerContainerDiv">
                <label id="statusMsg" class="statusMsgLbl"></label>
                <%--  <asp:Label runat="server" id="statusMsg" text="Upload status: " />--%>
            </div>
        </div>
        <hr />
        <footer>
            <p>&copy; <%: DateTime.Now.Year %> - Replicate Directory Application</p>
        </footer>
    </div>
</body>
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/custom.js" type="text/javascript"></script>
</html>
