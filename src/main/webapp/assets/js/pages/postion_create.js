
	function loademptype() {
		$.ajax({
			url: './EmpTypeServlet',
			type: 'post',
			dataType: 'html',
			success: function(data) {
				
				$("#inputcadrecat").html(data);
				//pataStandard();

			}
		});
	
	}
        
	function pataStandard(){
			let emp_type = document.getElementById("inputcadrecat").value;
		//var county = $('#county').val();
		console.log(emp_type);
		 $.ajax({
            url:'./GetCadreServlet?emp_type='+emp_type,
            type:'post',
            dataType:'html',
            success:function (data){
                $("#inputStandCadre").html(data);
       }
            
            
        });
		 
	}


	loademptype();
	//pataStandard();
            // jQuery ajax form submit example, runs when form is submitted
    $("#designForm_").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#designForm_");
        var action = "save_designation";
        var data = form.serialize() + "&action=" + action;
        var url = './PositionServlet'; //get submit url [replace url here if desired]
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_timesheet.jsp";
                $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });

    });
	
