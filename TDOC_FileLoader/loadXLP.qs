function loadXLP(xlpFilename){
    //Fortsätt här!!!!!!!!!!!!!!!!!!!!!!!
    
   app.theDoc.load(System.getDocumentsDir()+xlpFilename);  
   
   log("ACTION:::loadXLP():All project files loaded from: " + System.getDocumentsDir());
    
 
   try{
 
       log("ACTION:::loadXLP():tryCATCH:Try exeption run");
if((sn!="")&&(sn!==("LOAD TDOC FILE!"))&&(sn!==("TDOC FILE ERROR!"))){
    var tmpObj = app.theDoc.getLaserObject("sn");   
   tmpObj.text = sn;
   log("ACTION:::loadXLP():Everything seem fine, ready to mark!");
    
     
     app.documents.enable = true;
     app.previewButton.enable = true;
    app.markButton.enable = true;
     }
else{
    log("ACTION:::loadXLP():XLP-file loaded with explicit bad exeptions reason: No properly set XLP-ID set OR no TDOC-file serial number found!");
     app.previewButton.enable = false;
    app.markButton.enable = false;    
}

 }
   catch(e){
       log("ACTION:::loadXLP():Catch exeption thrown: " + e);
     app.previewButton.enable = false;
    app.markButton.enable = false;
}

    app.renderarea.preview(app.theDoc);
}
function preview(){

if(!System.isLaserBusy()){
    app.theDoc.execute(false,false);   
    log("ACTION:::preview():isLaserBusy=false:Show all limits started");
    app.previewButton.text = "Stop preview";
    app.loadFileButton.enable = false;
    app.markButton.enable = false;
    app.documents.enable = false;
    app.documents.enable = false;
    
}else{
    System.stopLaser();
    log("ACTION:::preview():isLaserBusy=true:LASER STOPPED!");
     app.previewButton.text = "";
   
 }
log("ACTION:::preview():isLaserBusy:The laser busy status is: " + System.isLaserBusy());
}
function mark(){

    if(System.isLaserBusy()==false){
   app.theDoc.execute(true,true);     
   log("ACTION:::mark():isLaserBusy=false:Laser marking executed!");
    app.loadFileButton.enable = false;
    app.previewButton.enable = false;
    app.documents.enable = false;
    app.markButton.text = "Stop marking";
   
}else{
    System.stopLaser();
    log("ACTION:::mark():isLaserBusy=true:Laser was busy, laser stopped!");
    app.markButton.text = "Start marking";
    
     
}
log("ACTION:::mark():isLaserBusy:The laser busy status is: " + System.isLaserBusy());
}