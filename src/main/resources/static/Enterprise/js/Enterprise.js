layui.use('element', function(){
    var element = layui.element;

});
function changePath(node) {
    var  divNode = document.getElementById("iframe_div");
    divNode.src = node.title;
}
$(function(){
    var path = $("#path").val();
    var role = $("#role").val();
    if (role ==='企业人员') {
        $.ajax({
            type: "POST",
            url: path + "/Enterprise/Initialize",
            dataType: "text",
        })
    }
})