$(document).on('change', '#product_prototype_id', function() {
  var solidus_prototypes_select = $('#product_prototype_id');
  var id = solidus_prototypes_select.val();
  if (id.length) {
    var url = Spree.pathFor("admin") + "/prototypes/" + id;
    $('#product-from-prototype').load(url);
    $('#product_taxons_field :input, #product_option_types_field :input').prop('disabled', true);
    $('#product_taxons_field, #product_option_types_field').hide();
  } else {
    $('#product_taxons_field :input, #product_option_types_field :input').prop('disabled', false);
    $('#product_taxons_field, #product_option_types_field').show();
    $('#product-from-prototype').empty();
  }
});
