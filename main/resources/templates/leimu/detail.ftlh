<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">添加单个类目</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/leimu/list">查看菜品类目</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/leimu/excel">批量导入类目</a> </li>
                <#--                <li class="nav-item"> <a class="nav-link" href="/diancan/food/export">导出菜品到Excel</a> </li>-->
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
<#--    <h2 class="bg-info text-white p-3  text-center">添加菜品类目</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">
    <#--主要内容content-->
    <div id="page-content-wrapper" class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <form role="form" method="post" action="/diancan/leimu/save">
                    <div class="form-group">
                        <label>类目名</label>
                        <input name="leimuName" type="text" class="form-control"
                               value="${(leimu.leimuName)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>类目type</label>
                        <input name="leimuType" type="number" class="form-control"
                               value="${(leimu.leimuType)!''}"/>
                    </div>
                    <input hidden type="text" name="leimuId" value="${(leimu.leimuId)!''}">
                    <button type="submit" class="btn  btn-info">提交</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>