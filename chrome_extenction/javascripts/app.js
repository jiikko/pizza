// $(".tweet-box.rich-editor.notie").delay(2000).html("kkk");
// memo http://stackoverflow.com/questions/3857874/how-to-dynamically-insert-a-script-tag-via-jquery-after-page-load

$.getJSON("http://localhost:3000/operations/search?url=" + document.URL, function(record){
  $.getJSON("http://localhost:3000/operations/" + record.id + ".json", function(json){
        var script_tag = $("<script>");
        script_tag.html(json.script);
        $("html").append(script_tag);
  });
});
