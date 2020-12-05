<style>
    * {
        margin: 0;
        padding: 0;
    }

    a:hover, a:focus {
        text-decoration: none
    }


    .mobile-nav ul li a {
        color: white;
        font-size: 1.2em;
        display: block;
        padding: 1em 15%;
        border-bottom: 1px solid #1a6840;
        transition: all 0.2s ease-out;
        cursor: pointer;
    }

    .mobile-nav {
        position: fixed;
        top: 0;
        left: 0;
        width: 180px;
        height: 100%;
        background-color: #40a070/*#70C570*/;
        z-index: 9999;
        transition: all 0.3s ease-in;
    }

    .mobile-nav ul li a:hover {
        background-color: #c6dfc8;
        color: #ffffff;
    }
    .mobile-nav ul li ul{
        /*position: absolute;top:40px;left: 0;*/
        display: none;
    }

</style>

<div id="mobile-menu" class="mobile-nav "style="width: 245px">
    <ul id="leftRoot">
        <li><a href="/diancan/home/homeList"><img src="/diancan/img/统计分析.png"> &nbsp; 统计信息</a></li>
        <li><a href="/diancan/admin/list"><img src="/diancan/img/实时监控(1).png"> &nbsp; 餐厅管理员</a></li>
        <li><a href="/diancan/picture/list"><img src="/diancan/img/运营管理.png"> &nbsp; 轮播图管理</a></li>
        <li><a href="/diancan/leimu/list"><img src="/diancan/img/类目 品类 分类 类别.png"> &nbsp; 菜品类目管理</a></li>
        <li><a href="/diancan/food/init?nextUrl=/diancan/food/list"><img src="/diancan/img/食物-8.png"> &nbsp; 菜品管理</a></li>
        <li><a href="/diancan/material/list"><img src="/diancan/img/食材.png"> &nbsp; 食材管理</a> </li>
        <li><a href="/diancan/adimOrder/list"><img src="/diancan/img/表格-处理.png"> &nbsp; 菜品订单</a></li>
        <li><a href="/diancan/foodMenu/excel"><img src="/diancan/img/书本.png"> &nbsp; 菜谱管理</a></li>
<#--        <li><a href="/diancan/adminPaihao/list">排号管理</a></li>-->
        <li><a href="/diancan/logoutAdmin"><img src="/diancan/img/表格-解除合作.png"> &nbsp; 退出登陆</a></li>

    </ul>
</div>
