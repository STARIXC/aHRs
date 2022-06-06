
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


   
    function loadcounty(){
        
        
        $.ajax({
            url:'loadCounty',
            type:'post',
            dataType:'html',
            success:function (data){
                $("#ddlCounty").html(data);
                patasubcounty();
   
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



  //load default facilities
     loadcounty();
