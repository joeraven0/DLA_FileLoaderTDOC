function onQueryStart()
{
  // TODO
}
function onLaserStop()
{
  // TODO
    app.loadFileButton.enable = true;
    app.previewButton.enable = true;
    app.markButton.enable = true;
    
}
function onLaserStart()
{
  // TODO
}
function onLaserEnd()
{
  // TODO
    app.previewButton.text = "";
    app.markButton.text = "Mark";
    app.loadFileButton.enable = true;
    app.previewButton.enable = true;
    app.markButton.enable = true;
}
function onLaserError(error)
{
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

  
 
  print( "Ready !" );
  initApp();
  app.show();
  
  //Trigger actions
  app.loadFileButton["sigReleased()"].connect(loadFile);
  app.previewButton["sigReleased()"].connect(preview);
   app.markButton["sigReleased()"].connect(mark);
  
}

