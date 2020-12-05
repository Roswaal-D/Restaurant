<html>
<#include "../zujian/top.ftlh">

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">

        <div class="text-left collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"> <a class="nav-link" href="#">统计信息</a> </li>
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
<#--    <h2 class="bg-info text-white p-3  text-center">统计信息页</h2>-->
    <#--左边栏-->
    <#include "../zujian/left.ftlh">
    <#--主要内容content-->
    <div id="page-content-wrapper" class="container">
        <div class="row clearfix">
            <#--每月收入-->
            <div class="col-md-10 offset-md-1 column">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="table-info">
                        <th>月份</th>
                        <th>月度收入(元)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list totalMoneyList as money>
                        <tr>
                            <td>${money.time!''}</td>
                            <td>${money.totalMoney!''}</td>
                        </tr>
                    </#list>
                    <tr>
                        <th>年度总收入(元)</th>
                        <td>${yearMoney!''}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <#--需要补货商品-->
            <div class="col-md-10 offset-md-1 column mt-5">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="table-danger">
                        <th colspan="2">需要补货的食材</th>
                    </tr>
                    <tr class="table-info">
                        <th>食材名</th>
                        <th>库存</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list matList as mat>
                        <tr>
                            <td>${mat.matName!''}</td>
                            <td>${mat.matStock!''}</td>
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