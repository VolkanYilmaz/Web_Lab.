function makeParamString(id1, id2, format) {
  var paramString =
    "ids=" + getValue(id1) + 
    "&format=" + format;
  return(paramString);
}