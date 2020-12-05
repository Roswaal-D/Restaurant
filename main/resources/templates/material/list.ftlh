<html>
<#include "../zujian/top.ftlh">
<#--<head>-->
<#--    <script>-->
<#--        document.getElementById('gt').onclick =function (){-->
<#--            alert("OKK")-->
<#--            document.getElementById()-->
<#--        }-->
<#--    </script>-->
<#--</head>-->
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 72px">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">食材管理</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/material/index">添加单个食材</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/material/excel">批量导入食材</a> </li>
<#--                <li class="nav-item"> <a class="nav-link" href="/diancan/food/export">导出食材列表到Excel</a> </li>-->
                <li class="nav-item dropdown">
                </li>
            </ul>
        </div>
    </div>
</nav>
</br>
</br>

<div id="wrapper" class="toggled">
    <#--左边栏-->
    <#include "../zujian/left.ftlh">
    <div class="row clearfix" style="position: absolute; left: 300px ;top: 100px ;width: 1360px">
        <div class="col-md-12 column" >
            <table class="table table-striped table-bordered table-sm">
                <thead>
                <tr class="table-info">
                    <th>食材id</th>
                    <th>食材名称</th>
<#--                    <th>单价</th>-->
                    <th>库存</th>
<#--                    <th>菜品描述</th>-->
                    <th>类目</th>
<#--                    <th>图片</th>-->
                    <th>创建时间</th>
                    <th>修改时间</th>
<#--                    <th>补货</th>-->
                    <th colspan="2">操作</th>

                </tr>
                </thead>

                <tbody>

                <#list materialPage.content as mat>
                    <tr>
                        <td>${mat.matId}</td>
                        <td>${mat.matName}</td>
                        <td>${mat.matStock}</td>
                        <td>${mat.leimuType}</td>
                        <td>${mat.createTime}</td>
                        <td>${mat.updateTime}</td>
                        <td>
                            <form role="form" method="post" action="/diancan/material/addStock">
                                <input name="addNum" type="number"/>
                                <input hidden name="matId" type="number" value="${(mat.matId)!''}"/>
                                <input hidden name="matStock" type="number" value="${(mat.matStock)!''}"/>
                                <button type="submit">补货</button>
                            </form>
<#--                            <input id="addNum" type="number" value=""/>-->
<#--                            <a href="/diancan/material/addStock?addNum=#{addNum.value}&matId=${mat.matId}" >补货</a>-->
<#--                           <button onclick="window.location.href='http://localhost:8080//diancan/material/addStock?addNum='document.getElementById(addNum).value">document.getElementById(addNum).value-->
<#--                            补货okm-->

<#--                            </button>-->
<#--                            <button id="gt">补货yah</button>-->
                        </td>
                        <td><a href="/diancan/material/index?matId=${mat.matId}">修改</a>
                        </td>
<#--                        <td><a href="/diancan/material/remove?matId=${mat.matId}">删除</a>-->
<#--                        </td>-->
                    </tr>
                </#list>
                </tbody>
            </table>

        </div>
        <#--分页-->
        <div class="col-md-12 column">
            <ul class="pagination">
                <#if currentPage lte 1>
                    <li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
                <#else>
                    <li class="page-item"><a class="page-link"
                                             href="/diancan/material/list?page=${currentPage - 1}&size=${size}">上一页</a>
                    </li>
                </#if>

                <#list 1..materialPage.getTotalPages() as index>
                    <#if currentPage == index>
                        <li class="page-item disabled"><a class="page-link" href="#">${index}</a></li>
                    <#else>
                        <li class="page-item"><a class="page-link"
                                                 href="/diancan/material/list?page=${index}&size=${size}">${index}</a>
                        </li>
                    </#if>
                </#list>

                <#if currentPage gte materialPage.getTotalPages()>
                    <li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
                <#else>
                    <li class="page-item"><a class="page-link"
                                             href="/diancan/material/list?page=${currentPage + 1}&size=${size}">下一页</a>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</div>

</body>

</html>