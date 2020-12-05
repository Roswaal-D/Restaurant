<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 72px">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">菜品类目管理</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/leimu/detail">添加单个类目</a> </li>
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
<#--    <h2 class="bg-info text-white p-3  text-center">菜品类目管理</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">
    <#--主要内容content-->
    <div id="page-content-wrapper" class="container">
        <#--添加类目-->
<#--        <button class="btn btn-warning text-white my-3" onclick="window.parent.location.href='/diancan/leimu/detail';">-->
<#--            添加单个类目-->
<#--        </button>-->
<#--        &lt;#&ndash;添加类目&ndash;&gt;-->
<#--        <button class="btn btn-info text-white my-3" onclick="window.parent.location.href='/diancan/leimu/excel';">-->
<#--            批量导入类目-->
<#--        </button>-->
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-bordered ">
                    <thead>
                    <tr class="table-info">
                        <th>类目Id</th>
                        <th>名字</th>
                        <th>类目Type</th>
                        <th>创建时间</th>
                        <th>修改时间</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list leimuList as leimu>
                        <tr>
                            <td>${leimu.leimuId}</td>
                            <td>${leimu.leimuName}</td>
                            <td>${leimu.leimuType}</td>
                            <td>${leimu.createTime!''}</td>
                            <td>${leimu.updateTime!''}</td>
                            <td><a href="/diancan/leimu/detail?leimuId=${leimu.leimuId}">修改</a>
                            <td><a href="/diancan/leimu/remove?leimuId=${leimu.leimuId}">删除</a>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>