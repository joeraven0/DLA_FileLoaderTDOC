function loadXLP(){
    app.theDoc.load(System.getProjectDir()+"/tdoc.xlp");  
   
   
     var tmpObj = app.theDoc.getLaserObject("sn");
    tmpObj.text = sn;
    
     app.renderarea.preview(app.theDoc);
     if(sn!=""){
     app.previewButton.enable = true;
    app.markButton.enable = true;
     }
    
}
function preview(){


var busyLaser = System.isLaserBusy();

if(busyLaser==false){
    app.theDoc.execute(false,false);   
    print("Laser preview");
    app.previewButton.text = "";
    app.loadFileButton.enable = false;
    app.markButton.enable = false;
    
}else{
    System.stopLaser();
    print("Laser stop");
     app.previewButton.text = "";
   
 }
print("Laser busy status: " + busyLaser);
}
function mark(){

    var busyLaser = System.isLaserBusy();
    if(busyLaser==false){
   app.theDoc.execute(true,true);     
    print("Laser mark start");
    app.loadFileButton.enable = false;
    app.previewButton.enable = false;
    app.markButton.text = "Stop marking";
   
}else{
    System.stopLaser();
    print("Laser stop");
    app.markButton.text = "Mark";
    
     
}
print("Laser busy status: " + busyLaser);
}