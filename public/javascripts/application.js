// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var ShipmentApp = {};
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

$('.new_shipment #shipment_card_id').live('change', function() {
	$.get('/shipment/find?' + 'card=' + $('#shipment_card_id').val(),
		function(data) {
      $('#new_shipment #destination_div').html(data);
      $('.new_shipment #shipment_destination').val($('#mem_addr').val());
      $('#mem_phone').val('Phone : '+$('#mem_phone_hid').val());
		});
});
