<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">添加单个食材</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/material/list">查看所有食材</a> </li>
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
    <#--内容区域头部样式-->
<#--    <h2 class="bg-info text-white p-3  text-center">添加单个菜品</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">
    <#--主要内容content-->
    <div id="page-content-wrapper" class="container">
        <div class="row clearfix">
            <div class="col-md-8 offset-2 column">
                <form role="form" method="post" action="/diancan/material/save">
                    <div class="form-group">
                        <label>食材名(必填)</label>
                        <input name="matName" type="text" class="form-control"
                               value="${(material.matName)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>食材库存(必填)</label>
                        <input name="matStock" type="number" class="form-control"
                               value="${(material.matStock)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>所属类目</label>
                        <select name="leimuType" class="form-control">
                            <#list matTypeList as leimu>
                                <option
                                        value="${leimu.typeNum}"
                                        <#if (material.leimuType)?? && material.leimuType == leimu.typeNum>
                                            selected
                                        </#if>
                                >${leimu.typeName}
                                </option>
                            </#list>
                        </select>
                    </div>
                    <input hidden type="text" name="matId" value="${(material.matId)!''}">
                    <button type="submit" class="btn  btn-info">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>