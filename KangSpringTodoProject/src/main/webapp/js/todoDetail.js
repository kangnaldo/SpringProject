/**
 * 
 */

$(function(){
	$("#completionbt").click(function(){
		var todono = {todono : $("#aa").val(), completion : $("#bb").val()};
		$.ajax({
			type : "GET",
			url : "/complete",
			dataType : "json",
			data : todono,
			success : function(data) {
				if (data == true) {//done의 결과
					$("#completionbt").val("완료됨");
					$("#completionbt").addClass("btn-success");
					$("#bb").val('true');
					
				}
				else {
					$("#completionbt").val("완료하기").removeClass('btn-success');
					$("#bb").val('false');
				}
			}

		});
	});
});
