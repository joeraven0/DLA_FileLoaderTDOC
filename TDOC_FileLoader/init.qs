var sn = "";
function initApp(){
    app = new Dialog("Laser 2019", Dialog.D_NONE,false);
    
    //Create element
    app.logo = new Label();
    app.debugLabel = new Label();
    app.debugLabelGroupBox = new GroupBox("Message");
    app.serialNumberLabel = new Label();
    app.serialNumberGroupBox = new GroupBox("Serial number");
    
    app.loadFileButton = new PushButton("Load file");
    app.previewButton = new PushButton("", System.getProjectDir()+"/area.png");
    
    
    app.markButton = new PushButton("Mark");
    app.previewButton.enable = false;
    app.markButton.enable = false;
    
    app.theDoc = new LaserDoc();  
    app.renderarea = new RenderArea();
    
    
    
    //Element setting
    app.logo.loadImage(System.getProjectDir()+"/logo.jpg",200,25,2);
    app.debugLabel.text = "Load a file";

    app.serialNumberLabel.text = "Not loaded";
    app.debugLabel.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.serialNumberLabel.font = "MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0";
    app.previewButton.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.markButton.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    app.loadFileButton.font = "MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0";
    
    
    //print("app.previewButton.Font: <font family>, <pointSizeF>, <pixelSize>, <QFont::StyleHint>, <QFont::Weight>, <QFont::Style>, <underline>, <strikeOut>, <fixedPitch>, <rawMode>");
    
    //Add element
    app.add(app.logo);    
    app.add(app.debugLabelGroupBox);
    app.debugLabelGroupBox.add(app.debugLabel);
    app.add(app.serialNumberGroupBox);
    app.serialNumberGroupBox.add(app.serialNumberLabel);
    
    
    app.add(app.loadFileButton);
    app.add(app.previewButton);
    app.add(app.markButton);
    app.add(app.renderarea);
    app.loadFileButton.setFixedSize(150,70);
    app.previewButton.setFixedSize(150,150);
    app.markButton.setFixedSize(150,70);
    
    //Styling
    app.font = "MS Shell Dlg 2,15,-1,5,50,0,0,0,0,0"; 
    app.font.style = "Italic";
}
