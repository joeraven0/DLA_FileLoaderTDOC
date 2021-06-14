function checkboxStateChanged(){
    //Toggle timestamp in marking file - if checkbox state change, reload marking file
    log("ACTION:::timestampToggle()");
    //Reload marking file
   getSelectedDocument();
}
textFieldSN = "";
textField1 = "";
textField2 = "";
textField3 = "";
function loadXLP(xlpFilename){    
   app.theDoc.load(System.getDocumentsDir()+xlpFilename);  
   
   log("ACTION:::loadXLP():All project files loaded from: " + System.getDocumentsDir()); 
   try{
 
       log("ACTION:::loadXLP():tryCATCH:Try exeption run");
        stringSNstate = app.datafieldSNCheckbox.checked;
        string1state = app.datafield1Checkbox.checked;
        string2state = app.datafield2Checkbox.checked;
        string3state = app.datafield3Checkbox.checked;
       app.theDoc.getLaserObject("sn").enable=stringSNstate;
       app.theDoc.getLaserObject("data_field-1").enable=string1state;
       app.theDoc.getLaserObject("data_field-2").enable=string2state;
       app.theDoc.getLaserObject("data_field-3").enable=string3state;


    if(((textFieldSN!="")&&(stringSNstate==1)&&(textFieldSN!==("LOAD TDOC FILE!"))&&(textFieldSN!==("TDOC FILE ERROR!")))||(((textField1!="")&&(string1state==1))||((textField2!="")&&(string2state==1))||((textField3!="")&&(string3state==1)))){
	   log("ACTION:::loadXLP():Everything seem fine, ready to mark!");
	   var tmpObjSN = app.theDoc.getLaserObject("sn");   
	   tmpObjSN.text = textFieldSN;
	   var tmpObj1=app.theDoc.getLaserObject("data_field-1");
	   if(textField1!=""){
	       tmpObj1.text = textField1;}
                   
	   var tmpObj2 = app.theDoc.getLaserObject("data_field-2");   
	   tmpObj2.text = textField2;
	   var tmpObj3 = app.theDoc.getLaserObject("data_field-3");   
	   tmpObj3.text = textField3;
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
       log("ACTION:::loadXLP():Catch exeption 01 thrown: " + e);
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