function loadFile(){
    
    //Load the tdoc file *.010
    print("Load file function");
    var filePath = FileDialog.getOpenFileName("*.010*");
    if(typeof(filePath) == "string"){
	app.debugLabel.text = "Loaded: " + filePath;
	print(filePath + " loaded");    
	
	var infile = new File(filePath);
	infile.open(File.ReadOnly);
	var fileContent = "";
	while (!infile.eof) {
	    var line = infile.readLine();	
	    fileContent += line;
	}
	infile.close();
	
	//Find the serial number inside the file
	var wordPosition = fileContent.search("FVKEY");	
	//If start position is -1, the word doesn't exist
	 sn = "";
	app.serialNumberLabel.text = sn;
	if(wordPosition!=-1){
	   
	    for(var i=0;i<=fileContent.length;i++){
		//Find end position of s/n
		if(fileContent[wordPosition+i]=="^"){
		    var endPosition = wordPosition+i;
		    print("FVKEY S/N found on START POS: "+ wordPosition + " END POS: "+endPosition);
		    
		    for(var j=wordPosition+5;j<=endPosition-1;j++){
			sn += fileContent[j];
		    }
		    print("S/N: " + sn+"\n");
		    app.serialNumberLabel.text = sn;
		    break;
		}
		
	    } 
	   
	}else{
		print("SN Not found!");
		app.debugLabel.text = "ERROR: No serial number found!";
		
	
	}	 loadXLP();
    }
	    
}