<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 72px">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">轮播图管理</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/picture/index">添加轮播图</a> </li>
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
<#--    <h2 class="bg-info text-white p-3  text-center">轮播图管理</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">


    <#--主要内容content-->
    <div id="page-content-wrapper">
        <#--添加轮播图-->
<#--        <button class="btn btn-warning text-white my-3 offset-md-1"-->
<#--                onclick="window.parent.location.href='/diancan/picture/index';">-->
<#--            添加轮播图-->
<#--        </button>-->
        <div class="row clearfix">
            <div class="col-md-10 offset-md-1 column">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="table-info">
                        <th>图片id</th>
                        <th>图片描述</th>
                        <th>图片</th>
                        <th width="450px">图片url</th>
                        <th>创建时间</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <#list categoryList as category>
                        <tr>
                            <td>${category.picId}</td>
                            <td>${category.picMessage}</td>
                            <td><img height="50" width="50" src="${category.picUrl}" alt=""></td>
                            <td><a href="${category.picUrl}">${category.picUrl}</a> </td>
                            <td>${category.createTime}</td>
                            <td><a href="/diancan/picture/index?picId=${category.picId}">修改</a></td>
                            <td><a href="/diancan/picture/remove?picId=${category.picId}">删除</a></td>
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