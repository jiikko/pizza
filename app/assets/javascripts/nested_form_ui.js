(function ($) {
  $(document).on("click", "input[data-role=search-operation]", function() {
    $("ul.result li").remove();

    $.getJSON("/ajax/operations", function(json){
      var $li, $link;
      $.each(json.operations, function(_index, item) {
        $li = $("<li>");
        $link = $("<a>");
        $link.attr({
          "data-operation-id": item.id,
          "data-operation-name": item.name,
          "href": "javascript:void(0)",
          "data-association": "scenario_operations",
          "data-blueprint-id": "scenario_operations_fields_blueprint",
          "class": "add_nested_fields",
          "data-target": "#scenario_operation_list"
        });
        $link.html(item.name);
        $li.html($link);
        $("ul.result").append($li);
      });
    });
  });

  // defne you
  $(document).on("nested:fieldAdded", "[data-role=search-operation-form]", function(event) {
    var name_field;
    name_field = event.field.find('.name');
    return name_field.val($(event.link).data('predefined-name'));
  });
}(jQuery));
