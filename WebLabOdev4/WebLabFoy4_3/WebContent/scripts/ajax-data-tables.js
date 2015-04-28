function getCustomerTable(rows) {
  var headings = 
    [ "Customer ID", "First Name", "Last Name", "Balance" ];
  return(getTable(headings, rows));
}

function xmlCustomerTable(resultRegion, field1, field2) {
  var address = "show-customers";
  var data = makeParamString(field1, field2, "xml");
  ajaxPost(address, data, 
           function(request) { 
             showXmlCustomerInfo(request, resultRegion); 
           });
}

function showXmlCustomerInfo(request, resultRegion) {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    var xmlDocument = request.responseXML;
    var customers = 
      xmlDocument.getElementsByTagName("customer");
    var rows = new Array();
    for(var i=0; i<customers.length; i++) {
      var customer = customers[i];
      var subElements = 
        ["id", "firstName", "lastName", "balance"];
      rows[i] = getElementValues(customer, subElements);
    }
    var table = getCustomerTable(rows);
    htmlInsert(resultRegion, table);
  }
}

function jsonCustomerTable(resultRegion, field1, field2) {
  var address = "show-customers";
  var data = makeParamString(field1, field2, "json");
  ajaxPost(address, data, 
           function(request) { 
             showJsonCustomerInfo(request, resultRegion); 
           });
}

function showJsonCustomerInfo(request, resultRegion) {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    var rawData = request.responseText;
    var customers = eval("(" + rawData + ")");
    var rows = new Array();
    for(var i=0; i<customers.length; i++) {
      var customer = customers[i];
      rows[i] = [customer.id, customer.firstName,
                 customer.lastName, customer.balance];
    }
    var table = getCustomerTable(rows);
    htmlInsert(resultRegion, table);
  }
}

function stringCustomerTable(resultRegion, field1, field2) {
  var address = "show-customers";
  var data = makeParamString(field1, field2, "string");
  ajaxPost(address, data, 
           function(request) { 
             showStringCustomerInfo(request, resultRegion); 
           });
}

function showStringCustomerInfo(request, resultRegion) {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    var rawData = request.responseText;
    var customers = rawData.split(/\n+/);
    var rows = new Array();
    for(var i=0; i<customers.length; i++) {
      if (customers[i].length > 1) {  // Ignore blank lines
        rows.push(customers[i].split("#"));
      }
    }
    var table = getCustomerTable(rows);
    htmlInsert(resultRegion, table);
  }
}

function randomNumberMessage(resultRegion) {
  var address = "show-nums";
  ajaxPost(address, null, 
           function(request) { 
             showRandomNumberMessage(request, resultRegion); 
           });
}

function showRandomNumberMessage(request, resultRegion) {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    var rawData = request.responseText;
    var nums = eval("(" + rawData + ")");
    var sum = Math.random() + Math.random() + Math.random();
    for(var i=0; i<nums.length; i++) {
      sum = sum + nums[i];
    }
    var message = "You are a Winner!";
    if (sum < 3.0) {
      message = "You are a Loser!";
    }
    htmlInsert(resultRegion, message);
  }
}