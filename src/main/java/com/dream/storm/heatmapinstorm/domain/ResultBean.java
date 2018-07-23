package com.dream.storm.heatmapinstorm.domain;

/**
 * @Description: TODO
 * @Author: shouzhuangjiang
 * @Create: 2018-07-22 23:17
 */
public class ResultBean {

    /**
     * @Description:
     *
     *  var heatmap;
        var points =[
        {"lng":116.191031,"lat":39.988585,"count":10},
        {"lng":116.389275,"lat":39.925818,"count":11},
        {"lng":116.287444,"lat":39.810742,"count":12},
        {"lng":116.481707,"lat":39.940089,"count":13},
        {"lng":116.410588,"lat":39.880172,"count":14},
        {"lng":116.394816,"lat":39.91181,"count":15},
        {"lng":116.416002,"lat":39.952917,"count":16}
        ];
        map.plugin(["AMap.Heatmap"],function() {      //加载热力图插件
        heatmap = new AMap.Heatmap({map:map});    //在地图对象叠加热力图
        heatmap.setDataSet({data:points,max:100}); //设置热力图数据集
        //具体参数见接口文档
        });
     * @Date: 2018/7/22 下午11:18
     * @Param:
     */
    private double lng;

    private double lat;

    private long count;

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

}
