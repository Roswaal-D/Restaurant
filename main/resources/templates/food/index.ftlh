<html>
<#include "../zujian/top.ftlh">

<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">添加单个菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/list">查看所有菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/excel">批量导入菜品</a> </li>
                <li class="nav-item"> <a class="nav-link" href="/diancan/food/export">导出菜品到Excel</a> </li>
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
                <form role="form" method="post" action="/diancan/food/save">
                    <div class="form-group">
                        <label>菜品名(必填)</label>
                        <input name="foodName" type="text" class="form-control"
                               value="${(food.foodName)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>菜品价格(必填)</label>
                        <input name="foodPrice" type="text" class="form-control"
                               value="${(food.foodPrice)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>菜品库存(必填)</label>
                        <input name="foodStock" type="number" class="form-control"
                               value="${(food.foodStock)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>食物描述(非必填)</label>
                        <input name="foodDesc" type="text" class="form-control"
                               value="${(food.foodDesc)!''}"/>
                    </div>

                    <div class="form-group">
                        <label>所属类目</label>
                        <select name="leimuType" class="form-control">
                            <#list leimuList as leimu>
                                <option value="${leimu.leimuType}"
                                        <#if (food.foodType)?? && food.foodType == leimu.leimuType>
                                            selected
                                        </#if>
                                >${leimu.leimuName}
                                </option>
                            </#list>
                        </select>
                    </div>
                    <input hidden type="text" name="foodId" value="${(food.foodId)!''}">
                    <div class="form-group">
                        <label>图片(必填)</label>
                        <img height="100" width="100" src="${(food.foodIcon)!''}" alt="">
                        <input name="foodIcon" type="text" class="form-control"
                               value="${(food.foodIcon)!''}"/>
                    </div>
                    <button type="submit" class="btn  btn-info">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>