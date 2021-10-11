function DocUpload(){
	try{
		var datasourceDetails = JSON.parse(""+$s.getDatasourceDetails("DocUpload"));
		var baseUrl = datasourceDetails.datasourceProperties.baseUrl;
		var functionDetails = JSON.parse(""+$s.getFunctionDetails(datasourceDetails.datasourceProperties.id, "DocUpload"));
		var url = functionDetails.functionUrl ? baseUrl + functionDetails.functionUrl : baseUrl;
		var headers = {};
		var functionHeaders = functionDetails.functionProperties.headers;
		for(var i=0; i<functionHeaders.length; i++){
			var headerValue = $s.getHeader(functionHeaders[i].key);
			headers[functionHeaders[i].key] = (functionHeaders[i].allowOverride && headerValue) ? ""+headerValue : functionHeaders[i].value;
		}
		var queryString = "?";
		var functionParameters = functionDetails.functionProperties.parameters;
		for(var i=0; i<functionParameters.length; i++){
			if(functionParameters[i].type == "Path"){
				var paramValue = $s.getParameter(functionParameters[i].key);
				url = url.replace("{"+functionParameters[i].key+"}", ((functionParameters[i].allowOverride && paramValue) ? ""+paramValue : functionParameters[i].value));
			} else {
				var paramValue = $s.getParameter(functionParameters[i].key);
				queryString += functionParameters[i].key + "=" + ((functionParameters[i].allowOverride && paramValue) ? ""+paramValue : functionParameters[i].value) + "&";
			}
		}
		queryString = queryString.slice(0, -1);
		url += queryString;
		var multipartReq = $s.createMultipartRequest(url, functionDetails.functionProperties.method, "UTF-8" , headers);
		var functionBody = functionDetails.functionProperties.body;
		for(var i=0; i<functionBody.length; i++){
			if(functionBody[i].value == "String"){
				multipartReq.addFormField(functionBody[i].key, $s.getParameter(functionBody[i].key));
			} else {
				var blobField = $s.getPart(functionBody[i].key);
				if(blobField != null && blobField instanceof com.asg.studio.common.utils.StudioBlob) {
					multipartReq.addFilePart(functionBody[i].key, blobField.getName(), blobField.getContent());
				} else {
					for(var j=0; j<blobField.size(); j++){
						multipartReq.addFilePart(functionBody[i].key, blobField.get(j).getName(), blobField.get(j).getContent());
					}
				}
			}
		}
		var response = $s.multiPartRequest(multipartReq);
		$s.setStatus(200);
		$s.setData(response);
	} catch(e){
		$s.sendResponse(500, e);
	}
}
DocUpload();
