$(document).on('change', '#product_prototype_id', function() {
  var solidus_prototypes_select = $('#product_prototype_id');
  var id = solidus_prototypes_select.val();
  if (id.length) {
    var url = Spree.pathFor("admin") + "/prototypes/" + id;
    $('#product-from-prototype').load(url);
  } else {
    $('#product-from-prototype').empty();
  }
});
