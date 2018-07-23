<%--
  Created by IntelliJ IDEA.
  User: zhangyun
  Date: 2018/7/23
  Time: 上午10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>高德地图API使用</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
            border: 0;
        }
        select{
            style:none;
            background-color: transparent;
        }
        .sel-btn {
            width: 60px;
            line-height: 30px;
            height: 22px;
            border: 1px solid #ccc;
            vertical-align: middle;
        }
        h1,h3{
            text-align: center;
            line-height: 50px;
        }
        h3 {
            line-height: 30px;
        }

        #container {
            position: absolute;
            top: 80px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }

    </style>
    <%--<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>--%>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.8&key=5b399cc0768ef34fb15b8dfbeadf6bbc"></script>
</head>
<body>
<h1>基于Storm的实时区域游客量热力图统计</h1>
<h3>刷新频率:
    <select class="sel-btn">
        <option>30秒</option>
        <option>60秒</option>
        <option>90秒</option>
    </select>
</h3>

<div id="container"></div>
<script type="text/javascript">
    // 2D
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [121.4737, 31.23037],
        zoom: 10
        // mapStyle: 'dark'
    });

    // map.setFeatures(['road','point'])

    // map.plugin(["AMap.MouseTool"], function() {
    //     var mouseTool = new AMap.MouseTool(map);
    //     //通过rectOptions更改拉框放大时鼠标绘制的矩形框样式
    //     //mouseTool.rectZoomIn(rectOptions);
    //     mouseTool.rule();
    // });

    map.plugin(["AMap.ToolBar"], function() {
        map.addControl(new AMap.ToolBar());
    });


    //在地图中添加MouseTool插件
    // map.plugin(["AMap.MouseTool"], function() {
    //     var mouseTool = new AMap.MouseTool(map);
    //     //鼠标工具插件添加draw事件监听
    //     AMap.event.addListener(mouseTool, "draw", function callback(e) {
    //         var eObject = e.obj;//obj属性就是鼠标事件完成所绘制的覆盖物对象。
    //     });
    //     mouseTool.measureArea();  //调用鼠标工具的面积量测功能
    // });


    // 3D
    // var map = new AMap.Map('container', {
    //     pitch:75, // 地图俯仰角度，有效范围 0 度- 83 度
    //     viewMode:'3D', // 地图模式
    //     zoom:17,
    //     expandZoomRange:true,
    //     zooms:[3,20],
    //     center:[121.4737, 31.23037]
    // });

    // 热力图: 静态数据
    var heatmap;
    // var points =[
    //     {"lng":121.291031,"lat":31.238585,"count":1000},
    //     {"lng":121.389275,"lat":31.235818,"count":110},
    //     {"lng":121.287444,"lat":31.230742,"count":12},
    //     {"lng":121.481707,"lat":31.230089,"count":1300},
    //     {"lng":121.410588,"lat":31.230172,"count":14},
    //     {"lng":121.394816,"lat":31.23181,"count":15},
    //     {"lng":121.416002,"lat":31.232917,"count":160}
    // ];
    var points = ${dataJson}

    map.plugin(["AMap.Heatmap"],function() {      //加载热力图插件
        heatmap = new AMap.Heatmap(map, {
            radius: 50,  // 给定半径
            opacity: [0,0.8]
        });    //在地图对象叠加热力图
        heatmap.setDataSet({data:points,max:100}); //设置热力图数据集
        //具体参数见接口文档
    });


</script>
</body>
</html>
