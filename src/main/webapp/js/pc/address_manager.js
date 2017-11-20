/**该js不能使用resUrl取资源**/
 
 	function addNewAddress(){
 		if($("#Consignee").val()!=""){
		$("#Consignee").val("");
		$("#Telephone").val("");
		$("#Street").val("");
		$("#Provinces").html("<option value=>"+"省份/自治区"+"</option>");
		$("#Citys").html("<option value=>"+"城市/地区/自治州"+"</option>");
		$("#Countys").html("<option value=>"+"区/县"+"</option>");
	}
	$("#J_editAddrBackdrop").show();
	$("#J_editAddrBox").show();
	$.getJSON('get_province', function(data){
   		var options="<option value=>"+"省份/自治区"+"</option>";
    	$.each(data,function(i,n) {
    		options+="<option value='"+n.code+"'>"+n.areaName+"</option>";
    	});
    	$("#Provinces").html(options);
    });  	
}
//获取省份
function getProvince(code){
	$.getJSON('get_province', function(data){
   		var options="<option value=>"+"省份/自治区"+"</option>";
    	$.each(data,function(i,n) {
    		if(code==n.code){
    			options+="<option value='"+n.code+"' selected='selected'>"+n.areaName+"</option>";
    		} else{
    			options+="<option value='"+n.code+"'>"+n.areaName+"</option>";
    		}
    	});
    	$("#Provinces").html(options);
    });
}
//获得城市
function getCity(code) {
    var option="<option value=>"+"区/县"+"</option>";
		$("#Countys").html(option);
	if(code==""){
		var ops="<option value=>"+"城市/地区/自治州"+"</option>";
		$("#Citys").html(ops);
	} else{
		$.getJSON('get_city?code='+code, function(data){
		var options="<option value=>"+"城市/地区/自治州"+"</option>";
		$.each(data,function(i,n) {
				if(code==n.code){
					options+="<option value='"+n.code+"' selected='selected'>"+n.areaName+"</option>";
				} else{
					options+="<option value='"+n.code+"'>"+n.areaName+"</option>";
				}
		});
		$("#Citys").html(options);
	});	
	}
}
//通过城市code获取地区
function getDistrict(code) {
	if(code==""){
		var opt="<option value=>"+"区/县"+"</option>";
		$("#Countys").html(opt);
	} else{
		$.getJSON('get_district?code='+code, function(data){
			var options="<option value=>"+"区/县"+"</option>";
	    	$.each(data,function(i,n) {
	    		if(code==n.code){
	    			options+="<option value='"+n.code+"' selected='selected'>"+n.areaName+"</option>";		
	    		} else{
	    			options+="<option value='"+n.code+"'>"+n.areaName+"</option>";	
	    		}
	    	});
	    	$("#Countys").html(options);
		});	
	}	
}
function checkMobile(str) {
	var  re = /^1\d{10}$/;
	 if (re.test(str)) {
  		 return true;
	} 
	 return false;
}
function checkConsignee(str) {
	if(str.length<30&&str.length>1){
		return true;
	}
	if(str.length>30){
 			$("#tipMsg_consignee").html("名字输入过长");
 			return false;
 		}
 		if(str.length<2){
 			$("#tipMsg_consignee").html("名字输入过短");
 			 return false;
 		}
 	return false;
}
function checkAreaCode(str) {
	if(str.length==6){
		return true;
	} else{
		$("#tipMsg_street").html("请选择地址所在地");
	}
}
function checkStreet(str) {
	if(str.length>5&&str.length<30){
		return true;
	} else{
		$("#tipMsg_street").html("请输入5-30字的地址信息");
		 return false;
	}

}
//地址选中
function addressSelected(id){
	$("#edit"+id).show();
	$("#delete"+id).show();
	var Checkout = $(".Checkout");
	for(var i=0;i<Checkout.length;i++){
		var value = Checkout[i].value;
		if(id == value){
			$("#"+id).addClass("selected");
			$("#addressId").val(id);
		} else{
			$("#"+value).removeClass("selected");
			$("#edit"+value).hide();
			$("#delete"+value).hide();
		}
	}
}
//编辑地址
function editAddress(addressItem){
	$("#tipMsg_consignee").hide();
	$("#tipMsg_telephone").hide();
	$("#tipMsg_street").hide();
	$("#Consignee").val(addressItem.address.consignee);
	$("#Telephone").val(addressItem.address.mobile);
	$("#Street").val(addressItem.address.street);
	var areaCode = addressItem.address.areaCode;
	var cityCode =100*(Math.round(parseInt(areaCode)/100));
	var provinceCode =10000*(Math.round(parseInt(areaCode)/10000));
	getProvince(provinceCode);
	getCity(cityCode);
	getDistrict(areaCode);
	$("#editAddressOK").attr("name",addressItem.address.id);
	$("#J_editAddrBackdrop").show();
	$("#J_editAddrBox").show();
}
function editOK(id){
	var consignee = $("#Consignee").val();
 		var telephone = $("#Telephone").val();
 		var countys = $("#Countys").val();
 		var areaCode = countys;
 		if(countys==""){
 			areaCode = $("#Citys").val();
 		}
 		var street = $("#Street").val();
 		if(checkStreet(street)&&checkConsignee(consignee)&&checkAreaCode(areaCode)&&checkStreet(street)){
 			$("#J_editAddrBackdrop").hide();
 			$("#J_editAddrBox").hide();
 			$.post('ajax_address_edit.do',{consignee:consignee,mobile:telephone,areaCode:areaCode,street:street,addressId:id},function(data){
				if(data!=null&&data!=""){
					var da = $.parseJSON(data);
					var countysName;
					if(countys!=""){
						countysName = $("#Countys").find("option:selected").text();
					} else{
						countysName = "";
					}
					var provinceName = $("#Provinces").find("option:selected").text();
 					var cityName = $("#Citys").find("option:selected").text();
					var d="<dl id='"+da.address.id+"' class='item' onclick='addressSelected("+da.address.id+")'><dt><strong class='itemConsignee'>"+da.address.consignee+"</strong></dt><dd><p class='tel itemTel'>"+da.address.mobile+"</p><p class='itemRegion'>"+provinceName+" "+cityName+" "+countysName+"</p><p class='itemRegion'>"+da.address.street+"</p><span id='edit"+da.address.id+"' class='edit-btn J_editAddr' onclick='editAddress("+data+")'>编辑</span></dd><dd style='display:none'><input type='radio'  class='Checkout' value='"+da.address.id+"'/></dd></dl>";		
					if(id!=""){
						$("#"+id).replaceWith(d);
						$("#editAddressOK").attr("name","");
						$("#Consignee").val("");
						$("#Telephone").val("");
						$("#Street").val("");
						addressSelected(id);
					} else{
						$("#checkoutAddrList").prepend(d);  
						addressSelected(da.address.id); 
					}
				
				} else{
					alert("操作失败");
				}
			});
 		} else{
 			if(!checkConsignee(consignee)){
 				$("#tipMsg_consignee").show();	
 			}
 			if(!checkMobile(telephone)){
 				$("#tipMsg_telephone").show();	
 			}
 			if(!checkAreaCode(countys)){
 				$("#tipMsg_street").show();	
 			}
 			if(!checkStreet(street)){
 				$("#tipMsg_street").show();
 			}		
 		}	
}
function deleteAddress(id){
	if(confirm("确定要删除该收货地址吗？")){
		$.post('ajax_remove_address.do',{addressId:id},function(data){
			if(data!=null&&data!=""){
				window.location.reload();
			}
		});
	} 
}
$(document).ready(function(){
	//地址列表
	var a="";
	var b= "<div class='item use-new-addr' id='J_useNewAddr' onclick='addNewAddress()'>"+ "<span class='iconfont icon-add'>"+'&#xe624;'+"</span>" +"使用新地址"+"</div>";
	$.post('ajax_address_list', {},function(data){
		if(data!=""&&data!=null){
			var addressList = $.parseJSON(data);
			$.each(addressList,function(i,n){
				var addressItem = JSON.stringify(n);
				 a+="<dl id='"+n.address.id+"' class='item' onclick='addressSelected("+n.address.id+")'><dt>"+
				 "<strong class='itemConsignee'>"+n.address.consignee+"</strong></dt><dd><p class='tel itemTel'>"+n.address.mobile+"</p><p class='itemRegion'>"+n.wholeName+"</p><p class='itemRegion'>"+n.address.street+"</p>"+
				 "<a class='edit-btn J_editAddr' id='edit"+n.address.id+"' onclick='editAddress("+addressItem+")'>编辑</a><a class='edit-btn J_editAddr' style='margin-left:5px' id='delete"+n.address.id+"' onclick='deleteAddress("+n.address.id+")'>删除</a></dd><dd style='display:none'><input type='radio' class='Checkout' value='"+n.address.id+"'/></dd></dl>";		 
			});
			a+=b;  
			$("#checkoutAddrList").prepend(a);   
		} else{
			$("#checkoutAddrList").prepend(b);   
		}
	});
	//地址列表--END
	//选中地址
 	$("#J_editAddrCancel").click(function(){
 		$("#J_editAddrBackdrop").hide();
 		$("#J_editAddrBox").hide();
 	});
 	$("#Consignee").focus(function(){
 		$("#tipMsg_consignee").hide();
 	});
 	$("#Consignee").blur(function(){
 		var consignee = $("#Consignee").val();
 		if(!checkConsignee(consignee)){
 			$("#tipMsg_consignee").show();
 		}	
 	});
 	
 	$("#Telephone").focus(function(){
 		$("#tipMsg_telephone").hide();
 	});
 	$("#Telephone").blur(function(){
 		var telephone = $("#Telephone").val();
 		if(!checkMobile(telephone)){
 			$("#tipMsg_telephone").show();
 		}
 	});
 	
 	$("#Countys").focus(function(){
 		$("#tipMsg_street").hide();
 	});
 	$("#Street").focus(function(){
 		$("#tipMsg_street").hide();
 	});
 	$("#Street").blur(function(){
 		var street = $("#Street").val();
 		if(!checkStreet(street)){
 			$("#tipMsg_street").show();
 		}
 	});
 	$('input, textarea').placeholder();
});