layui.use(['form', 'layer','upload'], function() {
    var form = layui.form
        , layer = layui.layer
        ,upload = layui.upload;
    // var myselect =document.getElementById("companynature2");
    // var index = myselect.selectedIndex;
    // var companynature = myselect.options[index].value;
    // var companynature = $("#companynature2").val();
    // form.on('select(companynature2)', function(data){
    //     console.log(companynature);
    // })
    var uploadInst = upload.render({
        elem: '#test8' //绑定元素
        ,url: path+'/Enterprise/uplodFile' //上传接口
        ,auto: false
        ,accept: 'file'
        ,multiple:true
        ,bindAction: '#perfect'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
        ,choose: function(obj){  //上传前选择回调方法
            obj.preview(function(index, file, result){
                console.log(file);            //file表示文件信息，result表示文件src地址
                $("#companypics").empty("");
                $("#companypics").text(file.name);
                $("#companypic").attr('src', result);
            });
        }
        ,before: function(obj) {
            this.data = {//要传递的数据
                companyname:$("#companyname").val(),
                permit:$("#permit").val(),
                companyadd:$("#companyadd").val(),
                companynature:$("#companynature2").val(),
                companybusiness:$("#companybusiness").val(),
                companynum:$("#companynum").val(),
                companyphone:$("#companyphone").val(),
                companypro:$("#companypro").val(),
                // companypic:$("#companypic").val()

            }
        }

        ,done: function(res){
            if(res.code == 0){
                //上传完毕回调
                alert("上传成功！");
                window.location.reload()
            }
            if(res.code == 1){
                //上传完毕回调
                alert("文件类型不匹配！");
            }
            if(res.code == 2){
                //上传完毕回调
                alert("文件或其他信息不能为空！");
            }
        }
        ,error: function(){
            //请求异常回调
            alert("上传失败！");
        }
    });

});