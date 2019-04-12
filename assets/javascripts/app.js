$(document).ready(function(){
  if($("#pref_my_project").val()){
    $("#getPreferredProject").css("display", "inherit")
  }
  $("#pref_landing_page").change(function(){
    if($(this).val().startsWith("q")){
      $("#getPreferredProject").css("display", "inherit")
    }else{
      $("#getPreferredProject").hide()
    }
  })
})
