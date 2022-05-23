
	function loademptype() {
		$.ajax({
			url: './EmpTypeServlet',
			type: 'post',
			dataType: 'html',
			success: function(data) {
				
				$("#ddlEmployeeType").html(data);
				//pataStandard();

			}

		});
	
	}
	function pataStandard(){
			let emp_type = document.getElementById("ddlEmployeeType").value;
		//var county = $('#county').val();
		console.log(emp_type);
		 $.ajax({
            url:'./GetCadreServlet?emp_type='+emp_type,
            type:'post',
            dataType:'html',
            success:function (data){
                $("#ddlCadreCategory").html(data);
       }
            
            
        });
		 
	}
function pataPositions(){
			let cadre = document.getElementById("ddlCadreCategory").value;
		//var county = $('#county').val();
		console.log(cadre);
		 $.ajax({
            url:'./GetPostionServlet?cadre='+cadre,
            type:'post',
            dataType:'html',
            success:function (data){
	console.log(data);
                $("#ddlDesignation").html(data);
       }
            
            
        });
		 
	}

	loademptype();
	pataStandard();
	pataPositions();
