function textAdd(){
    sn = app.loadText.text;
    app.serialNumberLabel.text = sn;
log("Character added!");    

getSelectedDocument();    
}
function loadFile(){
    
    //Load the tdoc file *.010
    log("ACTION:::loadFile()");
    var filePath = FileDialog.getOpenFileName("*.010*");
    
    if(typeof(filePath) == "string"){
	app.tdocLabel.text = filePath;	
	log("ACTION:::LOADED FILE: "+filePath);    
		
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
		    log("ACTION:::loadFile():FVKEY S/N found on START POS: "+ wordPosition + " END POS: "+endPosition);
		    
		    for(var j=wordPosition+5;j<=endPosition-1;j++){
			sn += fileContent[j];
		    }
		    log("ACTION:::loadFile():FOUND SERIAL NUMBER: " + sn);
		    app.serialNumberLabel.text = sn;
		    break;
		}
		
	    } 
	   
	}else{
	    log("ACTION:::loadFile():DID NOT FIND SERIAL NUMBER!");
		app.serialNumberLabel.text = "ERROR: No serial number found!";
		sn = "TDOC FILE ERROR!";
		
	
	}	 getSelectedDocument();
    }
	    
}