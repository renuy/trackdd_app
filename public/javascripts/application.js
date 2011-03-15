// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var ShipmentApp = {};

ShipmentApp.book_str = function(good){
  book_str = $(good).val();
  col_name = $(good).attr('name');
  book_no_col_name = '.new_shipment input[name="'+col_name.replace('book_no_str','book_no')+'"]';
  book_no = book_str.substring(1, book_str.length);
  $(book_no_col_name).val(book_no);
  $.get('/shipment/find_book?' + 'book_no=' + book_no+'&col_name='+col_name,
		function(data) {
      $('#new_shipment #title_div').html(data);
      col_name = $('#col_name_hid').val();
      title_col_name = '.new_shipment input[name="'+col_name.replace('book_no_str','title')+'"]';
      title = $('#title_hid').val();
      $(title_col_name).val(title);
		});
  
}

ShipmentApp.initForm = function (option, onload) {
  $('.new_shipment #div_deliver_goods').show();
  $('.new_shipment #div_pickup_goods').show();
  
	if (option == 'Deliver') {
		$('.new_shipment #div_pickup_goods').hide();
  }   
  
  if (option == 'Pickup'){
  	$('.new_shipment #div_deliver_goods').hide();
  }
  
};

$('.new_shipment input[name="shipment[action]"]:radio').live('change', function() {ShipmentApp.initForm($('.new_shipment input[name="shipment[action]"]:radio:checked').val(), false);});

$('.new_shipment #shipment_change_addr').live('change', function() {
  if  ('Y' == $('.new_shipment input[name="shipment[change_addr]"]:checked').val())
    $('.new_shipment #shipment_destination').attr('readOnly',false) ;
  else
    $('.new_shipment #shipment_destination').attr('readOnly',true) ;
});

$('.new_shipment #shipment_card_id').live('change', function() {
	$.get('/shipment/find_member?' + 'card=' + $('#shipment_card_id').val(),
		function(data) {
      $('#new_shipment #destination_div').html(data);
      $('.new_shipment #shipment_destination').val($('#mem_addr').val());
      $('#mem_phone').val('Phone : '+$('#mem_phone_hid').val());
      $('#mem_name').val('Name : '+$('#mem_name_hid').val());
		});
});

ShipmentApp.receive = function(link) {
alert($(link).val());
alert($(link).attr('name'));
debugger;
	if ($(link).val() == 'New')
    $(link).val('Confirmed');
  $(link).hide();
};

ShipmentApp.initStatForm = function (option, onload) {
	if (option == 'On' || option == 'Range') {
		$('.shipmentStat #div_start_date').show();
     
    if (option == 'Range'){
      $('.shipmentStat #div_end_date').show();
		}
    else
    {
      $('.shipmentStat #div_end_date').hide();
    }
	} else {
		$('.shipmentStat #div_start_date').hide();
		$('.shipmentStat #div_end_date').hide();
	}
};

$('.shipmentStat #Created').live('change', function() {ShipmentApp.initStatForm($('.shipmentStat #Created').val(), false);});
