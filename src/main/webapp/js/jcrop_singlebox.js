var		simg_width,
		simg_height,
		jcrop_api,
		c_x1,
		c_y1,
		c_w,
		c_h,
		wh_ratio,
		img_type,
		img_url,
		img_h,
		img_w,
		submit_url,
		img_ratio,
		rtVal;

function jcrop_single(uploadInfo){
	
		init(uploadInfo);
		 
		$("#crop_img").width(simg_width+'px');
		$("#crop_img").height(simg_width/wh_ratio+'px');
		$("#crop_img").attr("src",img_url);
		
		jcrop_api=$.Jcrop("#crop_img");
		jcrop_api.setOptions({
	  		onChange: updateInfo,
	  		onSelect: updateInfo,
	  		aspectRatio: uploadInfo.ratio}
	  	);  

	  	jcrop_api.setSelect([50, 50, 150, 50+100*uploadInfo.ratio]);
	  	
		function updateInfo(c){
			if (parseInt(c.w) > 2){
				c_x1 = c.x;
				c_y1 = c.y;
				c_w = c.w;
				c_h = c.h;
			}
			else if(parseInt(c.w) < 3){
				var x = c.x;
				var y = c.y;
				var dy = simg_width/2/uploadInfo.ratio;
				jcrop_api.animateTo([x-simg_width/4, y-dy/2, x+simg_width/4, y+dy/2]);
			}
	 	};
};

function init(uploadInfo){
	wh_ratio=uploadInfo.width/uploadInfo.height;
	img_url = uploadInfo.url;
	img_h = uploadInfo.height;
	img_w = uploadInfo.width;
	submit_url = uploadInfo.submit_url;
	if(img_w<600)
		simg_width=img_w;
	else
		simg_width=600;
	img_ratio = simg_width/img_w;
}

function crop_submit(){
	var type=img_type;
 	$.ajax({
         type: "POST",
         url: submit_url,
         data: {
         		imgUrl:img_url,
         		imgInitW:0,
         		imgInitH:0,
         		imgW:img_w,
         		imgH:img_h,
         		imgX1:c_x1/img_ratio,
         		imgY1:c_y1/img_ratio,
         		cropW:c_w/img_ratio,
         		cropH:c_h/img_ratio
         		},
         success: function(data){
                data = data.replace(/<[^>{}].*?>/g,"");
                rtVal = eval('(' + data + ')');
                if(rtVal.status == "success"){
                	$("#user_head_img").attr("src",rtVal.url);
                	$("#old_headImg>img").attr("src",rtVal.url);
                	window.location.reload();
                }else if(rtVal.status == "error"){
               		alert(rtVal.errMsg);
                }else{
               		alert("提交发生异常");
                }
                jcrop_api.destroy();
               
          },
          error: function(data){
          		alert("提交失败"+data);
          		jcrop_api.destroy();
          }
 	});
};