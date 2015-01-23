$(document).ready(function(){
	makeGrid(10);
	gradient();
	$('.reset').click(reset);
	$('.new').click(newGrid);
	$('.random').click(random);
	$('.opacity').click(opacity);
	$('.trail').click(trail);
	$('.black').click(black);


});

function makeGrid(col){
	var cell = $('#grid').find('table');
	for(var i = 0; i < col; i++){
		var row = $('<tr>');
		for(var j = 0; j<col; j++){
			row.append("<td><div class='cell'></div></td>");
		}
		cell.append(row);
	}
	
	var size = 750 / col;
	$('.cell').css({'width' : size +'px', 'height' : size+'px', 'opacity' : '0.5'});
}

function reset(){
	$('.cell').css({'background' : '#FAFAF8', 'opacity' : '0.5'});
	gradient();
}
function newGrid(){
	var col = prompt('Enter new size LxL: ');
	remove();
	makeGrid(col);
	reset();
	gradient();
}

function remove(){
	var col = $('table').find('tr').length;
	for(var i = 0; i < col; i++){
		var row = $('table').find('tr');
		row.remove();
	}
}

function random(){
	$('.cell').unbind();
	$('.cell').on('mouseenter', function(){
		$(this).css({"background": Color(), "opacity":'1'});	
	});
	
}
function Color(){
	var red = Math.floor(Math.random() * 256).toString(16);
	var green = Math.floor(Math.random() * 256).toString(16);
	var blue = Math.floor(Math.random() * 256).toString(16);
	return '#' +red+green+blue;
}

function opacity(){
	$('.cell').unbind();
	$('.cell').on('mouseenter', function(){
		var op = $(this).css('opacity');
		var next = op - 0.1;
		if(next > 0){
			$(this).css('opacity', next);
		}
		else{
			$(this).css('opacity', 0);
		}
	});
}
function gradient(){
	$('.cell').unbind();
	$('.cell').on('mouseenter', function(){
		var num = +$(this).css('opacity') + 0.1
		$(this).css({'background' : 'black',"opacity": num});

	});

}
function trail (){
	$('.cell').unbind();
	$('.cell').on('mouseenter', function(){
		$(this).css('opacity', 0);
	});
	$('.cell').on('mouseleave', function(){
		$(this).fadeTo('slow', 1);
	});

}

function black(){
	$('.cell').unbind();
	$('.cell').css({'background' : 'black', 'opacity' : '1'});
	trail();
}