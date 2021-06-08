$(function (){
				var map = new BMap.Map("allmap");
				var point = new BMap.Point(116.331398,39.897445);
				map.centerAndZoom(point,12);
				
				var geolocation = new BMap.Geolocation();
				
   				geolocation.getCurrentPosition(function(r){
		        	if(this.getStatus() == BMAP_STATUS_SUCCESS){
		            var mk = new BMap.Marker(r.point);
		            map.addOverlay(mk);
		            map.panTo(r.point);
		            // alert('您的位置：'+r.point.lng+','+r.point.lat);
		            $('#lat').val(r.point.lat);//获取到的纬度
		            $('#lon').val(r.point.lng);//获取到的经度
		
		            var gc = new BMap.Geocoder();
		            var pointAdd = new BMap.Point(r.point.lng, r.point.lat);
		            gc.getLocation(pointAdd, function(rs){
		                // 百度地图解析城市名
		                var cityName = rs.addressComponents.city;
		                $('#addr').text(cityName);
		                //将定位到的放到cookie中
		            		 var date = new Date();
		            		 var expireDays=10;
		            		 date.setTime(date.getTime()+expireDays*24*3600*1000);
		            		 document.cookie =  "sch_city=" + encodeURI(cityName,"UTF-8") + ";expire=" + date.toGMTString();
		            })
		        	}
		        	else {
		        		 $('#addr').text("定位失败");
		           		 alert('failed'+this.getStatus());
		        	}
		    	},{enableHighAccuracy: true});
			});