fl.compilerErrors.clear();
fl.outputPanel.clear()
var doc = fl.openDocument( "file:////Users/pwolleb/WORK/IHG_Map/support/Main_Assets/Main_Assets_en_gb.fla" );
doc.publish();
fl.compilerErrors.save( "file:////Users/pwolleb/WORK/IHG_Map/fuelanttasks/errors.txt", true, true );
fl.outputPanel.save( "file:////Users/pwolleb/WORK/IHG_Map/fuelanttasks/output.txt", true, true );
