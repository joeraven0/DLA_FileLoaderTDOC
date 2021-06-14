function onQueryStart()
{
  // TODO
    log("STATUS: QueryStart");
}
function onLaserStop()
{
  // TODO
    app.loadFileButton.enable = true;
    app.previewButton.enable = true;
    app.markButton.enable = true;
    app.documents.enable = true;
    app.previewButton.text = "Preview";

   log("STATUS: LaseStop");
  app.statusLabel.text = "Laser stopped!";
    
}
function onLaserStart()
{
  // TODO
    log("STATUS: LaserStart");
    app.statusLabel.text = "Laser started!";
}
function onLaserEnd()
{
  // TODO

    app.loadFileButton.enable = true;
    app.previewButton.enable = true;
    app.markButton.enable = true;
    app.documents.enable = true;
    app.previewButton.text = "Preview";
    app.markButton.text = "Start marking";
    log("STATUS: LaserEnd");
    app.statusLabel.text = "Marking finished!";
}
function onLaserError(error)
{
    app.statusLabel.text = "Laser error!";
    log("ACTION:::onLaserError():Laser status was: LaserError");
  switch(error)
  {
    case System.DSP_IN_HANG:
      System.resetBoard();
      break;
    case System.DSP_ERROR_INIT:
      // This event is triggered each time the script engine starts
      // if the board was not properly loaded
      
	//UNCHECK!
	//MessageBox.critical( "Board initialization error", MessageBox.Ok );
      break;
    // TODO
  }
}
function onClose()
{
  // TODO
    log("STATUS:::onClose: Close!");
}
var allDocuments = [""];
function loadDocuments(){
    
    var documentsList = System.getDocumentsList();
    var list = "";
    DocsDir = new Dir(System.getDocumentsDir());
    list = DocsDir.entryList("*.xlp"); 
    
    app.documents.itemList = list;
    log("ACTION:::loadDocuments():Laser documents added to ComboBox!"); 
loadXLP(list);
}
function getSelectedDocument(){
    var selectedItem = app.documents.currentItem;
    log("ACTION:::getSelectedDocument:Picked ComboBox document sent to loadXLP(selectedItem)"+selectedItem);
    loadXLP(selectedItem);    
}
function main()
{
  System.sigQueryStart.connect(onQueryStart);
  System.sigLaserStop.connect(onLaserStop);
  System.sigLaserStart.connect(onLaserStart);
  System.sigLaserEnd.connect(onLaserEnd);
  System["sigLaserError(int)"].connect(onLaserError);
  System.sigClose.connect(onClose);
  
  
  
  // TODO





  initApp();
  infoAppFunction();
  app.show();
  loadDocuments();
  getSelectedDocument();
  
  
 
  
  //Trigger actions
  app.loadTextSN["sigTextChanged(QString)"].connect(textAddSN);
   app.loadText1["sigTextChanged(QString)"].connect(textAdd1);
   app.loadText2["sigTextChanged(QString)"].connect(textAdd2);
   app.loadText3["sigTextChanged(QString)"].connect(textAdd3);
  app.documents["sigIndexChanged(QString)"].connect(getSelectedDocument);
  app.loadFileButton["sigReleased()"].connect(loadFile);
  app.previewButton["sigReleased()"].connect(preview);
   app.markButton["sigReleased()"].connect(mark);
   app.infoButton["sigReleased()"].connect(infoAppShowFunction);
   app.tdocfileSelectorStringFieldRadioButton["sigClicked()"].connect(bulletSelectorGetStringFieldContent);
   app.tdocfileSelector010FileRadioButton["sigClicked()"].connect(bulletSelectorGetFileContent);
   app.datafieldSNCheckbox["sigStateChanged(int)"].connect(checkboxStateChanged);
   app.datafield1Checkbox["sigStateChanged(int)"].connect(checkboxStateChanged);
   app.datafield2Checkbox["sigStateChanged(int)"].connect(checkboxStateChanged);
   app.datafield3Checkbox["sigStateChanged(int)"].connect(checkboxStateChanged);
  
  
  log("Laser status:  "+ System.getProcessState());
}
function log(logcontent){  
    var index = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
      var d; 
Today = new Date(); 
d = Today.toLocaleTimeString();
var logmsg = d + ":::" + logcontent;
print(logmsg);    

if (index < app.infoApp.msg.length){
    app.infoApp.msg[index.length++].text = logmsg;
}
else{
for (var i = 1; i < app.infoApp.msg.length; ++i)   //label shift cycle upwards
{
      app.infoApp.msg[i - 1].text = app.infoApp.msg[i].text;
    app.infoApp.msg[app.infoApp.msg.length - 1].text = logmsg;
}}
}

