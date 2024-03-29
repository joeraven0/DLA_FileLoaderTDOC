var sn = "LOAD TDOC FILE!";

function initApp(){
    app = new Dialog("TDOC Mark", Dialog.D_NONE,false);
    
    
    app.gbMarkController = new GroupBox();
    app.Controller = new GroupBox();
    //Create element
    app.logo = new Label();
    app.logodla = new Label();
    app.tdocLabel = new Label();

    app.statusLabel = new Label();
    app.tdocLabelGroupBox = new GroupBox("TDOC File loader");    
    app.tdocfileSelectorStringFieldRadioButton = new RadioButton("Manual input",true);
    app.tdocfileSelector010FileRadioButton = new RadioButton("From .010 file");
    app.statusLabelGroupBox = new GroupBox("Laser status");
    app.serialNumberLabel = new Label();
    app.serialNumberGroupBox = new GroupBox("Last input string");
    app.documentGroupBox = new GroupBox("Select marking file");
    
    app.loadFileButton = new PushButton("Load file");
    app.loadTextSN = new LineEdit("Serial number");
    app.loadText1 = new LineEdit("Input field 1","");
    app.loadText2 = new LineEdit("Input field 2","");
    app.loadText3 = new LineEdit("Input field 3","");
    app.previewButton = new PushButton("Preview");
    //app.previewButton = new PushButton("Preview", System.getProjectDir()+"/area.png");
    app.documents = new ComboBox("", [""]);
    app.datafieldSNCheckbox = new CheckBox("Activate SN");
    app.datafield1Checkbox = new CheckBox("Activate field 1 (date compatible)");
    app.datafield2Checkbox = new CheckBox("Activate field 2");
    app.datafield3Checkbox = new CheckBox("Activate field 3");
    
   
    
    app.markButton = new PushButton("Start marking");
    app.previewButton.enable = false;
    app.markButton.enable = false;
    
    app.theDoc = new LaserDoc();  
    app.renderarea = new RenderArea();
    app.infoButton = new PushButton("Info");
     
    
    
    
    //Element setting
    app.logo.loadImage(System.getProjectDir()+"/logo.jpg",200,25,2);
    app.logodla.loadImage(System.getProjectDir()+"/logo.jpg",200,25,2);
    app.tdocLabel.text = "Select input method, manual or from file";
   

    app.serialNumberLabel.text = "Not loaded";

    app.tdocLabel.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.statusLabel.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.tdocfileSelectorStringFieldRadioButton.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.tdocfileSelector010FileRadioButton.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.serialNumberLabel.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.previewButton.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.markButton.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.loadFileButton.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.infoButton.font = "MS Shell Dlg 2,6,-1,5,50,0,0,0,0,0";
    app.documents.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.datafieldSNCheckbox.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.datafield1Checkbox.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.datafield2Checkbox.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.datafield3Checkbox.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    
    
    
    //log("app.previewButton.Font: <font family>, <pointSizeF>, <pixelSize>, <QFont::StyleHint>, <QFont::Weight>, <QFont::Style>, <underline>, <strikeOut>, <fixedPitch>, <rawMode>");
    
    //Add element
    
    app.Controller.add(app.logo);    
    app.add(app.tdocLabelGroupBox);
    
    app.tdocLabelGroupBox.add(app.tdocLabel);
    app.tdocLabelGroupBox.add(app.tdocfileSelectorStringFieldRadioButton);
    app.tdocLabelGroupBox.add(app.tdocfileSelector010FileRadioButton);
    app.tdocLabelGroupBox.add(app.loadFileButton);
    app.tdocLabelGroupBox.add(app.loadTextSN);
    app.tdocLabelGroupBox.add(app.loadText1);
     app.tdocLabelGroupBox.add(app.loadText2);
      app.tdocLabelGroupBox.add(app.loadText3);
    
    app.Controller.add(app.serialNumberGroupBox);
    app.serialNumberGroupBox.add(app.serialNumberLabel);
    app.Controller.add(app.documentGroupBox);
    app.documentGroupBox.add(app.documents);
    app.documentGroupBox.add(app.datafieldSNCheckbox);
    app.documentGroupBox.add(app.datafield1Checkbox);
    app.documentGroupBox.add(app.datafield2Checkbox);
    app.documentGroupBox.add(app.datafield3Checkbox);
    app.Controller.add(app.statusLabelGroupBox); 
    app.Controller.add(app.infoButton);
    app.statusLabelGroupBox.add(app.statusLabel);
    app.add(app.Controller);
    app.statusLabelGroupBox.add(app.gbMarkController);    
    
    app.gbMarkController.add(app.previewButton);
    app.gbMarkController.newColumn();
    app.gbMarkController.add(app.markButton);
    
    
     
    
    app.Controller.newColumn();
    app.Controller.add(app.renderarea);
    app.tdocLabel.setFixedSize(700,20);
    app.loadFileButton.setFixedSize(70,30);
    app.previewButton.setFixedSize(100,50);
    app.markButton.setFixedSize(100,50);
     app.statusLabel.alignment=0x04;
     app.infoButton.setFixedSize(50,30);
    //Styling
    
    
    app.font = "Lucida Sans,15,-1,5,50,0,0,0,0,0"; 
    app.font.style = "Italic";
    
    //First run initialization
     app.loadFileButton.hide();


}



