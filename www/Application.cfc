component extends="framework.one" {

  variables.framework = { 
    reloadApplicationOnEveryRequest = true,
    generateSES = true 
  };

  
  function onError(e){
    writeDump(var=e, abort=true);
  }
  
}