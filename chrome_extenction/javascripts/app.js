// $(".tweet-box.rich-editor.notie").delay(2000).html("kkk");
// memo http://stackoverflow.com/questions/3857874/how-to-dynamically-insert-a-script-tag-via-jquery-after-page-load

$.getJSON("http://localhost:3000/operations/search?target_url=" + document.URL, function(json){
  $.getJSON("http://localhost:3000/operations/" + json.operation.id + ".json?programing_language_name=JavaScript", function(json){
      if(json.program === null) { console.log("not found target_url"); return; }
      var script_tag = $("<script>");
      script_tag.html(json.program.code);
      $("html").append(script_tag);
  });
});
