<html>
<#include "../zujian/top.ftlh">
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 72px">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">批量导入菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/list">查看所有菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/index">添加单个菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/export">导出菜品到Excel</a> </li>
                <li class="nav-item dropdown">
                </li>
            </ul>
        </div>
    </div>
</nav>
</br>

<div id="wrapper" class="toggled">
    <#--内容区域头部样式-->
<#--    <h2 class="bg-info text-white p-3  text-center">批量导入菜品</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">

    <#--主要内容content-->
    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-8 offset-1 column">
                <form action="/diancan/food/uploadExcel" method="post"
                      enctype="multipart/form-data">
                    <input class="form-control-lg mt-5 mb-2" type="file" name="file">
                    <p><input class="btn-lg btn-success " type="submit" value="提交"></p>
                </form>
                <h1>注意事项</h1>
                <p>1，文件必须是excel</p>
                <p>2，excel内容的列必须和下图一一对应，下图仅供参考</p>
                <img class="img-responsive img-lg" src="/diancan/img/foods.png"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>