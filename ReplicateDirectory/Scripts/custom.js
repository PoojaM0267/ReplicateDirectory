//Upload XML file 
function uploadFile() {
    debugger;
    var validFileExtensions = ".xml";   
    var file = $("#inputFile").get(0).files;

    if (file.length > 0) {
        var fileName = file[0].name;
        var isValid = ValidateFileType(fileName);

        if (isValid)
        {
            var formData = new FormData();
            formData.append("XMLFileData", file[0]);
            $.ajax({
                url: "UploadService.asmx/UploadFile",
                type: "POST",
                contentType: false,
                processData: false,
                data: formData,
                dataType: "text",
                success: function (data) {
                    debugger;
                    ShowMessage(data);
                },
                error: function (xhr, data) {
                    debugger;
                    alert("An error occurred");
                    ShowMessage(data);
                }
            });
        }
        else {
            alert("ERROR: Only '.xml', '.XML' file formats are allowed. ");
            return;
        }
    }
    else {
        alert("ERROR: Please select a proper XMl file.");
        return;
    }
}

// Validate file extension 
function ValidateFileType(fileName) {
    debugger;
    var extension = fileName.split('.').pop();
    if (extension.toLowerCase() == 'xml')
        return true;

    return false;
}

// Show xml response message as alert 
function ShowMessage(data)
{
    parser = new DOMParser();
    xmlDoc = parser.parseFromString(data, "text/xml");
    var message = xmlDoc.getElementsByTagName("string")[0].childNodes[0].nodeValue;
    console.log(message);
    alert(message);
}
