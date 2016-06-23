$(document).ready(function(){

	var canvas = $("#skill canvas");
	var context = canvas.get(0).getContext("2d");

	//画布大小
	var canvasWidth = canvas.width();
	var canvasHeight = canvas.height();

	//分数/y轴tag
	var score1 = "20";
	var score2 = "40";
	var score3 = "60";
	var score4 = "80";
	var score5 = "100";

	//x轴tag
	var list1 = "java";
	var list2 = "JS + jQuery";
	var list3 = "其它";
	var play;
	var flag = false;

	//x，y轴
	var Axis = function(x,y,v)
	{
		this.x = x;
		this.y = y;
		this.v = v;
	}

	//柱状图
	var Pillar = function(x,y,h,color)
	{
		this.x = x;
		this.y = y;
		this.h = h;
		this.color = color;
	}

	//栅格
	var Grid = function(x,y)
	{
		this.x = x;
		this.y = y;
	}

	function init(){

		$(".control").hide();

		//实现播放动画效果
		//根据flag的值来确定是重新播放还是继续播放
		$(".button").click(function(e){
			e.preventDefault();
			$(".UI").hide();
			$(".control").show();
			$(".control .stop").show();
			$(".control .again").hide();
			play = true;

			if (flag) 
			{
				animate();
			}else{
				startPlay();
			}
		});

		//实现暂停效果
		$(".control .stop").click(function(e){
			e.preventDefault();
			flag = true;
			play = false;
			$(".UI").show();
			$(".control").hide();
			animate();
		});

		//实现重新播放动画
		$(".control .again").click(function(e){
			e.preventDefault();
			flag = false;
			play = true;
			/*$(".control").show();*/
			$(".control .stop").show();
			$(".control .again").hide();
			context.clearRect(0,0,canvasWidth,canvasHeight);
			startPlay();
		});

	};

	//开始函数
	function startPlay(){
		//重置x,y轴数据
		xAxis = new Axis(50,350,3);
		yAxis = new Axis(50,350,2);

		animate();
	}

	function animate(){

		context.font = "10px sans-serif";

		//实现对不同的y轴位置画出不同的分数和栅格
		switch (yAxis.y)
		{
		case 290:
			//添加 分数为20 的tag
			//下面类推 20 40 60 80
		  	context.fillText(score1, yAxis.x-23 ,yAxis.y);
		  	//画出栅格
		  	//下面类推
		  	var grid = new Grid(yAxis.x,yAxis.y);
		  	addGrid(grid.x,grid.y);
		  	break;
		case 230:
		  	context.fillText(score2, yAxis.x-23 ,yAxis.y);
		  	grid = new Grid(yAxis.x,yAxis.y);
		  	addGrid(grid.x,grid.y);  	
		  	break;
		case 170:
		  	context.fillText(score3, yAxis.x-23 ,yAxis.y);
		  	grid = new Grid(yAxis.x,yAxis.y);
		  	addGrid(grid.x,grid.y);
		  	break;
		case 110:
		  	context.fillText(score4, yAxis.x-23 ,yAxis.y);  	
		  	grid = new Grid(yAxis.x,yAxis.y);
		  	addGrid(grid.x,grid.y);
		  	break;
		case 50:
		  	context.fillText(score5, yAxis.x-23 ,yAxis.y);
		  	grid = new Grid(yAxis.x,yAxis.y);
		  	addGrid(grid.x,grid.y);
		  	break;
		default:
			break;
		}

		//switch语句实现在不同的x轴位置画上不同的tag和柱状图
		switch (xAxis.x)
		{
		case 170:
			context.fillStyle="#000";
		  	context.fillText(list1, xAxis.x-33 ,xAxis.y+20);
		  	var pillar = new Pillar(xAxis.x - 20,xAxis.y,240,"#0066CC");
		  	addPillar(pillar.x,pillar.y,pillar.h,pillar.color);
		  	break;

		case 320:
			context.fillStyle="#000";
		  	context.fillText(list2, xAxis.x-53 ,xAxis.y+20);
		  	pillar = new Pillar(xAxis.x - 20,xAxis.y,210,"#0099CC");
		  	addPillar(pillar.x,pillar.y,pillar.h,pillar.color);
		  	break;

		case 470:
			context.fillStyle="#000";
		  	context.fillText(list3, xAxis.x-33 ,xAxis.y+20);
		  	pillar = new Pillar(xAxis.x - 20,xAxis.y,180,"#42ACCC");
		  	addPillar(pillar.x,pillar.y,pillar.h,pillar.color);
		  	break;
		default:
			break;
		}

		//x轴画完时绘制出箭头
		if(xAxis.x == 551)
		{
			xAxis.v=0;

			context.fillStyle = "#000";
			context.beginPath();
			context.moveTo(xAxis.x - 5,xAxis.y -5);
			context.lineTo(xAxis.x,xAxis.y);
			context.lineTo(xAxis.x - 5,xAxis.y + 5);
			context.closePath();
			context.fill();

		};

		//y轴画完时绘制出箭头
		if(yAxis.y == 30)
		{
			yAxis.v=0;

			context.fillStyle = "#000";
			context.beginPath();
			context.moveTo(yAxis.x - 5,yAxis.y + 5);
			context.lineTo(yAxis.x,yAxis.y);
			context.lineTo(yAxis.x + 5,yAxis.y + 5);
			context.closePath();
			context.fill();
		};

		//x，y轴都完成时停止动画，隐藏stop按钮，出现play again 按钮
		if ((xAxis.x == 551) && (yAxis.y == 30))
		{
			play = false;
			clearTimeout(aniTimeOut);
			$(".control").show();
			$(".control .stop").hide();
			$(".control .again").show();
		};

		//开始绘制	
		if( play == true){
			//x轴
			xAxis.x += xAxis.v;

			context.fillStyle = "#000";
			context.beginPath();
			context.moveTo(xAxis.x - xAxis.v,xAxis.y);
			context.lineTo(xAxis.x,xAxis.y);
			context.closePath();
			context.stroke();

			//y轴
			yAxis.y -= yAxis.v;

			context.fillStyle = "#000";
			context.beginPath();
			context.moveTo(yAxis.x,yAxis.y + yAxis.v);
			context.lineTo(yAxis.x,yAxis.y);
			context.closePath();
			context.stroke();

			aniTimeOut = setTimeout(animate,33);
		}
		
	};

	//绘制栅格函数
	function addGrid(x,y){
		context.fillStyle = "#000";

		context.beginPath();
		context.moveTo(x+1, y );
		context.lineTo(x+5, y );
		context.closePath();
		context.stroke();
		
	}

	//绘制柱状图函数
	function addPillar(x,y,h,color){

		context.fillStyle = color;
		context.beginPath();
		context.moveTo(x-20, y - 1);
		context.lineTo(x-20, y - h);
		context.lineTo(x+20, y - h);
		context.lineTo(x+20, y - 1);
		context.closePath();
		context.fill();		
	}

	init();

});