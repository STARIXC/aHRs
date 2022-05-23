/**
 * 
 */
jQuery(document).ready(function() {

  //load all the facilities first to enable one to filter by county
	$.ajax({
		url: 'FacilityServlet',
		type: 'post',
		dataType: 'html',
		success: function(data) {
			$("#ddlFacility").html(data);
			if (document.getElementById("ddlFacility").value !== '') {
				updatefacilsession();

				$('#ddlFacility').select2();
			}

			// $("#facility").chosen();


		}


	});


	$.ajax({
		url: 'PositionServlet',
		type: 'post',
		dataType: 'html',
		success: function(data) {
			$("#ddlDesignation").html(data);
			if (document.getElementById("ddlDesignation").value !== '') {
				/*updatefacilsession();*/

				$('#ddlDesignation').select2();
			}

			// $("#facility").chosen();


		}


	});


   
    function loadcounty(){
        
        
        $.ajax({
            url:'loadCounty',
            type:'post',
            dataType:'html',
            success:function (data){
                $("#ddlCounty").html(data);
                patasubcounty();
getPosition();
getcardertype();
              //  App.init();   
            }
            
            
        });
        
    }



	function patasubcounty() {
		var county = document.getElementById("ddlCounty").value;
		//var county = $('#county').val();
		
		  $.ajax({
            url:'GetsubcountyServlet?county='+county,
            type:'post',
            dataType:'html',
            success:function (data){
                $("#ddlSubcounty").html(data);
                patafacility();
getPosition();
              //  App.init();   
            }
            
            
        });

	}

	function patafacility() {

		var subcounty = document.getElementById("ddlSubcounty").value;
		$.ajax({
			url: './FacilityServlet?subcounty=' + subcounty,
			type: 'post',
			dataType: 'html',
			success: function(data) {
				$("#ddlFacility").html(data.replace("<option value=''>Select facility</option>", ""));
				var select = document.getElementById('ddlFacility');
				// select.size = select.length;
				//$('#ddlFacility').select2();
			}
		});
	}



	function getPosition() {

		var cadreType = document.getElementById("ddlCadreCategory").value;
		$.ajax({
			url: './PositionServlet?cadreType=' + cadreType,
			type: 'post',
			dataType: 'html',
			success: function(data) {
				$("#ddlDesignation").html(data.replace("<option value=''>--Select--</option>", ""));
				var select = document.getElementById('ddlDesignation');
				// select.size = select.length;
				$('#ddlDesignation').select2();
			}
		});
	}
	getcardertype();
	getcardercat();
	function getcardertype() {
		$.ajax({
			url: './EmpTypeServlet',
			type:'post',
            dataType:'html',
			success: function(data) {
				console.log(data);
				//$("#ddlEmployeeType").append(data);
				$("#ddlEmployeeType").html(data);


			}
		});
	}


	function getcardercat() {
		$.ajax({
			url: './CadreTypeServlet',
			type: 'get',
			dataType: 'html',
			success: function(data) {
				//$("#ddlCadreCategory").append(data)
				   $("#ddlCadreCategory").html(data);

			}
		});
	}

  //load default facilities
     loadcounty();
});           