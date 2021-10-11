function getKYCDetailsById(){
	var queryStr = "SELECT \"firstname\",\"lastname\",\"email\",\"mobile\",\"gender\",\"maritalstatus\",\"occtype\",\"add1\",\"add2\",\"add3\",\"postcode\",\"state\",\"country\",\"status\",\"validatorid\",\"agentid\",\"remarks\",\"age\",\"approvedby\" , count(*) OVER() AS full_count FROM \"public\".\"KYCApplications\" WHERE \"id\"= ?";
	var queryStrWithLimit = "SELECT \"firstname\",\"lastname\",\"email\",\"mobile\",\"gender\",\"maritalstatus\",\"occtype\",\"add1\",\"add2\",\"add3\",\"postcode\",\"state\",\"country\",\"status\",\"validatorid\",\"agentid\",\"remarks\",\"age\",\"approvedby\" , count(*) OVER() AS full_count FROM \"public\".\"KYCApplications\" WHERE \"id\"= ? LIMIT ? OFFSET ?";
	try{
		if($s.getParameter("limit") && $s.getParameter("limit") != "" && $s.getParameter("offset") && $s.getParameter("offset") != ""){
		$s.query("KYCDS", queryStrWithLimit);
		$s.setLong(2, "limit");
		$s.setLong(3, "offset");
		}else{
		$s.query("KYCDS", queryStr);
		}
	$s.setLong(1, "id");
		results = $s.queryDb();
		$s.sendResponse(200, results);
} catch(e) {
			java.lang.System.out.println(e);
			$s.sendResponse(500, e);
		}
}
getKYCDetailsById();