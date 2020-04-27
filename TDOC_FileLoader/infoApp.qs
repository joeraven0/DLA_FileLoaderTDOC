function infoAppFunction(){
    app.infoApp = new Dialog("Info",Dialog.D_NONE,false);

    app.infoApp.infoAppDebugLabel = new Label();
    var contact = "Software report\njoakim.ringstad@datalogic.com\nDatalogic Automation AB\nHöjdrodergatan 21\n212 39 Malmö"
    app.infoApp.infoAppCopyright = new Label(contact);
    app.infoApp.debugGroup = new GroupBox("Log");

    app.infoApp.closeButton = new PushButton("Close");    
    app.infoApp.msg = new Array(15);
    app.infoApp.add(app.infoApp.infoAppCopyright);
    app.infoApp.add(app.infoApp.debugGroup);
    for (var i=0;i<app.infoApp.msg.length;++i) {
    app.infoApp.msg[i] = new Label("", 0x01);
    app.infoApp.msg[i].font = "MS Shell Dlg 2,6,-1,5,50,0,0,0,0,0";
    app.infoApp.debugGroup.add(app.infoApp.msg[i]);
  }
    

app.infoApp.add(app.logodla); 
    app.infoApp.infoAppDebugLabel.setFixedSize(400,200);
    app.infoApp.add(app.infoApp.closeButton);
    app.infoApp.closeButton["sigReleased()"].connect(infoAppCloseFunction);
log("infoApp: " + "infoApp");
}
function infoAppCloseFunction(){
app.infoApp.hide();    
}
function infoAppShowFunction(){
app.infoApp.show()    
}
function bulletSelectorGetStringFieldContent(){
log("Activate manual field content");    
app.loadFileButton.hide();
app.loadText.show();
sn = "";
app.serialNumberLabel.text = sn;
app.loadText.text = "";

}
function bulletSelectorGetFileContent(){
    log("Activate file field content");  
    app.loadFileButton.show();
    app.loadText.hide();
}
