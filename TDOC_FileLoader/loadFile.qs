function textAddSN(){
    textFieldSN = app.loadTextSN.text;
    app.serialNumberLabel.text = textFieldSN;
log("Character added to field SN!");    

getSelectedDocument();    
}
function textAdd1(){
    textField1 = app.loadText1.text;
    app.serialNumberLabel.text = textField1;
log("Character added to field 1!");    

getSelectedDocument();    
}
function textAdd2(){
    textField2 = app.loadText2.text;
    app.serialNumberLabel.text = textField2;
log("Character added to field 2!");    

getSelectedDocument();    
}
function textAdd3(){
    textField3 = app.loadText3.text;
    app.serialNumberLabel.text = textField3;
log("Character added to field 3!");    

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
	 textFieldSN = "";
	app.serialNumberLabel.text = textFieldSN;
	if(wordPosition!=-1){
	   
	    for(var i=0;i<=fileContent.length;i++){
		//Find end position of s/n
		if(fileContent[wordPosition+i]=="^"){
		    var endPosition = wordPosition+i;
		    log("ACTION:::loadFile():FVKEY S/N found on START POS: "+ wordPosition + " END POS: "+endPosition);
		    
		    for(var j=wordPosition+5;j<=endPosition-1;j++){
			textFieldSN += fileContent[j];
		    }
		    log("ACTION:::loadFile():FOUND SERIAL NUMBER: " + textFieldSN);
		    app.serialNumberLabel.text = textFieldSN;
		    break;
		}
		
	    } 
	   
	}else{
	    log("ACTION:::loadFile():DID NOT FIND SERIAL NUMBER!");
		app.serialNumberLabel.text = "ERROR: No serial number found!";
		textFieldSN = "TDOC FILE ERROR!";
		
	
	}	 getSelectedDocument();
    }
	    
}