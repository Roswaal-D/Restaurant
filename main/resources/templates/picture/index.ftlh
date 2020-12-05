<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 72px">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">轮播图添加/修改</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/picture/list">查看轮播图</a> </li>
                <li class="nav-item dropdown">
                </li>
            </ul>
        </div>
    </div>
</nav>
</br>
</br>

<div id="wrapper" class="toggled">
    <#--内容区域头部样式-->
<#--    <h2 class="bg-info text-white p-3  text-center">轮播图添加/修改</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">

    <#--主要内容content-->
    <div id="page-content-wrapper" class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <form role="form" method="post" action="/diancan/picture/save">
                    <div class="form-group">
                        <label>图片url</label>
                        <input name="picUrl" type="text" class="form-control"
                               value="${(category.picUrl)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>图片描述</label>
                        <input name="picMessage" type="text" class="form-control"
                               value="${(category.picMessage)!''}"/>
                    </div>
                    <input hidden type="text" name="picId"
                           value="${(category.picId)!''}">
                    <button type="submit" class="btn  btn-info">提交</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>